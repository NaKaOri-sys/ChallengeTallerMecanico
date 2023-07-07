using System.ComponentModel.DataAnnotations;

namespace ChallengeTallerMecanico.Client.Models
{
    public class ClienteVM
    {
        [Required]
        public string Nombre { get; set; }
        [Required]
        public string Apellido { get; set; }
        [Required(ErrorMessage = "El campo Email es requerido.")]
        [EmailAddress(ErrorMessage = "El campo Email no es una dirección de correo electrónico válida.")]
        public string Email { get; set; }
    }
}
