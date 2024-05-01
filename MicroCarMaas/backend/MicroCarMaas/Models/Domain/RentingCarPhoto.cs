using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace MicroCarMaas.API.Models.Domain
{
    public class RentingCarPhoto
    {
        [Key]
        public Guid Id { get; set; }

        public List<string>? BeforeRentingImgUrl { get; set; }

        public List<string>? AfterRentingImgUrl { get; set; }

        [Required]
        [ForeignKey("Car")]
        public Guid CarId { get; set; }
        public Car car { get; set; }
    }
}
