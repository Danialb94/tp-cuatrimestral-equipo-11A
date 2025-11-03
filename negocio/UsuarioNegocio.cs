using dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using dominio;

namespace negocio
{
    public class UsuarioNegocio
    {
        public bool Loguear(Usuario usuario)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("Select IdUsuario, IdPermiso FROM Usuarios WHERE Email = @email AND Contrasenia = @pass");
                datos.setearParametro("@email", usuario.Email);
                datos.setearParametro("@pass", usuario.Contrasenia);

                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {

                    usuario.IdUsuario = (int)datos.Lector["IdUsuario"];
                 
                    int idPermiso = (int)datos.Lector["IdPermiso"];
                    usuario.TipoUsuario =
                    idPermiso == 1 ? TipoUsuario.ADMIN :
                    idPermiso == 2 ? TipoUsuario.MEDICO :
                    idPermiso == 3 ? TipoUsuario.RECEPCIONISTA :
                    TipoUsuario.PACIENTE;

                    return true;


                }
                return false;
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }


        }
    }
}
