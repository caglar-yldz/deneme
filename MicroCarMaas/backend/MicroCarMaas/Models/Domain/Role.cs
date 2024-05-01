using Microsoft.AspNetCore.Identity;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace MicroCarMaas.API.Models.Domain
{
    public class Role : IdentityRole<Guid>
    {
        public Role() : base()
        {
        }

    }
}
