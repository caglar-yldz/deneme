using System.ComponentModel.DataAnnotations;

namespace MicroCarMaas.API.Models.Domain
{
    public class Card
    {
        [Key]
        public Guid Id { get; set; }
        [Required]
        [RegularExpression(@"^([0-9]{4})\s?([0-9]{4})\s?([0-9]{4})\s?([0-9]{4})$")]
        public string CardNumber { get; set; }
        [Required]
        public string CardOwnerName { get; set; }
        [Required]
        public string CarOwnerSurname { get; set; }
        [Required]
        public string ValidDate { get; set; }
        [Required]
        public string Cvv { get; set; }
    }
}
