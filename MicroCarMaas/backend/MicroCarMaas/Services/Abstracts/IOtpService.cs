using MicroCarMaas.API.Models.DTO;

namespace MicroCarMaas.API.Services.Abstracts
{
    public interface IOtpService
    {
        Task<string> GenerateOtp(string phoneNumber);
        Task<bool> VerifyOtp(OtpVerifyRequestDto otpVerifyRequestDto);
    }
}
