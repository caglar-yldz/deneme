namespace MicroCarMaas.API.Models.DTO
{
    public class GetCarResponseDto
    {
        public Guid Id { get; set; } 
        public double Latitude { get; set; }
        public double Longitude { get; set; }
        public DateTime Timestamp { get; set; }
    }
}
