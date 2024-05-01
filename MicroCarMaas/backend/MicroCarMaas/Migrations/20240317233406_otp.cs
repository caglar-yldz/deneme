using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

#pragma warning disable CA1814 // Prefer jagged arrays over multidimensional

namespace MicroCarMaas.API.Migrations
{
    /// <inheritdoc />
    public partial class otp : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: new Guid("ad9a4d16-6cba-4a56-948b-86b543904f27"));

            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: new Guid("e40372ae-2ce4-43c0-b12f-bf4eae7cd230"));

            migrationBuilder.CreateTable(
                name: "Otps",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    PhoneNumber = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    HashedOtp = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    ExpireTime = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Otps", x => x.Id);
                });

            migrationBuilder.InsertData(
                table: "AspNetRoles",
                columns: new[] { "Id", "ConcurrencyStamp", "Name", "NormalizedName" },
                values: new object[,]
                {
                    { new Guid("a537f16d-6d5e-401c-958d-8596bc5fb23a"), "a537f16d-6d5e-401c-958d-8596bc5fb23a", "Admin", "ADMİN" },
                    { new Guid("b4a1f976-ea55-4395-8ac4-3935b44fb982"), "b4a1f976-ea55-4395-8ac4-3935b44fb982", "User", "USER" }
                });
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Otps");

            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: new Guid("a537f16d-6d5e-401c-958d-8596bc5fb23a"));

            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: new Guid("b4a1f976-ea55-4395-8ac4-3935b44fb982"));

            migrationBuilder.InsertData(
                table: "AspNetRoles",
                columns: new[] { "Id", "ConcurrencyStamp", "Name", "NormalizedName" },
                values: new object[,]
                {
                    { new Guid("ad9a4d16-6cba-4a56-948b-86b543904f27"), "ad9a4d16-6cba-4a56-948b-86b543904f27", "User", "USER" },
                    { new Guid("e40372ae-2ce4-43c0-b12f-bf4eae7cd230"), "e40372ae-2ce4-43c0-b12f-bf4eae7cd230", "Admin", "ADMİN" }
                });
        }
    }
}
