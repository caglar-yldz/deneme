namespace MicroCarMaas.API.Models.DTO
{
    public class GetServiceAreaResponseDto
    {
        public Guid ServiceAreaId { get; set; }
        public double Latitude { get; set; }
        public double Longitude { get; set; }
    }
}
