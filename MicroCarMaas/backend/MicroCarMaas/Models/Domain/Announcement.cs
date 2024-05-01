using System.ComponentModel.DataAnnotations;

namespace MicroCarMaas.API.Models.Domain
{
    public class Announcement
    {
        [Key]
        public Guid Id { get; set; }
        [Required]
        public string ImageUrl { get; set; }
        [Required]
        public string Description { get; set; }
    }
}
