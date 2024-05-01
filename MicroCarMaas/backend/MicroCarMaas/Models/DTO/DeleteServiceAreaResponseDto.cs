namespace MicroCarMaas.API.Models.DTO
{
    public class DeleteServiceAreaResponseDto
    {
        public Guid Id { get; set; }
        public double Latitude { get; set; }
        public double Longitude { get; set; }
        public object ResultCode { get; internal set; }
        public object Message { get; internal set; }
        //public bool IsSuccess { get; internal set; }
    }
}
