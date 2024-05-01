using MicroCarMaas.API.Models.DTO;

namespace MicroCarMaas.API.Repositories.Abstracts
{
    public interface IUserRepository
    {
        Task CreateUserIfNotExistsAsync(string phoneNumber);
        Task<Guid> GetUserIdByPhoneNumberAsync(string phoneNumber);
        Task AddUserRoleAsync(Guid id);
        Task UpdateUserAsync(UserDto userDto, string phoneNumber);
        Task DeleteUserAsync(string phoneNumber);
        Task<List<UserDto>> GetUsersAsync();
    }
}
