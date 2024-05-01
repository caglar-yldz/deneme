using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using MicroCarMaas.API.Models.DTO;
using MicroCarMaas.API.Repositories.Abstracts;

namespace MicroCarMaas.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CarController : ControllerBase
    {hfcjmgcjhgm
        private readonly ICarRepository _carRepository;

        public CarController(ICarRepository carRepository)
        {
            _carRepository = carRepository;
        }

        [HttpPost("add")]
        public async Task<IActionResult> AddCar(AddCarRequestDto addCarRequestDto)
        {
            try
            {
                var responseDto = await _carRepository.AddCar(addCarRequestDto);
                return Ok(responseDto);
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"An error occurred: {ex.Message}");
            }
        }

        [HttpPut("update")]
        public async Task<IActionResult> UpdateCar(UpdateCarRequestDto updateCarRequestDto)
        {
            try
            {
                var responseDto = await _carRepository.UpdateCar(updateCarRequestDto);
                return Ok(responseDto);
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"An error occurred: {ex.Message}");
            }
        }

        [HttpDelete("delete")]
        public async Task<IActionResult> DeleteCar(DeleteCarRequestDto deleteCarRequestDto)
        {
            try
            {
                var responseDto = await _carRepository.DeleteCar(deleteCarRequestDto);
                return Ok(responseDto);
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"An error occurred: {ex.Message}");
            }
        }

        [HttpGet("get/{id}")]
        public async Task<IActionResult> GetCarById(Guid id)
        {
            try
            {
                var requestDto = new GetCarRequestDto { Id = id };
                var responseDto = await _carRepository.GetCarById(requestDto);
                return Ok(responseDto);
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"An error occurred: {ex.Message}");
            }
        }

        [HttpGet("getAll")]
        public async Task<IActionResult> GetAllCars()
        {
            try
            {
                var responseDtoList = await _carRepository.GetAllCars();
                return Ok(responseDtoList);
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"An error occurred: {ex.Message}");
            }
        }
    }
}
