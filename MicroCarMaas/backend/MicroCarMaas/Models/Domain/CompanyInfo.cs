using System.ComponentModel.DataAnnotations;

namespace MicroCarMaas.API.Models.Domain
{
    public class CompanyInfo
    {
        [Key]
        public Guid Id { get; set; }
        [Required]
        public string CompanyName { get; set; }
        [Required]
        [Phone(ErrorMessage = "Invalid Phone Number")]
        public string CompanyPhone { get; set; }
        [Required]
        [EmailAddress(ErrorMessage = "Invalid Email Address")]
        public string CompanyEmail { get; set; }
        [Required]
        public string CompanyAddress { get; set; }
        [Required]
        public string AboutUs { get; set; }
    }
}
