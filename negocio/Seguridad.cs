using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using dominio;

namespace negocio
{
    public static class Seguridad
    {
        public static bool sesionActiva(object user)
        {
            Usuario usuario = user != null ? (Usuario)user : null;
            if(usuario!=null&&usuario.IdUsuario!=0)
                return true;
            else
                return false;

        }

        public static bool esRecepcionista(object user)
        {
            Usuario usuario = (Usuario)user;
            if(usuario != null && usuario.TipoUsuario == TipoUsuario.RECEPCIONISTA)
                return true;
            else return false;
        }

        public static bool esMedico(object user)
        {
            Usuario usuario = (Usuario)user;
            if (usuario != null && usuario.TipoUsuario == TipoUsuario.MEDICO)
                return true;
            else return false;
        }

        public static bool esPaciente(object user)
        {
            Usuario usuario = (Usuario)user;
            if (usuario != null && usuario.TipoUsuario == TipoUsuario.PACIENTE)
                return true;
            else return false;
        }

        public static bool esAdministrador(object user)
        {
            Usuario usuario = (Usuario)user;
            if (usuario != null && usuario.TipoUsuario == TipoUsuario.ADMIN)
                return true;
            else return false;
        }
    }
}
