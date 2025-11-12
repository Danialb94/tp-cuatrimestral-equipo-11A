using dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace negocio
{

    //paciente1@mail.com
    //PacClave1
    public class UsuarioNegocio
    {
        public int Loguear(Usuario usuario)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                //CORROBORA QUE EXISTA EL MAIL
                if (!ChequeoMail(usuario)) return -1;

                //TRAE LOS DATOS EN CASO DE QUE EL COMBO MAIL Y CONTRASEÑA SEA CORRECTA
                datos.setearConsulta("Select IdUsuario, IdPermiso, Estado FROM Usuarios WHERE Email = @email AND Contrasenia = @pass");
                datos.setearParametro("@email", usuario.Email);
                datos.setearParametro("@pass", usuario.Contrasenia);
                datos.ejecutarLectura();

                if (datos.Lector.Read())
                {
                    //SI ENCUENTRA EL COMBO MAIL Y CONTRASEÑA
                    if (!(bool)datos.Lector["Estado"]) return -3;

                    usuario.IdUsuario = (int)datos.Lector["IdUsuario"];
                    int idPermiso = (int)datos.Lector["IdPermiso"];
                    usuario.TipoUsuario =
                    idPermiso == 1 ? TipoUsuario.ADMIN :
                    idPermiso == 2 ? TipoUsuario.MEDICO :
                    idPermiso == 3 ? TipoUsuario.RECEPCIONISTA :
                    TipoUsuario.PACIENTE;

                    return usuario.IdUsuario;


                }
                //NO SE ENCONTRÓ EL COMBO MAIL Y CONTRASEÑA
                return -2;
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

        public bool ChequeoMail(Usuario usuario)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                //CORROBORA QUE EXISTA EL MAIL
                datos.setearConsulta("SELECT IdUsuario AS Existe FROM Usuarios WHERE Email = @email");
                datos.setearParametro("@email", usuario.Email);
                datos.ejecutarLectura();
                if (!datos.Lector.Read()) return false;
                return true;
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

        public bool ValidarClave(int idUsuario, string clave)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("SELECT COUNT(*) FROM Usuarios WHERE IdUsuario = @id AND Contrasenia = @clave");
                datos.setearParametro("@id", idUsuario);
                datos.setearParametro("@clave", clave);
                datos.ejecutarLectura();

                if (datos.Lector.Read())
                    return (int)datos.Lector[0] > 0;

                return false;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

        public void ActualizarClave(int idUsuario, string nuevaClave)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("UPDATE Usuarios SET Contrasenia = @clave WHERE IdUsuario = @id");
                datos.setearParametro("@id", idUsuario);
                datos.setearParametro("@clave", nuevaClave);
                datos.ejecutarAccion();
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

        public bool ExisteEmail(string email)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("SELECT COUNT(*) FROM Usuarios WHERE Email = @Email");
                datos.setearParametro("@Email", email);
                datos.ejecutarLectura();

                if (datos.Lector.Read())
                {
                    int cantidad = (int)datos.Lector[0];
                    return cantidad > 0;
                }
                return false;
            }
            catch (Exception ex)
            {
                throw new Exception("Error al verificar el email del usuario.", ex);
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

    }
}
