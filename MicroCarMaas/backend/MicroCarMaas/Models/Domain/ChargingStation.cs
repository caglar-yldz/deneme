using System.ComponentModel.DataAnnotations;

using System.ComponentModel.DataAnnotations;

namespace MicroCarMaas.API.Models.Domain
{
    public class ChargingStation
    {
        [Key]
        public Guid Id { get; set; }
        [Required]
        public string Location { get; set; }
    }
}
