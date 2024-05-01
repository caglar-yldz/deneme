using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

#pragma warning disable CA1814 // Prefer jagged arrays over multidimensional

namespace MicroCarMaas.API.Migrations
{
    /// <inheritdoc />
    public partial class mastercode : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
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
                    { new Guid("55fb2428-a9c0-48da-ab99-5d057316c574"), "55fb2428-a9c0-48da-ab99-5d057316c574", "Admin", "ADMİN" },
                    { new Guid("fe36a598-34e4-40bd-b7ec-27b9661abafb"), "fe36a598-34e4-40bd-b7ec-27b9661abafb", "User", "USER" }
                });
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: new Guid("55fb2428-a9c0-48da-ab99-5d057316c574"));

            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: new Guid("fe36a598-34e4-40bd-b7ec-27b9661abafb"));

            migrationBuilder.InsertData(
                table: "AspNetRoles",
                columns: new[] { "Id", "ConcurrencyStamp", "Name", "NormalizedName" },
                values: new object[,]
                {
                    { new Guid("a537f16d-6d5e-401c-958d-8596bc5fb23a"), "a537f16d-6d5e-401c-958d-8596bc5fb23a", "Admin", "ADMİN" },
                    { new Guid("b4a1f976-ea55-4395-8ac4-3935b44fb982"), "b4a1f976-ea55-4395-8ac4-3935b44fb982", "User", "USER" }
                });
        }
    }
}
