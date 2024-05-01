using MicroCarMaas.API.Models.DTO;

namespace MicroCarMaas.API.Repositories.Abstracts
{
    public interface IFaqRepository
    {
        Task<AddFaqResponseDto> AddFaq(AddFaqRequestDto addFaqRequestDto);
        Task<UpdateFaqResponseDto> UpdateFaq(UpdateFaqRequestDto updateFaqRequestDto);
        Task<DeleteFaqResponseDto> DeleteFaq(DeleteFaqRequestDto deleteFaqRequestDto);
        // Task<GetFaqResponseDto> GetFaqById(GetFaqRequestDto getFaqRequestDto);
        Task<List<GetFaqResponseDto>> GetAllFaqs();
    }
}

