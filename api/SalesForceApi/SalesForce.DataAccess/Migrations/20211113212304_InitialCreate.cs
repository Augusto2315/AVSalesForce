using Microsoft.EntityFrameworkCore.Migrations;

namespace SalesForce.DataAccess.Migrations
{
    public partial class InitialCreate : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "CadGrupo",
                columns: table => new
                {
                    CodEmpresa = table.Column<int>(type: "int", nullable: false),
                    CodGrupo = table.Column<int>(type: "int", nullable: false),
                    NomeGrupo = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_CadGrupo", x => new { x.CodEmpresa, x.CodGrupo });
                });

            migrationBuilder.CreateTable(
                name: "ConfiguracaoCampos",
                columns: table => new
                {
                    CodEmpresa = table.Column<int>(type: "int", nullable: false),
                    Campo = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: false),
                    Tela = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: false),
                    Visivel = table.Column<bool>(type: "bit", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ConfiguracaoCampos", x => new { x.CodEmpresa, x.Tela, x.Campo });
                });

            migrationBuilder.CreateTable(
                name: "CadUsuario",
                columns: table => new
                {
                    Usuario = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false),
                    Nome = table.Column<string>(type: "nvarchar(250)", maxLength: 250, nullable: false),
                    Email = table.Column<string>(type: "nvarchar(250)", maxLength: 250, nullable: false),
                    GrupoCodEmpresa = table.Column<int>(type: "int", nullable: true),
                    GrupoCodGrupo = table.Column<int>(type: "int", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_CadUsuario", x => x.Usuario);
                    table.ForeignKey(
                        name: "FK_CadUsuario_CadGrupo_GrupoCodEmpresa_GrupoCodGrupo",
                        columns: x => new { x.GrupoCodEmpresa, x.GrupoCodGrupo },
                        principalTable: "CadGrupo",
                        principalColumns: new[] { "CodEmpresa", "CodGrupo" },
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateIndex(
                name: "IX_CadUsuario_GrupoCodEmpresa_GrupoCodGrupo",
                table: "CadUsuario",
                columns: new[] { "GrupoCodEmpresa", "GrupoCodGrupo" });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "CadUsuario");

            migrationBuilder.DropTable(
                name: "ConfiguracaoCampos");

            migrationBuilder.DropTable(
                name: "CadGrupo");
        }
    }
}
