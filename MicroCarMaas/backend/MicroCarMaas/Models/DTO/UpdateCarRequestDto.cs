namespace MicroCarMaas.API.Models.DTO
{
    public class UpdateCarRequestDto
    {
        public Guid Id { get; set; }
        public double Latitude { get; set; }
        public double Longitude { get; set; }
    }
}
