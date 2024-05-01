using MicroCarMaas.API.Models.Domain;
using Microsoft.AspNetCore.Identity;
using System.Security.Claims;

namespace MicroCarMaas.API.Repositories.Abstracts
{
    public interface ITokenRepository
    {
        string CreateJWTToken(User user, List<Guid> roles);
        ClaimsPrincipal DecodeJwtToken(string jwtToken);

    }
}
