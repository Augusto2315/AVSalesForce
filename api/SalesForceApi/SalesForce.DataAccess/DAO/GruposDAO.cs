using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using SalesForce.DataAcess;

public class GrupoDAO : DAO<Grupo>
{

    public GrupoDAO() : base(new SalesForceDBContext()) { }

    public async Task<Grupo> FindById(int codEmpresa, int codigo)
    {
        return await DBContext.Grupos.SingleAsync(cfg => cfg.CodEmpresa == codEmpresa && cfg.CodGrupo == codigo);
    }

    public async Task<List<Grupo>> Get()
    {
        return await DBContext.Grupos.ToListAsync();
    }

    public async Task<Grupo> Save(Grupo grupo)
    {
        return await base.Save(grupo);
    }

    public async Task<bool> RemoveAll()
    {
        await DBContext.Database.ExecuteSqlRawAsync($"TRUNCATE TABLE {GetTableName(new Grupo())}");
        return true;
    }


    public override async Task<Grupo> Update(Grupo grupo)
    {
        Grupo group = await FindById(grupo.CodEmpresa, grupo.CodGrupo);
        group.NomeGrupo = grupo.NomeGrupo;

        await DBContext.SaveChangesAsync();
        return group;
    }

}