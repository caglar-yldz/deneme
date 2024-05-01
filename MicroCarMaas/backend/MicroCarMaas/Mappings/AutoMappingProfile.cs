using AutoMapper;
using MicroCarMaas.API.Models.Domain;
using MicroCarMaas.API.Models.DTO;

namespace MicroCarMaas.API.Mappings
{
    public class AutoMappingProfile : Profile
    {
        public AutoMappingProfile()
        {
            CreateMap<User, UserDto>().ReverseMap();

            CreateMap<ServiceArea, AddServiceAreaRequestDto>().ReverseMap();
            CreateMap<ServiceArea, AddServiceAreaResponseDto>().ReverseMap();
            CreateMap<ServiceArea, GetServiceAreaRequestDto>().ReverseMap();
            CreateMap<Coordinate, GetServiceAreaResponseDto>().ReverseMap();
            CreateMap<ServiceArea, DeleteServiceAreaRequestDto>().ReverseMap();
            CreateMap<ServiceArea, DeleteServiceAreaResponseDto>().ReverseMap();

            CreateMap<Faq, AddFaqRequestDto>().ReverseMap();
            CreateMap<Faq, AddFaqResponseDto>().ReverseMap();
            CreateMap<Faq, UpdateFaqRequestDto>().ReverseMap();
            CreateMap<Faq, UpdateFaqResponseDto>().ReverseMap();
            CreateMap<Faq, GetFaqRequestDto>().ReverseMap();
            CreateMap<Faq, GetFaqResponseDto>().ReverseMap();
            CreateMap<Faq, DeleteFaqRequestDto>().ReverseMap();
            CreateMap<Faq, DeleteFaqResponseDto>().ReverseMap();

            CreateMap<Car, AddCarRequestDto>().ReverseMap();
            CreateMap<Car, AddCarResponseDto>().ReverseMap();
            CreateMap<Car, GetCarRequestDto>().ReverseMap();
            CreateMap<Car, GetCarResponseDto>().ReverseMap();
            CreateMap<Car, UpdateCarRequestDto>().ReverseMap();
            CreateMap<Car, UpdateCarResponseDto>().ReverseMap();
            CreateMap<Car, UpdateCarResponseDto>().ReverseMap();
            CreateMap<Car, DeleteCarRequestDto>().ReverseMap();
            CreateMap<Otp, OtpGenerateRequestDto>().ReverseMap();
            CreateMap<Otp, OtpGenerateResponseDto>().ReverseMap();


        }
    }
}