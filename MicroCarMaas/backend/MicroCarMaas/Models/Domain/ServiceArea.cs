
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Diagnostics.CodeAnalysis;

namespace MicroCarMaas.API.Models.Domain
{
    public class ServiceArea
    {
        [Key]
        public Guid Id { get; set; }

        [Required]
        public required List<Coordinate> Borders { get; set; }
      
    }
}