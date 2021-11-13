using Microsoft.EntityFrameworkCore;

public class SalesForceDBContext : DbContext
{

    private const string sqlString = "Server=localhost\\SQLExpress;Database=AvSalesForce;User Id=adminsalesforce;password=salesforce123;Trusted_Connection=True;MultipleActiveResultSets=true";

    protected override void OnConfiguring(DbContextOptionsBuilder options)
    {
        options.UseSqlServer(sqlString, builder => builder.EnableRetryOnFailure());
    }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<ConfiguracaoCampos>()
        .HasKey(c => new { c.CodEmpresa, c.Tela, c.Campo });

        modelBuilder.Entity<Grupo>()
        .HasKey(c => new { c.CodEmpresa, c.CodGrupo });

    }

    public DbSet<ConfiguracaoCampos> Campos { get; set; }
    public DbSet<Grupo> Grupos { get; set; }
    public DbSet<Usuarios> Usuarios { get; set; }

}