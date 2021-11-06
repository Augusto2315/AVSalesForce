using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using SalesForceApi.DAO;
using SalesForceApi.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SalesForceApi.Controllers
{
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
            DbContextOptions<ConfiguracaoCamposDAO> options = new DbContextOptions<ConfiguracaoCamposDAO>();
            ConfiguracaoCamposDAO DAO = new ConfiguracaoCamposDAO(options);
            List<ConfiguracaoCampos> lista = await DAO.GetConfiguracoes();
            return lista;
        }


        [HttpPut]
        public void Save(ConfiguracaoCampos configuracao)
        {
            DbContextOptions<ConfiguracaoCamposDAO> options = new DbContextOptions<ConfiguracaoCamposDAO>();
            ConfiguracaoCamposDAO DAO = new ConfiguracaoCamposDAO(options);
            DAO.InsertNew(configuracao);
        }

        [HttpPost]
        public void Update(ConfiguracaoCampos configuracao)
        {
            DbContextOptions<ConfiguracaoCamposDAO> options = new DbContextOptions<ConfiguracaoCamposDAO>();
            ConfiguracaoCamposDAO DAO = new ConfiguracaoCamposDAO(options);
            DAO.Update(configuracao);
        }

    }
}
