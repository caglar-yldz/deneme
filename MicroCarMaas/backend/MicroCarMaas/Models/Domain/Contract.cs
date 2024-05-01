using System.ComponentModel.DataAnnotations;

namespace MicroCarMaas.API.Models.Domain
{
    public class Contract
    {
        [Key]
        public Guid Id { get; set; }
        [Required]
        public string ContractName { get; set; }
        [Required]
        public string ContractDescription { get; set; }

    }
}
