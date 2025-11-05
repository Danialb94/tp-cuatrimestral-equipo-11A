using dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace negocio
{
    internal class PacienteNegocio
    {
        public List<Paciente> listar()
        {
            List<Paciente> lista = new List<Paciente>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("select P.IdPaciente, PE.Nombre, PE.Apellido, PE.Telefono, TD.Descripcion AS TipoDocumento, P.IdTipoDocumento, P.Documento, P.Domicilio, P.FechaNacimiento, C.Descripcion AS Cobertura, P.IdCobertura, I.IdImagen, I.UrlImagen from Pacientes P join TiposDocumento TD ON TD.IdTipoDocumento = P.IdTipoDocumento join Coberturas C ON C.IdCobertura = P.IdCobertura join Personas PE ON PE.IdPersona = P.IdPersona join Usuarios U ON U.IdUsuario = PE.IdUsuario join Imagenes I ON I.IdImagen = PE.IdImagen");
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    Paciente paciente = new Paciente();
                    paciente.IdPaciente = (int)datos.Lector["IdPaciente"];
                    if (!(datos.Lector["Nombre"] is DBNull))
                        paciente.Nombre = (string)datos.Lector["Nombre"];
                    if (!(datos.Lector["Apellido"] is DBNull))
                        paciente.Apellido = (string)datos.Lector["Apellido"];
                    if (!(datos.Lector["TipoDocumento"] is DBNull))
                    {
                        paciente.TipoDocumento.Descripcion = (string)datos.Lector["TipoDocumento"];
                        paciente.TipoDocumento.IdTipoDocumento = (int)datos.Lector["IdTipoDocumento"];
                    }
                    if (!(datos.Lector["Documento"] is DBNull))
                        paciente.Documento = (string)datos.Lector["Documento"];
                    if (!(datos.Lector["Domicilio"] is DBNull))
                        paciente.Domicilio = (string)datos.Lector["Domicilio"];
                    if (!(datos.Lector["FechaNacimiento"] is DBNull))
                        paciente.FechaNacimiento = (DateTime)datos.Lector["FechaNacimiento"];
                    if (!(datos.Lector["Cobertura"] is DBNull))
                    {
                        paciente.Cobertura.Descripcion = (string)datos.Lector["Cobertura"];
                        paciente.Cobertura.IdCobertura = (int)datos.Lector["IdCobertura"];
                    }
                    if (!(datos.Lector["IdImagen"] is DBNull))
                    {
                        paciente.Imagen.IdImagen = (int)datos.Lector["IdImagen"];
                        paciente.Imagen.UrlImagen = (string)datos.Lector["UrlImagen"];
                    }

                    lista.Add(paciente);
                }
                return lista;
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

        public void agregar(Paciente nuevo)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("DECLARE @IDU int, @IDP int; INSERT INTO Usuarios (Email, Contrasenia, IdPermiso) VALUES (@Email, @Contrasenia, @IdPermiso); SET @IDU = SCOPE_IDENTITY(); INSERT INTO Personas (Nombre, Apellido, Telefono, IdUsuario)  VALUES (@Nombre, @Apellido, @Telefono, @IDU); SET @IDP = SCOPE_IDENTITY(); INSERT INTO Pacientes (IdTipoDocumento, Documento, Domicilio, FechaNacimiento, IdPersona, IdCobertura)  VALUES (@IdTipoDocumento, @Documento, @Domicilio, @FechaNacimiento, @IDP, @IdCobertura);");
                //USUARIO
                datos.setearParametro("@Email", nuevo.Usuario.Email);
                datos.setearParametro("@Contrasenia", nuevo.Usuario.Contrasenia);
                datos.setearParametro("@IdPermiso", nuevo.Usuario.Permiso.IdPermiso);
                //PERSONA
                datos.setearParametro("@Nombre", nuevo.Nombre);
                datos.setearParametro("@Apellido", nuevo.Apellido);
                datos.setearParametro("@Telefono", nuevo.Telefono);
                //PACIENTES
                datos.setearParametro("@IdTipoDocumento", nuevo.TipoDocumento.IdTipoDocumento);
                datos.setearParametro("@Documento", nuevo.Documento);
                datos.setearParametro("@Domicilio", nuevo.Domicilio);
                datos.setearParametro("@FechaNacimiento", nuevo.FechaNacimiento);
                datos.setearParametro("@IdCobertura", nuevo.Cobertura.IdCobertura);
                datos.ejecutarLectura();

                // INSERT TABLA IMAGENES
                if (nuevo.Imagen.UrlImagen != null)
                {
                    ImagenNegocio imgNegocio = new ImagenNegocio();
                    imgNegocio.Agregar(nuevo.Imagen, Convert.ToInt32(datos.Lector["IdPaciente"]));
                }

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
