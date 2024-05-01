using JetSms;
using MicroCarMaas.API.Data;
using MicroCarMaas.API.Mappings;
using MicroCarMaas.API.Models.Domain;
using MicroCarMaas.API.Repositories.Abstracts;
using MicroCarMaas.API.Repositories.Concretes;
using MicroCarMaas.API.Services.Abstracts;
using MicroCarMaas.API.Services.Concretes;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Logging;
using Microsoft.IdentityModel.Tokens;
using Microsoft.OpenApi.Models;
using System.Text;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
IdentityModelEventSource.ShowPII = true;
builder.Services.AddControllers();
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen(options =>
{
    options.SwaggerDoc("v1", new OpenApiInfo { Title = "MicroCarMaas API", Version = "v1" });
    options.AddSecurityDefinition(JwtBearerDefaults.AuthenticationScheme, new OpenApiSecurityScheme
    {
        Name = "Authorization",
        In = ParameterLocation.Header,
        Type = SecuritySchemeType.ApiKey,
        Scheme = JwtBearerDefaults.AuthenticationScheme
    });

    options.AddSecurityRequirement(new OpenApiSecurityRequirement
    {
        {
            new OpenApiSecurityScheme
            {
                Reference = new OpenApiReference
                {
                    Type = ReferenceType.SecurityScheme,
                    Id = JwtBearerDefaults.AuthenticationScheme
                },
                Scheme = "Oauth2",
                Name = JwtBearerDefaults.AuthenticationScheme,
                In = ParameterLocation.Header
            },
            new List<string>()
        }
    });
});
builder.Services.AddDbContext<AppDbContext>(options =>
{
    options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection"));
});
builder.Services.AddScoped<ITokenRepository, TokenRepository>();
builder.Services.AddScoped<IServiceAreaRepository, ServiceAreaRepository>();
builder.Services.AddScoped<IFaqRepository, FaqRepository>();

builder.Services.AddScoped<ICarRepository, CarRepository>();
builder.Services.AddScoped<IOtpRepository,OtpRepository>();
builder.Services.AddScoped<IOtpService,OtpService>();
builder.Services.AddScoped<ISmsRepository,SmsRepository>();
builder.Services.AddScoped<SMSServiceSoap>(provider => new SMSServiceSoapClient(SMSServiceSoapClient.EndpointConfiguration.SMSServiceSoap));
IServiceCollection serviceCollection = builder.Services.AddAutoMapper(typeof(AutoMappingProfile));
builder.Services.AddScoped<IUserRepository, UserRepository>();

builder.Services.AddIdentity<User, Role>()
    .AddEntityFrameworkStores<AppDbContext>()
    .AddDefaultTokenProviders();


builder.Services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme)
    .AddJwtBearer(options =>
    options.TokenValidationParameters = new TokenValidationParameters
    {
        ValidateIssuer = true,
        ValidateAudience = true,
        ValidateLifetime = true,
        ValidateIssuerSigningKey = true,
        ValidIssuer = builder.Configuration["Jwt:Issuer"],
        ValidAudience = builder.Configuration["Jwt:Audience"],
        IssuerSigningKey = new SymmetricSecurityKey(
            Encoding.UTF8.GetBytes(builder.Configuration["Jwt:Key"]))
    });

builder.Services.AddHttpClient();


var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseAuthentication();
app.UseAuthorization();

app.MapControllers();

app.Run();
