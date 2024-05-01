using Microsoft.AspNetCore.Mvc;
using MicroCarMaas.API.Models.DTO;
using MicroCarMaas.API.Repositories.Abstracts;

namespace MicroCarMaas.API.Controllers
{

    [Route("api/[controller]")]
    [ApiController]
    public class FaqController : ControllerBase
    {
        private readonly IFaqRepository _faqRepository;

        public FaqController(IFaqRepository faqRepository)
        {
            _faqRepository = faqRepository;
        }

        [HttpPost("add")]
        public async Task<IActionResult> AddFaq(AddFaqRequestDto addFaqRequestDto)
        {
            try
            {
                var responseDto = await _faqRepository.AddFaq(addFaqRequestDto);
                return Ok(responseDto);
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"An error occurred: {ex.Message}");
            }
        }

        [HttpPut("update/{id}")]
        public async Task<IActionResult> UpdateFaq(Guid id)
        {
            try
            {
                var updateFaqRequestDto = new UpdateFaqRequestDto { Id = id };
                var responseDto = await _faqRepository.UpdateFaq(updateFaqRequestDto);
                return Ok(responseDto);
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"An error occurred: {ex.Message}");
            }
        }

        [HttpDelete("delete/{id}")]
        public async Task<IActionResult> DeleteFaq(Guid id)
        {
            try
            {
                var deleteFaqRequestDto = new DeleteFaqRequestDto { Id = id };
                var responseDto = await _faqRepository.DeleteFaq(deleteFaqRequestDto);
                return Ok(responseDto);
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"An error occurred: {ex.Message}");
            }
        }

        [HttpGet("getAll")]
        public async Task<IActionResult> GetAllFaqs()
        {
            try
            {
                var responseDtoList = await _faqRepository.GetAllFaqs();
                return Ok(responseDtoList);
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"An error occurred: {ex.Message}");
            }
        }
    }
}