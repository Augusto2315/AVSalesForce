using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using SalesForce.DataAcess;

public class GrupoDAO : DAO<Grupo>
{

    public DbSet<Grupo> Grupos { get; set; }

    public GrupoDAO() : base(new SalesForceDBContext())
    {
        Grupos = DBContext.Grupos;
    }

    public async Task<Grupo> FindById(int codEmpresa, int codGrupo)
    {
        SalesForceDBContext context = new SalesForceDBContext();

        return await context.Grupos.SingleAsync(cfg => cfg.CodEmpresa == codEmpresa && cfg.CodGrupo == codGrupo);
    }

    public async Task<List<Grupo>> Get()
    {
        return await DBContext.Grupos.ToListAsync();
    }

    public async Task<Grupo> Save(Grupo grupo)
    {
        return await base.Save(grupo, true);
    }

    public async Task<bool> Remove(Grupo grupo)
    {
        return await base.Delete(grupo);
    }

    public override async Task<Grupo> Update(Grupo grupo)
    {
        Grupo cfg = await FindById(grupo.CodEmpresa, grupo.CodGrupo);
        cfg.NomeGrupo = grupo.NomeGrupo;

        await DBContext.SaveChangesAsync();
        return grupo;
    }

}