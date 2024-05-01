using System;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using AutoMapper;
using MicroCarMaas.API.Data;
using MicroCarMaas.API.Models.Domain;
using MicroCarMaas.API.Models.DTO;
using MicroCarMaas.API.Repositories.Abstracts;
using MicroCarMaas.API.Services.Abstracts;
using Microsoft.EntityFrameworkCore;

namespace MicroCarMaas.API.Services.Concretes
{
    public class OtpService : IOtpService
    {
        private readonly IOtpRepository _otpRepository;
        private readonly IMapper _mapper;
        private readonly ISmsRepository _smsRepository;

        public OtpService(IOtpRepository otpRepository, IMapper mapper, ISmsRepository smsRepository)
        {
            _otpRepository = otpRepository;
            _mapper = mapper;
            _smsRepository = smsRepository;
        }

        public async Task<string> GenerateOtp(string phoneNumber)
        {
            string otp = GenerateRandomOtp();
            string hashedOtp = HashOtp(otp);

            var otpCode = new Otp
            {
                PhoneNumber = phoneNumber,
                HashedOtp = hashedOtp,
                ExpireTime = DateTime.Now.AddMinutes(3)
            };
            await _smsRepository.SendSmsAsync(phoneNumber, otp);
            await _otpRepository.AddOtp(otpCode);

            return otp;
        }

        public async Task<bool> VerifyOtp(OtpVerifyRequestDto otpVerifyRequestDto)
        {
            var otpCode = await _otpRepository.GetOtpByPhoneNumber(otpVerifyRequestDto.PhoneNumber);

            if (otpCode != null && otpCode.ExpireTime > DateTime.Now)
            {
                if (VerifyOtpHash(otpVerifyRequestDto.Otp, otpCode.HashedOtp))
                {
                    await _otpRepository.RemoveOtp(otpCode);
                    return true;
                }
            }

            return false;
        }

        private string GenerateRandomOtp()
        {
            const string chars = "0123456789";
            var random = new Random();
            return new string(Enumerable.Repeat(chars, 4)
              .Select(s => s[random.Next(s.Length)]).ToArray());
        }

        private string HashOtp(string otp)
        {
            using (SHA256 sha256Hash = SHA256.Create())
            {
                byte[] bytes = sha256Hash.ComputeHash(Encoding.UTF8.GetBytes(otp));
                StringBuilder builder = new StringBuilder();
                for (int i = 0; i < bytes.Length; i++)
                {
                    builder.Append(bytes[i].ToString("x2"));
                }
                return builder.ToString();
            }
        }

        private bool VerifyOtpHash(string otp, string hash)
        {
            string otpHash = HashOtp(otp);
            return otpHash.Equals(hash, StringComparison.OrdinalIgnoreCase);
        }
    }
}
