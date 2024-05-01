using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

#pragma warning disable CA1814 // Prefer jagged arrays over multidimensional

namespace MicroCarMaas.API.Migrations
{
    /// <inheritdoc />
    public partial class CarConfigs : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: new Guid("55fb2428-a9c0-48da-ab99-5d057316c574"));

            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: new Guid("fe36a598-34e4-40bd-b7ec-27b9661abafb"));

            migrationBuilder.DropColumn(
                name: "BatteryStatus",
                table: "Cars");

            migrationBuilder.DropColumn(
                name: "Location",
                table: "Cars");

            migrationBuilder.DropColumn(
                name: "Name",
                table: "Cars");

            migrationBuilder.AddColumn<double>(
                name: "Latitude",
                table: "Cars",
                type: "float",
                nullable: false,
                defaultValue: 0.0);

            migrationBuilder.AddColumn<double>(
                name: "Longitude",
                table: "Cars",
                type: "float",
                nullable: false,
                defaultValue: 0.0);

            migrationBuilder.AddColumn<DateTime>(
                name: "Timestamp",
                table: "Cars",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified));

            migrationBuilder.InsertData(
                table: "AspNetRoles",
                columns: new[] { "Id", "ConcurrencyStamp", "Name", "NormalizedName" },
                values: new object[,]
                {
                    { new Guid("a3aeed36-d418-4852-aeab-c76703b3afd0"), "a3aeed36-d418-4852-aeab-c76703b3afd0", "Admin", "ADMİN" },
                    { new Guid("fb234a25-afa3-4a51-879e-00e3ef3e9aff"), "fb234a25-afa3-4a51-879e-00e3ef3e9aff", "User", "USER" }
                });
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: new Guid("a3aeed36-d418-4852-aeab-c76703b3afd0"));

            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: new Guid("fb234a25-afa3-4a51-879e-00e3ef3e9aff"));

            migrationBuilder.DropColumn(
                name: "Latitude",
                table: "Cars");

            migrationBuilder.DropColumn(
                name: "Longitude",
                table: "Cars");

            migrationBuilder.DropColumn(
                name: "Timestamp",
                table: "Cars");

            migrationBuilder.AddColumn<int>(
                name: "BatteryStatus",
                table: "Cars",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<string>(
                name: "Location",
                table: "Cars",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");

            migrationBuilder.AddColumn<string>(
                name: "Name",
                table: "Cars",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");

            migrationBuilder.InsertData(
                table: "AspNetRoles",
                columns: new[] { "Id", "ConcurrencyStamp", "Name", "NormalizedName" },
                values: new object[,]
                {
                    { new Guid("55fb2428-a9c0-48da-ab99-5d057316c574"), "55fb2428-a9c0-48da-ab99-5d057316c574", "Admin", "ADMİN" },
                    { new Guid("fe36a598-34e4-40bd-b7ec-27b9661abafb"), "fe36a598-34e4-40bd-b7ec-27b9661abafb", "User", "USER" }
                });
        }
    }
}
