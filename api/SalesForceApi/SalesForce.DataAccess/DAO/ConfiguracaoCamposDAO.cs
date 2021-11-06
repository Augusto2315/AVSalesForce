using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;

public class ConfiguracaoCamposDAO : DAO<ConfiguracaoCampos>
{

    private SalesForceDBContext context;

    public ConfiguracaoCamposDAO()
    {
        context = new SalesForceDBContext();
    }

    public async Task<ConfiguracaoCampos> FindById(int codEmpresa, string campo)
    {
        SalesForceDBContext context = new SalesForceDBContext();

        return await context.Campos.SingleAsync(cfg => cfg.CodEmpresa == codEmpresa && cfg.Campo == campo);
    }

    public async Task<List<ConfiguracaoCampos>> Get()
    {
        return await context.Campos.ToListAsync();
    }

    public void Save(ConfiguracaoCampos campo)
    {
        context.Campos.Add(campo);
        context.SaveChanges();
    }

    public async Task Update(ConfiguracaoCampos campo)
    {
        ConfiguracaoCampos cfg = await FindById(campo.CodEmpresa, campo.Campo);
        cfg.Tela = campo.Tela;
        cfg.Visivel = campo.Visivel;

        context.SaveChanges();
    }

}