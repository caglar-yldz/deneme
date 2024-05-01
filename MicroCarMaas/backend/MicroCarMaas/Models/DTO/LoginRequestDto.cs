using System.ComponentModel.DataAnnotations;

namespace MicroCarMaas.API.Models.DTO
{
    public class LoginRequestDto
    {
        [Required]
        [DataType(DataType.PhoneNumber)]
        public string Phone { get; set; }

        [Required]
        public string SmsCode { get; set; }
    }
}
