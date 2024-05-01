using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace MicroCarMaas.API.Models.Domain
{
    public class Renting
    {
        [Key]
        public Guid Id { get; set; }
        [Required]
        public int Time { get; set; }
        [Required]
        public string RentDate { get; set; }
        public string? ReturnDate { get; set; }
        [Required]
        public string RentingPrice { get; set; }
        public bool? IsPaymentDone { get; set; }
        [Required]
        public string RentingLocation { get; set; }
        public string? ReturnLocation { get; set; }
        [Required]
        [ForeignKey("User")]
        public Guid UserId { get; set; }
        [Required]
        [ForeignKey("Car")]
        public Guid CarId { get; set; }
        public Car car { get; set; }
        public User user { get; set; }
    }
}
