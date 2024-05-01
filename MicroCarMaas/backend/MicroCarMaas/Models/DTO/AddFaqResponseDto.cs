using System.ComponentModel.DataAnnotations;

namespace MicroCarMaas.API.Models.DTO
{
    public class AddFaqResponseDto
    {
        public Guid Id { get; set; }
        public string Question { get; set; }
        public string Answer { get; set; }
    }
}
