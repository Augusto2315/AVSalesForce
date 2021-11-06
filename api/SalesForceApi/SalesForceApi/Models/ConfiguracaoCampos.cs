using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace SalesForceApi.Models
{
    public class ConfiguracaoCampos
    {

        [Required]
        public int CodEmpresa { get; set; }
        [Required]
        public string Campo { get; set; }
        [Required]
        public string Tela { get; set; }
        [Required]
        public bool Visivel { get; set; }
        public List<UsuariosPermissao> UsuariosPermissao { get; set; }
    }


    public class UsuariosPermissao
    {
        [Key]
        [Required]
        public string Usuario { get; set; }
        [Required]
        public string Campo { get; set; }
        public ConfiguracaoCampos CfgCampo { get; set; }
    }

}
