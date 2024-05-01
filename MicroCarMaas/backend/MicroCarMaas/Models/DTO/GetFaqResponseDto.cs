namespace MicroCarMaas.API.Models.DTO
{
    public class GetFaqResponseDto
    {
        public Guid Id { get; set; }
        public string Question { get; set; }
        public string Answer { get; set; }
    }
}
