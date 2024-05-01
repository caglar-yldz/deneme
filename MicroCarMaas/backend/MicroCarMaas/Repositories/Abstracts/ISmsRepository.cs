using Microsoft.AspNetCore.Mvc;

namespace MicroCarMaas.API.Repositories.Abstracts
{
    public interface ISmsRepository
    {
        Task<string> SendSmsAsync(string Recipients,string messages);
    }
}
