using Microsoft.AspNetCore.Identity;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace MicroCarMaas.API.Models.Domain
{
    public class User : IdentityUser<Guid>
    {
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Key]
        public override Guid Id { get; set; }

        public string? Name { get; set; }

        public string? Surname { get; set; }

        [Required]
        [Phone(ErrorMessage = "Invalid Phone Number")]
        [PersonalData]
        public override string PhoneNumber { get; set; }

        [EmailAddress(ErrorMessage = "Invalid Email Address")]
        public override string? Email { get; set; }

        public string? BirthDate { get; set; }

        [RegularExpression(@"^[1-9]{1}[0-9]{9}[02468]{1}$")]
        public string? TcNo { get; set; }

        public int? Points { get; set; }

        [ForeignKey("DrivingLicence")]
        public Guid? DrivingLicenceId { get; set; }

        public DrivingLicence? DrivingLicence { get; set; }

        public new bool? EmailConfirmed { get; set; }
        public new bool? PhoneNumberConfirmed { get; set; }
        public new bool? TwoFactorEnabled { get; set; }
        public new bool? LockoutEnabled { get; set; }
        public new int? AccessFailedCount { get; set; }
    }
}
