using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json.Serialization;

namespace MicroCarMaas.API.Models.Domain
{
    public class DrivingLicence
    {
        [Key]
        public Guid Id { get; set; }

        [Required]
        public string GivenDate { get; set; }
        [Required]
        public string ExpDate { get; set; }
        [Required]
        public string DrivingLicenceNo { get; set; }
        [Required]
        [ForeignKey("User")]
        public Guid UserId { get; set; }
        [JsonIgnore]
        public User user { get; set; }
    }
}