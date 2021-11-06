using System;
using Microsoft.EntityFrameworkCore;
using SalesForceApi.Models;

namespace SalesForceApi.DAO
{
    public class OrcamentoDAO : DbContext
    {
        public OrcamentoDAO(DbContextOptions<OrcamentoDAO> options)
            : base(options)
        {
        }

        public DbSet<Orcamento> Orcamentos { get; set; }
    }
}
