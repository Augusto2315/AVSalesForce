using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System.Collections.Generic;
using System.Threading.Tasks;

[ApiController]
[Route("[controller]")]
public class ConfiguracaoCampoController : ControllerBase
{

    private readonly ILogger<ConfiguracaoCampoController> _logger;

    public ConfiguracaoCampoController(ILogger<ConfiguracaoCampoController> logger)
    {
        _logger = logger;
    }

    [HttpGet]
    public async Task<List<ConfiguracaoCampos>> Get()
    {
        ConfiguracaoCamposDAO DAO = new ConfiguracaoCamposDAO();
        List<ConfiguracaoCampos> lista = await DAO.Get();
        return lista;
    }


    [HttpPut]
    public Task<ConfiguracaoCampos> Save(ConfiguracaoCampos configuracao)
    {
        ConfiguracaoCamposDAO DAO = new ConfiguracaoCamposDAO();
        return DAO.Save(configuracao);
    }

    [HttpPost]
    public Task<ConfiguracaoCampos> Update(ConfiguracaoCampos configuracao)
    {
        ConfiguracaoCamposDAO DAO = new ConfiguracaoCamposDAO();
        return DAO.Update(configuracao);
    }

}
