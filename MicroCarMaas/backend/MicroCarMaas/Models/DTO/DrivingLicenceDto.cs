using MicroCarMaas.API.Models.Domain;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace MicroCarMaas.API.Models.DTO
{
    public class DrivingLicenceDto
    {
        public string GivenDate { get; set; }
        public string TcNo { get; set; }
        public DateTime ExpDate { get; set; }
        public string DrivingLicenceNo { get; set; }
    }
}
