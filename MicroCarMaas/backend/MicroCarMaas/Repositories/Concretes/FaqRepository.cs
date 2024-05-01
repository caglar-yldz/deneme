using AutoMapper;
using MicroCarMaas.API.Data;
using MicroCarMaas.API.Models.DTO;
using MicroCarMaas.API.Repositories.Abstracts;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;

public class FaqRepository : IFaqRepository
    {
        private readonly AppDbContext _context;
        private readonly IMapper _mapper;

        public FaqRepository(AppDbContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public async Task<AddFaqResponseDto> AddFaq(AddFaqRequestDto addFaqRequestDto)
        {
            var id = new SqlParameter("@Id", Guid.NewGuid());
            var questionParameter = new SqlParameter("@Question", addFaqRequestDto.Question);
            var answerParameter = new SqlParameter("@Answer", addFaqRequestDto.Answer);

            var faqs = await _context.Faqs.FromSqlRaw("EXEC AddFaq @Id, @Question, @Answer", id, questionParameter, answerParameter)
                                                    .ToListAsync();


            return _mapper.Map<AddFaqResponseDto>(faqs);
        }

        public async Task<DeleteFaqResponseDto> DeleteFaq(DeleteFaqRequestDto deleteFaqRequestDto)
        {
            var idParameter = new SqlParameter("@Id", deleteFaqRequestDto.Id);

            var faqs = await _context.Faqs.FromSqlRaw("EXEC DeleteFaq @Id", idParameter).FirstOrDefaultAsync();

            return _mapper.Map<DeleteFaqResponseDto>(faqs);
        }

        public async Task<List<GetFaqResponseDto>> GetAllFaqs()
        { 
            var faqs = await _context.Faqs.FromSqlRaw("EXEC GetAllFaqs").ToListAsync();
            var faqResponseDtos = _mapper.Map<List<GetFaqResponseDto>>(faqs);
            return faqResponseDtos;
        }
       

        public async Task<UpdateFaqResponseDto> UpdateFaq(UpdateFaqRequestDto updateFaqRequestDto)
        {
            var idParameter = new SqlParameter("@Id", updateFaqRequestDto.Id);
            var questionParameter = new SqlParameter("@Question", updateFaqRequestDto.Question);
            var answerParameter = new SqlParameter("@Answer", updateFaqRequestDto.Answer);
            
            var faqs = await _context.Faqs
                .FromSqlRaw("EXEC UpdateFaq @Id, @Question, @Answer", idParameter, questionParameter, answerParameter)
                //.AsEnumerable()
                .FirstOrDefaultAsync();

        return _mapper.Map<UpdateFaqResponseDto>(faqs);
        }
 }
