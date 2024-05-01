namespace MicroCarMaas.API.Models.DTO
{
    public class UserDto
    {
        public string? Name { get; set; }
        public string? Surname { get; set; }
        public string PhoneNumber { get; set; }
        public string? Email { get; set; }
        public string? BirthDate { get; set; }
        public string? TcNo { get; set; }
        public int? Points { get; set; }
    }
}
