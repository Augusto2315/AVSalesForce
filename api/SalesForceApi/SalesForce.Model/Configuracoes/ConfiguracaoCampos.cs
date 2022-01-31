using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

[Table("ConfiguracaoCampos")]
public class ConfiguracaoCampos
{
    [Required]
    public int CodEmpresa { get; set; }

    [Required]
    [StringLength(100)]
    public string Campo { get; set; }

    [Required]
    [StringLength(100)]
    public string Tela { get; set; }

    [Required]
    public bool Visivel { get; set; }

}
