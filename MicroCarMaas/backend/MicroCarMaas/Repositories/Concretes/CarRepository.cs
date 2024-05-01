using AutoMapper;
using MicroCarMaas.API.Data;
using MicroCarMaas.API.Models.DTO;
using MicroCarMaas.API.Repositories.Abstracts;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;

public class CarRepository : ICarRepository
{
    private readonly AppDbContext _context;
    private readonly IMapper _mapper;

    public CarRepository(AppDbContext context, IMapper mapper)
    {
        _context = context;
        _mapper = mapper;
    }

    public async Task<AddCarResponseDto> AddCar(AddCarRequestDto addCarRequestDto)
    {
        var id= new SqlParameter("@Id", Guid.NewGuid());
        var latitudeParameter = new SqlParameter("@Latitude", addCarRequestDto.Latitude);
        var longitudeParameter = new SqlParameter("@Longitude", addCarRequestDto.Longitude);
        var timestamp= new SqlParameter("@Timestamp", DateTime.Now);

        var car = await _context.Cars.FromSqlRaw("EXEC AddCar @Id, @Latitude, @Longitude, @Timestamp",id, latitudeParameter, longitudeParameter, timestamp).AsAsyncEnumerable().FirstOrDefaultAsync();
        return _mapper.Map<AddCarResponseDto>(car);
    }

    public async Task<UpdateCarResponseDto> UpdateCar(UpdateCarRequestDto updateCarRequestDto)
    {
        var idParameter = new SqlParameter("@Id", updateCarRequestDto.Id);
        var latitudeParameter = new SqlParameter("@Latitude", updateCarRequestDto.Latitude);
        var longitudeParameter = new SqlParameter("@Longitude", updateCarRequestDto.Longitude);

        var car = await _context.Cars.FromSqlRaw("EXEC UpdateCar @Id, @Latitude, @Longitude", idParameter, latitudeParameter, longitudeParameter).AsAsyncEnumerable().FirstOrDefaultAsync();

        return _mapper.Map<UpdateCarResponseDto>(car);
    }

    public async Task<DeleteCarResponseDto> DeleteCar(DeleteCarRequestDto deleteCarRequestDto)
    {
        var idParameter = new SqlParameter("@Id", deleteCarRequestDto.Id);

        var result = await _context.Database.ExecuteSqlRawAsync("EXEC DeleteCar @Id", idParameter);

        var responseDto = new DeleteCarResponseDto
        {
            ResultCode = result,
            Message = result > 0 ? "Car deleted successfully." : "Car not found."
        };

        return responseDto;
    }


    public async Task<GetCarResponseDto> GetCarById(GetCarRequestDto getCarRequestDto)
    {
        var idParameter = new SqlParameter("@Id", getCarRequestDto.Id);

        var car = await _context.Cars.FromSqlRaw("EXEC GetCarById @Id", idParameter).AsAsyncEnumerable().FirstOrDefaultAsync();

        return _mapper.Map<GetCarResponseDto>(car);
    }


    public async Task<List<GetCarResponseDto>> GetAllCars()
    {
        var cars = await _context.Cars.FromSqlRaw("EXEC GetAllCars").ToListAsync();
        var carResponseDtos = _mapper.Map<List<GetCarResponseDto>>(cars);
        return carResponseDtos;
    }
}
