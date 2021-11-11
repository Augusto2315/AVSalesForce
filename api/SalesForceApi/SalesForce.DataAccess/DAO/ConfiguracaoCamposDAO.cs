using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using SalesForce.DataAcess;

public class ConfiguracaoCamposDAO : DAO<ConfiguracaoCampos>
{

    public DbSet<ConfiguracaoCampos> Campos { get; set; }

    public ConfiguracaoCamposDAO() : base(new SalesForceDBContext())
    {
        Campos = DBContext.Campos;
    }

    public async Task<ConfiguracaoCampos> FindById(int codEmpresa, string campo)
    {
        SalesForceDBContext context = new SalesForceDBContext();

        return await context.Campos.SingleAsync(cfg => cfg.CodEmpresa == codEmpresa && cfg.Campo == campo);
    }

    public async Task<List<ConfiguracaoCampos>> Get()
    {
        return await DBContext.Campos.ToListAsync();
    }

    public async Task<ConfiguracaoCampos> Save(ConfiguracaoCampos campo)
    {
        return await base.Save(campo);
    }

    public async Task<bool> RemoveAll()
    {
        SalesForceDBContext context = new SalesForceDBContext();
        await context.Database.ExecuteSqlRawAsync("TRUNCATE TABLE Campos");
        return true;
    }


    public override async Task<ConfiguracaoCampos> Update(ConfiguracaoCampos campo)
    {
        ConfiguracaoCampos cfg = await FindById(campo.CodEmpresa, campo.Campo);
        cfg.Tela = campo.Tela;
        cfg.Visivel = campo.Visivel;

        await DBContext.SaveChangesAsync();
        return campo;
    }

}