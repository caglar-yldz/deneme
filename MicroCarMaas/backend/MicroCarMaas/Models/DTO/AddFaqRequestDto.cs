using System.ComponentModel.DataAnnotations;

namespace MicroCarMaas.API.Models.DTO
{
    public class AddFaqRequestDto
    {
        public string Question { get; set; }
        public string Answer { get; set; }
    }
}
