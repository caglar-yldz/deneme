using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace MicroCarMaas.API.Models.Domain
{
    public class ContactUs
    {
        [Key]
        public Guid Id { get; set; }
        [Required]
        public string Description { get; set; }
        [Required]
        [ForeignKey("User")]
        public Guid UserId { get; set; }
        public User user { get; set; }

    }
}
