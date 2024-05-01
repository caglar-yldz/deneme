using MicroCarMaas.API.Models.Domain;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using System.Reflection.Emit;

namespace MicroCarMaas.API.Data
{
    public class AppDbContext : IdentityDbContext<User, Role, Guid>
    {
        public AppDbContext(DbContextOptions<AppDbContext> dbContextOptions) : base(dbContextOptions)
        {


        }
        public DbSet<Otp> Otps { get; set; }
        public DbSet<Faq> Faqs { get; set; }
        public DbSet<User> Users { get; set; }
        public DbSet<DrivingLicence> DrivingLicences { get; set; }
        public DbSet<Car> Cars { get; set; }
        DbSet<Announcement> Announcements { get; set; }
        DbSet<Campaign> Campaigns { get; set; }
        DbSet<Card> Cards { get; set; }
        DbSet<ChargingStation> ChargingStations { get; set; }
        DbSet<CompanyInfo> CompanyInfos { get; set; }
        DbSet<ContactUs> ContactUs { get; set; }
        DbSet<Contract> Contracts { get; set; }
        DbSet<Pricing> Pricings { get; set; }
        DbSet<Renting> Rentings { get; set; }
        DbSet<RentingCarPhoto> RentingCarPhotos { get; set; }
        public DbSet<ServiceArea> ServiceAreas { get; set; }
        public DbSet<Coordinate> Coordinates { get; set; }

        protected override void OnModelCreating(ModelBuilder builder)
        {
            // builder.Entity<Coordinate>().HasNoKey();
            base.OnModelCreating(builder);

            
            var AdminRoleId = Guid.NewGuid();
            var UserRoleId = Guid.NewGuid();


            var roles = new List<Role>
            {
                new Role
                {
                    Id = AdminRoleId,
                    ConcurrencyStamp = AdminRoleId.ToString(),
                    Name = "Admin",
                    NormalizedName = "Admin".ToUpper()
                },
                new Role
                {
                    Id = UserRoleId,
                    ConcurrencyStamp = UserRoleId.ToString(),
                    Name = "User",
                    NormalizedName = "User".ToUpper()
                }
            };

            builder.Entity<Role>().HasData(roles);
        }
    }

}
