using AutoMapper;
using MicroCarMaas.API.Data;
using MicroCarMaas.API.Models.Domain;
using MicroCarMaas.API.Models.DTO;
using MicroCarMaas.API.Repositories.Abstracts;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using System.ComponentModel.DataAnnotations;
using System.Data;
using System.Reflection.Metadata;
using System.Security.Claims;
using static System.Runtime.InteropServices.JavaScript.JSType;

namespace MicroCarMaas.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ServiceAreaController : ControllerBase
    {
        private readonly IServiceAreaRepository _serviceareaRepository;

        public ServiceAreaController(IServiceAreaRepository serviceareaRepository)
        {
            _serviceareaRepository = serviceareaRepository;
        }

        [HttpPost("add")]
        public async Task<IActionResult> AddServiceArea(List<AddServiceAreaRequestDto> addServiceAreaRequestDto)
        {
            try
            {
                var responseDto = await _serviceareaRepository.AddServiceArea(addServiceAreaRequestDto);
                return Ok(responseDto);
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"An error occurred: {ex.Message}");
            }
        }

        [HttpDelete("delete/{id}")]
        public async Task<IActionResult> DeleteServiceArea(Guid id)
        {
            try
            {
                var deleteServiceAreaRequestDto = new  DeleteServiceAreaRequestDto { Id = id };
                var responseDto = await _serviceareaRepository.DeleteServiceArea(deleteServiceAreaRequestDto);
                return Ok(responseDto);
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"An error occurred: {ex.Message}");
            }
        }

        [HttpGet("get/{id}")]
        public async Task<IActionResult> GetServiceAreaById(Guid id)
        {
            try
            {
                var requestDto = new GetServiceAreaRequestDto { Id = id };
                var responseDto = await _serviceareaRepository.GetServiceAreaById(requestDto);
                return Ok(responseDto);
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"An error occurred: {ex.Message}");
            }
        }

        [HttpGet("getAll")]
        public async Task<IActionResult> GetAllServiceArea()
        {
            try
            {
                var responseDtoList = await _serviceareaRepository.GetAllServiceAreas();
                return Ok(responseDtoList);
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"An error occurred: {ex.Message}");
            }
        }
    }


}
