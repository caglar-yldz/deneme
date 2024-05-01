using MicroCarMaas.API.Models.DTO;

namespace MicroCarMaas.API.Repositories.Abstracts
{
    public interface ICarRepository
    {
        Task<AddCarResponseDto> AddCar(AddCarRequestDto addCarRequestDto);
        Task<UpdateCarResponseDto> UpdateCar(UpdateCarRequestDto updateCarRequestDto);
        Task<DeleteCarResponseDto> DeleteCar(DeleteCarRequestDto deleteCarRequestDto);
        Task<GetCarResponseDto> GetCarById(GetCarRequestDto getCarRequestDto);
        Task<List<GetCarResponseDto>> GetAllCars();
    }
}
