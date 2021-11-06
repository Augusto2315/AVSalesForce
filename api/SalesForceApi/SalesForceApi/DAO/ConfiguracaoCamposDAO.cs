using System;
using Microsoft.EntityFrameworkCore;
using SalesForceApi.Models;

namespace SalesForceApi.DAO
{
    public class ConfiguracaoCamposDAO : DbContext
    {
        public ConfiguracaoCamposDAO(DbContextOptions<ConfiguracaoCamposDAO> options)
            : base(options)
        {
        }

        public DbSet<ConfiguracaoCampos> Campos { get; set; }
    }
}
