using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System.Collections.Generic;
using System.Threading.Tasks;

[ApiController]
[Route("[controller]")]
public class GruposController : ControllerBase
{

    private readonly ILogger<GruposController> _logger;

    public GruposController(ILogger<GruposController> logger)
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
    public Task<Grupo> Save(Grupo grupo)
    {
        GrupoDAO DAO = new GrupoDAO();
        return DAO.Save(grupo);
    }

    [HttpPost]
    public Task<Grupo> Update(Grupo grupo)
    {
        GrupoDAO DAO = new GrupoDAO();
        return DAO.Update(grupo);
    }

    [HttpPost("RemoveAll")]
    public Task<bool> RemoveAll()
    {
        GrupoDAO DAO = new GrupoDAO();
        return DAO.RemoveAll();
    }

}
