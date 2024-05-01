using System.Threading.Tasks;
using MicroCarMaas.API.Models.Domain;

namespace MicroCarMaas.API.Repositories.Abstracts
{
    public interface IOtpRepository
    {
        Task AddOtp(Otp otp);
        Task RemoveOtp(Otp otp);
        Task<Otp> GetOtpByPhoneNumber(string phoneNumber);
    }
}
