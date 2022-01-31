using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System.Collections.Generic;
using System.Threading.Tasks;

[ApiController]
[Route("[controller]")]
public class GrupoController : ControllerBase
{

    private readonly ILogger<GrupoController> _logger;

    public GrupoController(ILogger<GrupoController> logger)
    {
        _logger = logger;
    }

    [HttpGet]
    public async Task<List<Grupo>> Get()
    {
        GrupoDAO DAO = new GrupoDAO();
        List<Grupo> lista = await DAO.Get();
        return lista;
    }


    [HttpPut]
    public async Task<Grupo> Save(Grupo grupo)
    {
        GrupoDAO DAO = new GrupoDAO();

        List<Grupo> lista = await DAO.Get();

        int maiorCodigo = 0;
        lista.ForEach(item =>
        {
            if (item.CodGrupo > maiorCodigo) maiorCodigo = item.CodGrupo;
        });


        grupo.CodGrupo = maiorCodigo+1;
        return await DAO.Save(grupo);
    }

    [HttpPost]
    public Task<Grupo> Update(Grupo grupo)
    {
        GrupoDAO DAO = new GrupoDAO();
        return DAO.Update(grupo);
    }


    [HttpDelete]
    public Task<bool> Delete(Grupo grupo)
    {
        GrupoDAO DAO = new GrupoDAO();
        return DAO.Remove(grupo);
    }

}
