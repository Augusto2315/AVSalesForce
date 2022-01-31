using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

[Table("CadGrupo")]
public class Grupo
{

    [Required] 
    public int CodEmpresa { get; set; }

    [Required] 
    public int CodGrupo { get; set; }

    [Required]
    [StringLength(100)]
    public string NomeGrupo { get; set; }

}