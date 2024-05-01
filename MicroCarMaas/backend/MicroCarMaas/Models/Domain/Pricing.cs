using System.ComponentModel.DataAnnotations;

namespace MicroCarMaas.API.Models.Domain
{
    public class Pricing
    {
        [Key]
        public Guid Id { get; set; }
        [Required]
        public string Price { get; set; }
    }
}
