using System.ComponentModel.DataAnnotations;

namespace MicroCarMaas.API.Models.DTO
{
    public class UpdateFaqRequestDto
    {
        public Guid Id { get; set; }
        public string Question { get; set; }
        public string Answer { get; set; }
    }
}
