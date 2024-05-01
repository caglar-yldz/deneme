using System.ComponentModel.DataAnnotations;

namespace MicroCarMaas.API.Models.Domain
{
    public class Car
    {
        [Key]
        public Guid Id { get; set; }
        [Required]
        public double Latitude { get; set; }
        [Required]
        public double Longitude { get; set; }
        [Required]
        public DateTime Timestamp { get; set; }
    }
}
