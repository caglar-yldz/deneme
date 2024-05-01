using System.ComponentModel.DataAnnotations;

namespace MicroCarMaas.API.Models.Domain
{
    public class Otp
    {
        [Key]
        public Guid Id { get; set; }
        [Required]
        public string PhoneNumber { get; set; }
        [Required]
        public string HashedOtp { get; set; }
        [Required]
        public DateTime ExpireTime { get; set; }
    }
}
