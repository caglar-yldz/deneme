using AutoMapper;
using MicroCarMaas.API.Data;
using MicroCarMaas.API.Migrations;
using MicroCarMaas.API.Models.Domain;
using MicroCarMaas.API.Models.DTO;
using MicroCarMaas.API.Repositories.Abstracts;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;

public class ServiceAreaRepository : IServiceAreaRepository
{
            private readonly AppDbContext _context;
            private readonly IMapper _mapper;
    private object result;

    public ServiceAreaRepository(AppDbContext context, IMapper mapper)
            {
                _context = context;
                _mapper = mapper;
            }


            public async Task<string> AddServiceArea(List<AddServiceAreaRequestDto> addServiceAreaRequestDto)
            {
                var responseDto = new AddServiceAreaResponseDto();
                var serviceAreaId = Guid.NewGuid();

                var serviceAreaIdParameter = new SqlParameter("@Id", serviceAreaId);
                var serviceareas= await _context.Database.ExecuteSqlRawAsync("EXEC AddServiceArea @Id", serviceAreaIdParameter);

                foreach (var dto in addServiceAreaRequestDto)
                {
                    var latitudeParameter = new SqlParameter("@Latitude", dto.Latitude);
                    var longitudeParameter = new SqlParameter("@Longitude", dto.Longitude);
                    var coordinateServiceAreaIdParameter = new SqlParameter("@ServiceAreaId", serviceAreaId);

                    await _context.Database.ExecuteSqlRawAsync("EXEC AddCoordinate @Latitude, @Longitude, @ServiceAreaId",
                                                                latitudeParameter, longitudeParameter, coordinateServiceAreaIdParameter);
                }
                return "Ekleme işlemi başarıyla gerçekleştirildi.";
            }
  
            public async Task<string> DeleteServiceArea(DeleteServiceAreaRequestDto deleteServiceAreaRequestDto)
            {
                    var idParameter = new SqlParameter("@Id", deleteServiceAreaRequestDto.Id);

                    var serviceareas = await _context.Coordinates.FromSqlRaw("EXEC DeleteServiceArea @Id", idParameter).ToListAsync();

                    //await _context.Database.ExecuteSqlRawAsync("EXEC DeleteServiceArea @Id", idParameter);

                    return "Silme işlemi başarıyla gerçekleştirildi.";
                }

            public async Task<List<GetServiceAreaResponseDto>> GetServiceAreaById(GetServiceAreaRequestDto getServiceAreaRequestDto)
            {
                var idParameter = new SqlParameter("@Id", getServiceAreaRequestDto.Id);

                var serviceareas = await _context.Coordinates.FromSqlRaw("EXEC GetServiceAreaById @Id", idParameter).ToListAsync();

                List <GetServiceAreaResponseDto> Coordinates = new List<GetServiceAreaResponseDto>();

                foreach (var servicearea in serviceareas)
                {
                     Coordinates.Add( _mapper.Map<GetServiceAreaResponseDto>(servicearea));
                   }

                 return Coordinates;
            }

            public async Task<List<GetServiceAreaResponseDto>> GetAllServiceAreas()
            {
                var serviceareas = await _context.Coordinates.FromSqlRaw("EXEC GetAllServiceAreas").ToListAsync();

                List<GetServiceAreaResponseDto> Coordinates = new List<GetServiceAreaResponseDto>();

                foreach (var servicearea in serviceareas)
                {
                    Coordinates.Add(_mapper.Map<GetServiceAreaResponseDto>(servicearea));
                }

                return Coordinates;
    }

        }
 