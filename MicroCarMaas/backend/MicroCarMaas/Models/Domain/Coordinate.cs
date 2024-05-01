using System.ComponentModel.DataAnnotations;

namespace MicroCarMaas.API.Models.Domain
{
    public class Coordinate
    {
        [Key]
        public double Latitude { get; set; }
        public double Longitude { get; set; }

        public Guid ServiceAreaId { get; set; }
    }
}
