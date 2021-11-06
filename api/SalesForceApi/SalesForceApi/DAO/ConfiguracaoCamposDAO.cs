using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using SalesForceApi.Models;

namespace SalesForceApi.DAO
{
    public class ConfiguracaoCamposDAO : DbContext
    {

        private const string sqlString = "Server=localhost\\SQLExpress;Database=AvSalesForce;User Id=adminsalesforce;password=salesforce123;Trusted_Connection=True;MultipleActiveResultSets=true";

        public ConfiguracaoCamposDAO(DbContextOptions<ConfiguracaoCamposDAO> options)
            : base(options)
        {
        }

        protected override void OnConfiguring(DbContextOptionsBuilder options)
        {
            options.UseSqlServer(sqlString, builder => builder.EnableRetryOnFailure());
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<ConfiguracaoCampos>()
                .HasKey(c => new { c.CodEmpresa, c.Tela, c.Campo });
        }

        public DbSet<ConfiguracaoCampos> Campos { get; set; }

        public Task<List<ConfiguracaoCampos>> GetConfiguracoes()
        {
            return this.Campos.ToListAsync();
        }

    }
}
