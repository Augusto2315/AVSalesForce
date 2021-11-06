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

            migrationBuilder.CreateTable(
                name: "UsuariosPermissao",
                columns: table => new
                {
                    Usuario = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    Campo = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    CfgCampoCodEmpresa = table.Column<int>(type: "int", nullable: true),
                    CfgCampoTela = table.Column<string>(type: "nvarchar(450)", nullable: true),
                    CfgCampoCampo = table.Column<string>(type: "nvarchar(450)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_UsuariosPermissao", x => x.Usuario);
                    table.ForeignKey(
                        name: "FK_UsuariosPermissao_Campos_CfgCampoCodEmpresa_CfgCampoTela_CfgCampoCampo",
                        columns: x => new { x.CfgCampoCodEmpresa, x.CfgCampoTela, x.CfgCampoCampo },
                        principalTable: "Campos",
                        principalColumns: new[] { "CodEmpresa", "Tela", "Campo" },
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateIndex(
                name: "IX_UsuariosPermissao_CfgCampoCodEmpresa_CfgCampoTela_CfgCampoCampo",
                table: "UsuariosPermissao",
                columns: new[] { "CfgCampoCodEmpresa", "CfgCampoTela", "CfgCampoCampo" });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "UsuariosPermissao");

            migrationBuilder.DropTable(
                name: "Campos");
        }
    }
}
