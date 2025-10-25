using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dominio
{
    public class Usuario
    {
        public int IdUsuario { get; set; }
        public string Email { get; set; }

        public string Contrasenia { get; set; }

        //public Permiso IdPermiso { get; set; }
    }
}
