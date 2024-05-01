using MicroCarMaas.API.Data;
using MicroCarMaas.API.Models.Domain;
using MicroCarMaas.API.Repositories.Abstracts;
using Microsoft.EntityFrameworkCore;

namespace MicroCarMaas.API.Repositories.Concretes
{
    public class OtpRepository : IOtpRepository
    {
        private readonly AppDbContext _context;
        public OtpRepository(AppDbContext context)
        {
            _context = context;
        }

        public async Task AddOtp(Otp otp)
        {
            _context.Otps.Add(otp);
            await _context.SaveChangesAsync();
        }

        public async Task RemoveOtp(Otp otp)
        {
            _context.Otps.Remove(otp);
            await _context.SaveChangesAsync();
        }

        public async Task<Otp> GetOtpByPhoneNumber(string phoneNumber)
        {
            return await _context.Otps.FirstOrDefaultAsync(x => x.PhoneNumber == phoneNumber);
        }
    }
}
