using MicroCarMaas.API.Models.DTO;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace MicroCarMaas.API.Repositories.Abstracts
{
    public interface IServiceAreaRepository
    {
        Task<string> AddServiceArea(List<AddServiceAreaRequestDto> addServiceAreaRequestDto);
        Task<string> DeleteServiceArea(DeleteServiceAreaRequestDto deleteServiceAreaRequestDto);
        Task<List<GetServiceAreaResponseDto>> GetServiceAreaById(GetServiceAreaRequestDto getServiceAreaRequestDto);
        Task<List<GetServiceAreaResponseDto>> GetAllServiceAreas();
    }
}
