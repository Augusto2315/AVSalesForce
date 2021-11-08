using Microsoft.EntityFrameworkCore.Migrations;

namespace SalesForceApi.Migrations
{
    public partial class InitialCreate : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Campos",
                columns: table => new
                {
                    CodEmpresa = table.Column<int>(type: "int", nullable: false),
                    Campo = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    Tela = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    Visivel = table.Column<bool>(type: "bit", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Campos", x => new { x.CodEmpresa, x.Tela, x.Campo });
                });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Campos");
        }
    }
}
