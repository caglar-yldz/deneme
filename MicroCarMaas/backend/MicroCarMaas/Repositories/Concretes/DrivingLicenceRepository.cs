using AutoMapper;
using MicroCarMaas.API.Controllers;
using MicroCarMaas.API.Data;
using MicroCarMaas.API.Models.DTO;
using MicroCarMaas.API.Repositories.Abstracts;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using System.Security.Claims;

namespace MicroCarMaas.API.Repositories.Concretes
{
    public class DrivingLicenceRepository : IDrivingLicenceRepository
    {
        //private readonly AppDbContext _context;
        //private readonly ITokenRepository tokenRepository;
        //private readonly IMapper mapper;
        //// private readonly UserController userController;
        //private readonly IConfiguration configuration;
        //private readonly IUserRepository userRepository;
        //public DrivingLicenceRepository(AppDbContext context, ITokenRepository tokenRepository, IMapper mapper, IConfiguration configuration, IUserRepository userRepository)
        //{
        //    this.tokenRepository = tokenRepository;
        //    _context = context;
        //    this.mapper = mapper;
        //    this.configuration = configuration;
        //    this.userRepository = userRepository;
        //}

        //public async Task<IActionResult> ValidateDrivingLicence(string token, DrivingLicenceDto drivingLicenceDto)
        //{
        //    int statusCode;
        //    string message = "";

        //    try
        //    {
        //        var principal = tokenRepository.DecodeJwtToken(token);
        //        if (principal == null)
        //        {
        //            statusCode = 404;
        //            message = "Please log in again";
        //        }
        //        else
        //        {
        //            var userPhone = principal.Claims.FirstOrDefault(c => c.Type == ClaimTypes.MobilePhone).Value;
        //            var parameterPhone = new SqlParameter("@PhoneNumber", userPhone);
        //            var user = await _context.Users.FromSqlRaw("EXEC GetUsersByPhoneNumber @PhoneNumber", parameterPhone).ToListAsync();

        //            if (user[0] == null)
        //            {
        //                statusCode = 404;
        //                message = "Please log in again";
        //            }
        //            else
        //            {
        //                var validationResult = await ValidateDrivingLicenceInternal(user[0].Id.ToString(), drivingLicenceDto);

        //                statusCode = validationResult.Value["StatusCode"];
        //                message = validationResult.Message;
        //            } 
        //        }

        //    }
        //    catch (Exception ex)
        //    {
        //        statusCode = 500;
        //        message = ex.Message;
        //    }

        //    return new JsonResult(new { StatusCode = statusCode, Message = message }); ;
        //}

        //private async bool ValidateDrivingLicenceInternal(string userId, DrivingLicenceDto drivingLicenceDto)
        //{
        //    int statusCode;
        //    string message = "";

        //    try
        //    {
        //        var parameter = new SqlParameter("@UserId", userId);
        //        var users = await _context.Users.FromSqlRaw("EXEC GetUsersById @UserId", parameter).ToListAsync();
        //        var user = users.FirstOrDefault();

        //        if (user == null)
        //        {
        //            statusCode = 404;
        //            message = "User is not found";
        //            return false;
        //        }
        //        else
        //        {
        //            if (drivingLicenceDto.TcNo == user.TcNo && drivingLicenceDto.ExpDate > DateTime.Now)
        //            {
        //                statusCode = 200;
        //                message = "Driving Licence is valid";
        //            }
        //            else
        //            {
        //                statusCode = 400;
        //                message = "The driver's license information could not be verified. The operation is invalid.";
        //            }                   
        //        }          
        //    }
        //    catch (Exception ex)
        //    {
        //        statusCode = 500;
        //        message = ex.Message;
        //    }

        //    return new JsonResult(new { StatusCode = statusCode, Message = message });
        //}

        //public async Task<IActionResult> AddDrivingLicence([FromRoute] string token, [FromBody] DrivingLicenceDto drivingLicenceDto)
        //{
        //    try
        //    {
        //        var principal = tokenRepository.DecodeJwtToken(token);
        //        if (principal == null)
        //        {
        //            return BadRequest("Please log in again");
        //        }

        //        var userPhone = principal.Claims.FirstOrDefault(c => c.Type == ClaimTypes.MobilePhone).Value;
        //        var parameterPhone = new SqlParameter("@PhoneNumber", userPhone);
        //        var user = await _context.Users.FromSqlRaw("EXEC GetUsersByPhoneNumber @PhoneNumber", parameterPhone).ToListAsync();

        //        if (user[0] == null)
        //        {
        //            return BadRequest("Please log in again");
        //        }

        //        if (user[0].DrivingLicenceId != null)
        //        {
        //            return BadRequest("User already has a driver's license. Please delete the existing driver's license before adding a new one.");
        //        }

        //        var validationResult = await ValidateDrivingLicenceInternal(user[0].Id.ToString(), drivingLicenceDto);

        //        if (validationResult is OkObjectResult)
        //        {
        //            var parameter = new SqlParameter("@UserId", user[0].Id);

        //            var parameter1 = new SqlParameter("@GivenDate", drivingLicenceDto.GivenDate);
        //            var parameter2 = new SqlParameter("@ExpDate", drivingLicenceDto.ExpDate);
        //            var parameter3 = new SqlParameter("@DrivingLicenceNo", drivingLicenceDto.DrivingLicenceNo);
        //            var parameter4 = new SqlParameter("@UserId", user[0].Id);

        //            _context.Database.ExecuteSqlRaw("EXEC CreateDrivingLicence @GivenDate, @ExpDate, @DrivingLicenceNo, @UserId", parameter1, parameter2, parameter3, parameter4);

        //            var drivingLicences = await _context.DrivingLicences.FromSqlRaw("EXEC GetDrivingLicencesByUserId @UserId", parameter).ToListAsync();
        //            var drivingLicence = drivingLicences.FirstOrDefault();

        //            if (drivingLicence != null)
        //            {
        //                var userController = new UserController(_context, tokenRepository, mapper, configuration, userRepository);
        //                var updateResult = await userController.UpdateUsersDrivingLicence(user[0].Id.ToString(), drivingLicence.Id.ToString());
        //                return updateResult;
        //            }
        //            return BadRequest("Driving Licence can not save.");
        //        }

        //        return validationResult;
        //    }
        //    catch (Exception ex)
        //    {
        //        return StatusCode(500, $"An error occurred: {ex.Message}");
        //    }
        //}

        //public async Task<IActionResult> DeleteDrivingLicence([FromRoute] string token)
        //{
        //    try
        //    {
        //        var principal = tokenRepository.DecodeJwtToken(token);
        //        if (principal == null)
        //        {
        //            return BadRequest("Please log in again");
        //        }

        //        var userPhone = principal.Claims.FirstOrDefault(c => c.Type == ClaimTypes.MobilePhone).Value;
        //        var parameterPhone = new SqlParameter("@PhoneNumber", userPhone);
        //        var user = await _context.Users.FromSqlRaw("EXEC GetUsersByPhoneNumber @PhoneNumber", parameterPhone).ToListAsync();

        //        if (user[0].DrivingLicenceId == null)
        //        {
        //            return NotFound("Driving licence not found for user");
        //        }

        //        var parameter = new SqlParameter("@DrivingLicenceId", user[0].DrivingLicenceId);

        //        var drivingLicences = await _context.DrivingLicences.FromSqlRaw("EXEC GetDrivingLicencesById @DrivingLicenceId", parameter).ToListAsync();
        //        var drivingLicence = drivingLicences.FirstOrDefault();

        //        if (drivingLicence == null)
        //        {
        //            return NotFound("Driving licence not found for user");
        //        }

        //        var parameter1 = new SqlParameter("@DrivingLicenceId", drivingLicence.Id);
        //        _context.Database.ExecuteSqlRaw("EXEC DeleteDrivingLicence @DrivingLicenceId", parameter1);

        //        return Ok("Driving Licence deleted successfully");

        //    }
        //    catch (Exception ex)
        //    {
        //        return StatusCode(500, $"An error occurred: {ex.Message}");

        //    }
        //}

        //public async Task<IActionResult> GetDrivingLicence([FromRoute] string token)
        //{
        //    try
        //    {
        //        var principal = tokenRepository.DecodeJwtToken(token);
        //        if (principal == null)
        //        {
        //            return BadRequest("Please log in again");
        //        }

        //        var userPhone = principal.Claims.FirstOrDefault(c => c.Type == ClaimTypes.MobilePhone).Value;

        //        var parameterPhone = new SqlParameter("@PhoneNumber", userPhone);
        //        var user = await _context.Users.FromSqlRaw("EXEC GetUsersByPhoneNumber @PhoneNumber", parameterPhone).ToListAsync();

        //        if (user[0].DrivingLicenceId == null)
        //        {
        //            return NotFound("Driving licence not found for user");
        //        }

        //        var parameter = new SqlParameter("@DrivingLicenceId", user[0].DrivingLicenceId);

        //        var drivingLicences = await _context.DrivingLicences.FromSqlRaw("EXEC GetDrivingLicencesById @DrivingLicenceId", parameter).ToListAsync();
        //        var drivingLicence = drivingLicences.FirstOrDefault();

        //        if (drivingLicence == null)
        //        {
        //            return NotFound("Driving licence not found for user");
        //        }

        //        return Ok(drivingLicence);

        //    }
        //    catch (Exception ex)
        //    {
        //        return StatusCode(500, $"An error occurred: {ex.Message}");

        //    }
        //}

    }
}
