using MicroCarMaas.API.Models.DTO;
using MicroCarMaas.API.Services.Abstracts;
using MicroCarMaas.API.Services.Concretes;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;

namespace MicroCarMaas.API.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class OtpController : ControllerBase
    {
        private readonly IOtpService _otpService;

        public OtpController(IOtpService otpService)
        {
            _otpService = otpService;
        }

        [HttpPost("Generate")]
        public async Task<IActionResult> GenerateOtp([FromBody] OtpGenerateRequestDto model)
        {
            string otp = await _otpService.GenerateOtp(model.PhoneNumber);
            var otpResponse = new OtpGenerateResponseDto
            {
                PhoneNumber = model.PhoneNumber,
                OtpCode = otp
            };
            return Ok(otpResponse);
        }

        [HttpPost("Verify")]
        public async Task<IActionResult> VerifyOtp([FromBody] OtpVerifyRequestDto model)
        {
            bool isVerified = await _otpService.VerifyOtp(model);

            if (isVerified)
            {
                return Ok(true);
            }
            else
            {
                return Ok(false);
            }
        }
    }
}
