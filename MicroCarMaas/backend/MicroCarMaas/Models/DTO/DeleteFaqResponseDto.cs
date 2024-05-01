namespace MicroCarMaas.API.Models.DTO
{
    public class DeleteFaqResponseDto
    {
        public Guid Id { get; set; }
        public string Question { get; set; }
        public string Answer { get; set; }
    }
}
