using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

[Table("CadUsuario")]
 public class Usuarios
{ 
    [Required]
    [Key]
    [StringLength(50)]
    public string Usuario { get; set; }
    [Required]
    [StringLength(250)]
    public string Nome { get; set; }
    [StringLength(250)]
    public string Email { get; set; }
    [Required]
    public Grupo Grupo { get; set; }
}
