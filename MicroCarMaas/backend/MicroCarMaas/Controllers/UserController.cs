using MicroCarMaas.API.Data;
using MicroCarMaas.API.Models.Domain;
using MicroCarMaas.API.Models.DTO;
using MicroCarMaas.API.Repositories.Abstracts;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using System.Security.Claims;
using Microsoft.EntityFrameworkCore.Metadata.Internal;
using System.Text.Json;
using System.Xml;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion.Internal;
using AutoMapper;
using System.Text;

namespace MicroCarMaas.API.Controllers
{

    [Route("api/[controller]")]
    [ApiController]
    public class UserController : ControllerBase
    {
        private readonly AppDbContext _context;
        private readonly ITokenRepository tokenRepository;
        private readonly IUserRepository userRepository;
        private readonly IHttpClientFactory _clientFactory;

        public UserController(AppDbContext context, ITokenRepository tokenRepository,IMapper mapper,IConfiguration config,IUserRepository userRepository, IHttpClientFactory clientFactory)
        {
            _context = context;
            this.tokenRepository = tokenRepository;
            this.userRepository = userRepository;
            _clientFactory = clientFactory; 
        }


        [HttpPut]
        [Route("{token}")]
        public async Task<IActionResult> UpdateUser([FromRoute] string token, [FromBody] UserDto userDto)
        {
            try
            {
                var principal = tokenRepository.DecodeJwtToken(token);
                var phoneNumber = principal.Claims.FirstOrDefault(c => c.Type == ClaimTypes.MobilePhone).Value; 
                await userRepository.UpdateUserAsync(userDto, phoneNumber);

                return Ok("User updated successfully");
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"An error occurred while updating the user: {ex.Message}");
            }
        }
        [HttpDelete]
        [Route("{token}")]
        public async Task<IActionResult> DeleteUser([FromRoute] string token)
        {
            try
            {
                var principal = tokenRepository.DecodeJwtToken(token);
                var phoneNumber = principal.Claims.FirstOrDefault(c => c.Type == ClaimTypes.MobilePhone).Value;
                await userRepository.DeleteUserAsync(phoneNumber);

                return Ok("User deleted successfully");
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"An error occurred While deleting the user: {ex.Message}");
            }
        }   
        
        [HttpGet]
        public async Task<IActionResult> GetUsers()
        {
            try
            {
                List<UserDto> userDtoList = await userRepository.GetUsersAsync();
                if (userDtoList == null)
                {
                    return NotFound("No users found");
                } 
                else
                {
                    return Ok(userDtoList);
                }
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"An error occurred: {ex.Message}");
            }
        }

        [HttpPost]
        [Route("Login")]
        public async Task<IActionResult> Login(string phoneNumber)
        {
            try
            {
                await userRepository.CreateUserIfNotExistsAsync(phoneNumber);
                var userId = await userRepository.GetUserIdByPhoneNumberAsync(phoneNumber);
                await userRepository.AddUserRoleAsync(userId);

                var parameter = new SqlParameter("@PhoneNumber", phoneNumber);
                Console.WriteLine("parametre", parameter);
                List<User> users = _context.Users.FromSqlRaw("EXEC GetUsersByPhoneNumber @PhoneNumber", parameter).ToList();
                if (users.Count() != 0)
                {
                    var parameter1 = new SqlParameter("@UserId", users[0].Id.ToString());
                    Console.WriteLine(users[0].Id);
                    List<IdentityUserRole<System.Guid>> userRoles = _context.UserRoles.FromSqlRaw("EXEC GetUserRole @UserId", parameter1).ToList();
                    List<Guid> roles = new List<Guid>();
                    foreach (var role in userRoles)
                    {
                        roles.Add(role.RoleId);
                    }
                    var jwtToken = tokenRepository.CreateJWTToken(users[0], roles);
                    LoginResponseDto loginResponseDto = new LoginResponseDto();
                    loginResponseDto.JwtToken = jwtToken;
                    return Ok(loginResponseDto);
                }
                return NotFound("User not found");

            }
            catch (Exception ex) {
                return StatusCode(500, $"An error occurred: {ex.Message}");
            } 
        }

        internal async Task<IActionResult> UpdateUsersDrivingLicence(string userId, string drivingLicenceId)
        {
            try
            {
                var parameter1 = new SqlParameter("@UserId", userId);
                var parameter2 = new SqlParameter("@DrivingLicenceId", drivingLicenceId);
                _context.Database.ExecuteSqlRaw("EXEC UpdateUsersDrivingLicence @UserId, @DrivingLicenceId", parameter1, parameter2);

                return Ok("User updated successfully");
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"An error occurred: {ex.Message}");
            }
        }

        [HttpPost]
        [Route("ValidateIdentity")]
        public async Task<IActionResult> ValidateIdentity([FromBody] TcValidateDto tcValidateDto)
        {
            try
            {

                string isim = "Zeynep";
                string soyisim = "inan";
                string dogumyili = "2002";
                string tcno = "19903004534";


                var sonuc = await TCKimlikNoDogrula(isim, soyisim,
                    dogumyili,
                    tcno);
                if (sonuc == "true")
                {
                    return Ok();             
                        }
                else
                {
                    return BadRequest();
                }

            }
            catch (Exception ex)
            {
                return StatusCode(500, $"An error occurred: {ex.Message}");
            }
        }

        public static async Task<string> TCKimlikNoDogrula(string isim,string soyisim,string dogumyili,string tcno)
        {
            var soapEnvelope =
                $@"<soap:Envelope xmlns:soap='http://schemas.xmlsoap.org/soap/envelope/' xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns:xsd='http://www.w3.org/2001/XMLSchema'>
                <soap:Body>
                    <TCKimlikNoDogrula xmlns='http://tckimlik.nvi.gov.tr/WS'>
                        <TCKimlikNo>{tcno}</TCKimlikNo>
                        <Ad>{isim}</Ad>
                        <Soyad>{soyisim}</Soyad>
                        <DogumYili>{dogumyili}</DogumYili>
                    </TCKimlikNoDogrula>
                </soap:Body>
            </soap:Envelope>";

            using (var httpClient = new HttpClient())
            {
                var requestContent = new StringContent(soapEnvelope, Encoding.UTF8, "text/xml");

                using (var response = await httpClient.PostAsync("https://tckimlik.nvi.gov.tr/Service/KPSPublic.asmx", requestContent))
                {
                    var responseContent = await response.Content.ReadAsStringAsync();

                    var xmlDoc = new XmlDocument();
                    xmlDoc.LoadXml(responseContent);

                    // Namespace'i dikkate alarak doğrulama sonucunu al
                    var nsmgr = new XmlNamespaceManager(xmlDoc.NameTable);
                    nsmgr.AddNamespace("soap", "http://schemas.xmlsoap.org/soap/envelope/");
                    nsmgr.AddNamespace("xsi", "http://www.w3.org/2001/XMLSchema-instance");
                    nsmgr.AddNamespace("xsd", "http://www.w3.org/2001/XMLSchema");
                    nsmgr.AddNamespace("tns", "http://tckimlik.nvi.gov.tr/WS");

                    var resultNode = xmlDoc.SelectSingleNode("//tns:TCKimlikNoDogrulaResult", nsmgr);
                    if (resultNode != null)
                    {
                        return resultNode.InnerText;
                    }

                    return null;
                }
            }
        }

    }
}
