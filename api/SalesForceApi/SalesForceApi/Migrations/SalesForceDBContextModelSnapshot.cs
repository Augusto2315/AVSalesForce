﻿// <auto-generated />
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;
using SalesForceApi;

namespace SalesForceApi.Migrations
{
    [DbContext(typeof(SalesForceDBContext))]
    partial class SalesForceDBContextModelSnapshot : ModelSnapshot
    {
        protected override void BuildModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("Relational:MaxIdentifierLength", 128)
                .HasAnnotation("ProductVersion", "5.0.11")
                .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

            modelBuilder.Entity("ConfiguracaoCampos", b =>
                {
                    b.Property<int>("CodEmpresa")
                        .HasColumnType("int");

                    b.Property<string>("Tela")
                        .HasColumnType("nvarchar(450)");

                    b.Property<string>("Campo")
                        .HasColumnType("nvarchar(450)");

                    b.Property<bool>("Visivel")
                        .HasColumnType("bit");

                    b.HasKey("CodEmpresa", "Tela", "Campo");

                    b.ToTable("Campos");
                });
#pragma warning restore 612, 618
        }
    }
}