using MicroCarMaas.API.Data;
using MicroCarMaas.API.Models.DTO;
using MicroCarMaas.API.Repositories.Abstracts;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;

namespace MicroCarMaas.API.Repositories.Concretes
{
    public class UserRepository : IUserRepository
    {
        private readonly AppDbContext _context;
        public UserRepository(AppDbContext appDbContext)
        {
            _context = appDbContext;

        }
        public async Task CreateUserIfNotExistsAsync(string phoneNumber)
        {
            var parameter = new SqlParameter("@PhoneNumber", phoneNumber);
            _context.Database.ExecuteSqlRaw("EXEC CreateUserIfNotExists @PhoneNumber", parameter);
        }
        public async Task<Guid> GetUserIdByPhoneNumberAsync(string phoneNumber)
        {

            var parameter = new SqlParameter("@PhoneNumber", phoneNumber);
            UserIdResponseDto? user = await _context.Users
            .FromSqlRaw("EXEC GetUsersByPhoneNumber @PhoneNumber", parameter).AsAsyncEnumerable()
            .Select(u => new UserIdResponseDto
            {
                UserId = u.Id,
            })
            .FirstOrDefaultAsync();
            if (user == null)
            {
                return Guid.Empty;
            }
            else
            {
                return user.UserId;
            }
        }
        public async Task AddUserRoleAsync(Guid id)
        {
            _context.Database.ExecuteSqlRaw("EXEC AddUserRole @UserId", new SqlParameter("@UserId", id));
        }
        public async Task UpdateUserAsync(UserDto userDto, string phoneNumber)
        {
            var NameParam = new SqlParameter("@Name", userDto.Name);
            var SurnameParam = new SqlParameter("@Surname", userDto.Surname);
            var PhoneParam = new SqlParameter("@PhoneNumber", phoneNumber);
            var EmailParam = new SqlParameter("@Email", userDto.Email);
            var BirthDateParam = new SqlParameter("@BirthDate", userDto.BirthDate);
            var TcNoParam = new SqlParameter("@TcNo", userDto.TcNo);
            _context.Database.ExecuteSqlRaw("EXEC UpdateUser @Name, @Surname,@PhoneNumber, @Email, @BirthDate, @TcNo", NameParam, SurnameParam, PhoneParam, EmailParam, BirthDateParam, TcNoParam);
        }
        public async Task DeleteUserAsync(string phoneNumber)
        {
            var parameter = new SqlParameter("@PhoneNumber", phoneNumber);
            _context.Database.ExecuteSqlRaw("EXEC DeleteUser @PhoneNumber", parameter);
        }
        public async Task<List<UserDto>> GetUsersAsync()
        {
            var users = _context.Users.FromSqlRaw("EXEC GetUsers").ToList();
            List<UserDto> userDtoList = new List<UserDto>();
            if (users == null)
            {
                return null;
            }
            else
            {
                foreach (var user in users)
                {
                    userDtoList.Add(new UserDto
                    {

                        Name = user.Name,
                        Surname = user.Surname,
                        PhoneNumber = user.PhoneNumber

                    });
                }
                return userDtoList;
            }

        }
    }
}
