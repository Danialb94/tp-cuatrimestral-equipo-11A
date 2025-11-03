using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dominio
{

    public enum TipoUsuario
    {
        ADMIN = 1,
        MEDICO = 2,
        RECEPCIONISTA = 3,
        PACIENTE = 4

    }
    public class Usuario
    {
        public int IdUsuario { get; set; }
        public string Email { get; set; }
        public string Contrasenia { get; set; }

        public Permiso Permiso { get; set; }
        public TipoUsuario TipoUsuario { get; set; }


        public Usuario() { }
        public Usuario(string user, string pass)
        {

            Email = user;
            Contrasenia = pass;
          
        }
    }
}
