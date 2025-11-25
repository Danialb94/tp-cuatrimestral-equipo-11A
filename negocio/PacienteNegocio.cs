using dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace negocio
{
    public class PacienteNegocio
    {
        public List<Paciente> Listar()
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
                    paciente.Nombre = (string)datos.Lector["Nombre"];
                    paciente.Apellido = (string)datos.Lector["Apellido"];
                    if (!(datos.Lector["Telefono"] is DBNull))
                    paciente.Telefono = Convert.ToString(datos.Lector["Telefono"]);
                    paciente.TipoDocumento.IdTipoDocumento = (int)datos.Lector["IdTipoDocumento"];
                    paciente.TipoDocumento.Descripcion = (string)datos.Lector["TipoDocumento"];
                    paciente.Documento = Convert.ToString(datos.Lector["Documento"]);
                    paciente.Domicilio = (string)datos.Lector["Domicilio"];
                    paciente.FechaNacimiento = (DateTime)datos.Lector["FechaNacimiento"];
                    if (!(datos.Lector["Cobertura"] is DBNull))
                    {
                        paciente.Cobertura.IdCobertura = (int)datos.Lector["IdCobertura"];
                        paciente.Cobertura.Descripcion = (string)datos.Lector["Cobertura"];
                    }
                    if (!(datos.Lector["IdImagen"] is DBNull))
                    {
                        paciente.Imagen.IdImagen = (int)datos.Lector["IdImagen"];
                        paciente.Imagen.UrlImagen = (string)datos.Lector["UrlImagen"];
                    }
                    
                    List<string> aux = new List<string>();
                    aux = ListarAlergias(paciente.IdPaciente);
                    if (aux.Count() != 0) paciente.Alergias = aux;

                    aux = ListarCondiciones(paciente.IdPaciente);
                    if (aux.Count() != 0) paciente.CondicionBase = aux;

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

        public void Agregar(Paciente nuevo)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("DECLARE @IDU int, @IDP int; INSERT INTO Usuarios (Email, Contrasenia, IdPermiso, Estado) VALUES (@Email, @Contrasenia, @IdPermiso, 1); SET @IDU = SCOPE_IDENTITY(); INSERT INTO Personas (Nombre, Apellido, Telefono, IdUsuario)  VALUES (@Nombre, @Apellido, @Telefono, @IDU); SET @IDP = SCOPE_IDENTITY(); INSERT INTO Pacientes (IdTipoDocumento, Documento, Domicilio, FechaNacimiento, IdPersona, IdCobertura)  VALUES (@IdTipoDocumento, @Documento, @Domicilio, @FechaNacimiento, @IDP, @IdCobertura);");
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
        //agregar alta de alergias y de condiciones base
        public void Modificar(Paciente nuevo)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("UPDATE Pacientes SET IdTipoDocumento = @IdTipoDocumento, Documento = @Documento, Domicilio = @Domicilio, FechaNacimiento = @FechaNacimiento, IdCobertura = @IdCobertura WHERE IdPaciente = @IdPaciente; go UPDATE Personas  SET Nombre = @Nombre, Apellido = @Apellido, Telefono = @Telefono WHERE IdPersona = @IdPersona; go UPDATE Usuarios  SET Email = @Email, Contrasenia = @Contrasenia IdPermiso = @IdPermiso WHERE IdUsuario = @IdUsuario;");
                //USUARIO
                datos.setearParametro("@IdPaciente", nuevo.IdPaciente);
                datos.setearParametro("@Email", nuevo.Usuario.Email);
                datos.setearParametro("@Contrasenia", nuevo.Usuario.Contrasenia);
                datos.setearParametro("@IdPermiso", nuevo.Usuario.Permiso.IdPermiso);
                //PERSONA
                datos.setearParametro("@IdPersona", nuevo.IdPersona);
                datos.setearParametro("@Nombre", nuevo.Nombre);
                datos.setearParametro("@Apellido", nuevo.Apellido);
                datos.setearParametro("@Telefono", nuevo.Telefono);
                //PACIENTES
                datos.setearParametro("@IdUsuario", nuevo.IdUsuario);
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
                    imgNegocio.Modificar(nuevo.Imagen);
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
        //modificar alergias y de condiciones base
        public void Baja(int IdPaciente)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("UPDATE Usuarios SET Estado = 0 WHERE IdUsuario = (SELECT IdUsuario FROM Personas WHERE IdPersona = (SELECT IdPersona FROM Pacientes WHERE IdPaciente = @IdPaciente))");
                //USUARIO
                datos.setearParametro("@IdPaciente", IdPaciente);
                datos.ejecutarAccion();
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

        public Paciente BuscarPorIdUsuario(int idUsuario)
        {
            AccesoDatos datos = new AccesoDatos();
            Paciente paciente = new Paciente();
            try
            {
                // 🔹 Primero traemos los datos básicos del médico
                datos.setearConsulta("select U.Email, P.IdPaciente, PE.Nombre, PE.Apellido, PE.Telefono, TD.Descripcion AS TipoDocumento, P.IdTipoDocumento, P.Documento, P.Domicilio, P.FechaNacimiento, C.Descripcion AS Cobertura, P.IdCobertura, I.IdImagen, I.UrlImagen  from Pacientes P  join TiposDocumento TD ON TD.IdTipoDocumento = P.IdTipoDocumento  join Coberturas C ON C.IdCobertura = P.IdCobertura  join Personas PE ON PE.IdPersona = P.IdPersona  join Usuarios U ON U.IdUsuario = PE.IdUsuario  left join Imagenes I ON I.IdImagen = PE.IdImagen Where 1=1 AND P.IdPersona = PE.IdPersona AND PE.IdUsuario = @IdUsuario");

                datos.setearParametro("@IdUsuario", idUsuario);
                datos.ejecutarLectura();

                if (datos.Lector.Read())
                {
                    paciente.Email = (string)datos.Lector["Email"];
                    paciente.IdPaciente = (int)datos.Lector["IdPaciente"];
                    paciente.Nombre = (string)datos.Lector["Nombre"];
                    paciente.Apellido = (string)datos.Lector["Apellido"];
                    if (!(datos.Lector["Telefono"] is DBNull))
                        paciente.Telefono = Convert.ToString(datos.Lector["Telefono"]);
                    paciente.TipoDocumento.IdTipoDocumento = (int)datos.Lector["IdTipoDocumento"];
                    paciente.TipoDocumento.Descripcion = (string)datos.Lector["TipoDocumento"];
                    paciente.Documento = Convert.ToString(datos.Lector["Documento"]);
                    paciente.Domicilio = (string)datos.Lector["Domicilio"];
                    paciente.FechaNacimiento = (DateTime)datos.Lector["FechaNacimiento"];
                    if (!(datos.Lector["Cobertura"] is DBNull))
                    {
                        paciente.Cobertura.IdCobertura = (int)datos.Lector["IdCobertura"];
                        paciente.Cobertura.Descripcion = (string)datos.Lector["Cobertura"];
                    }
                    if (!(datos.Lector["IdImagen"] is DBNull))
                    {
                        paciente.Imagen.IdImagen = (int)datos.Lector["IdImagen"];
                        paciente.Imagen.UrlImagen = (string)datos.Lector["UrlImagen"];
                    }

                    List<string> aux = new List<string>();
                    aux = ListarAlergias(paciente.IdPaciente);
                    if (aux.Count() != 0) paciente.Alergias = aux;

                    aux = ListarCondiciones(paciente.IdPaciente);
                    if (aux.Count() != 0) paciente.CondicionBase = aux;
                }

                return paciente;
            }
            catch (Exception ex)
            {
                throw new Exception("Error al buscar al paciente por usuario.", ex);
            }
            finally
            {
                datos.cerrarConexion();
            }
        }
    
        //BLOQUE ALERGIAS
        public List<String> ListarAlergias (int IdPaciente)
        {
            List<String> lista = new List<String>();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("SELECT Descripcion from Alergias A left join PacientesAlergias PA ON PA.IdAlergia = A.IdAlergia left join Pacientes P ON P.IdPaciente = PA.IdPaciente Where P.IdPaciente = @IdPaciente");
                datos.setearParametro("@IdPaciente", IdPaciente);
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    lista.Add((string)datos.Lector["Descripcion"]);
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

        //BLOQUE CONDICIONES BASE
        public List<String> ListarCondiciones(int IdPaciente)
        {
            List<String> lista = new List<String>();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("SELECT Descripcion from CondicionesBase CB left join PacientesCondiciones PC ON PC.IdCondicion = CB.IdCondicion left join Pacientes P ON P.IdPaciente = PC.IdPaciente Where P.IdPaciente = @IdPaciente");
                datos.setearParametro("@IdPaciente", IdPaciente);
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    lista.Add((string)datos.Lector["Descripcion"]);
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


        public void RegistrarPaciente(Paciente nuevo)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta(@"
            DECLARE @IDU INT, @IDP INT, @IDPAC INT, @IDIMG INT;

            INSERT INTO Usuarios (Email, Contrasenia, IdPermiso, Estado)
            VALUES (@Email, @Contrasenia, @IdPermiso, 1);
            SET @IDU = SCOPE_IDENTITY();

            INSERT INTO Personas (Nombre, Apellido, Telefono, IdUsuario)
            VALUES (@Nombre, @Apellido, @Telefono, @IDU);
            SET @IDP = SCOPE_IDENTITY();

           
            INSERT INTO Pacientes (IdTipoDocumento, Documento, Domicilio, FechaNacimiento, IdPersona, IdCobertura)
            VALUES (@IdTipoDocumento, @Documento, @Domicilio, @FechaNacimiento, @IDP, @IdCobertura);
            SET @IDPAC = SCOPE_IDENTITY();

            IF (@UrlImagen IS NOT NULL AND LEN(@UrlImagen) > 0)
            BEGIN
                INSERT INTO Imagenes (UrlImagen) VALUES (@UrlImagen);
                SET @IDIMG = SCOPE_IDENTITY();

                UPDATE Personas SET IdImagen = @IDIMG WHERE IdPersona = @IDP;
            END
        ");

                // USUARIO
                datos.setearParametro("@Email", nuevo.Usuario.Email);
                datos.setearParametro("@Contrasenia", nuevo.Usuario.Contrasenia);
                datos.setearParametro("@IdPermiso", nuevo.Usuario.Permiso.IdPermiso);

                // PERSONA
                datos.setearParametro("@Nombre", nuevo.Nombre);
                datos.setearParametro("@Apellido", nuevo.Apellido);
                datos.setearParametro("@Telefono", nuevo.Telefono);

                // PACIENTE
                datos.setearParametro("@IdTipoDocumento", nuevo.TipoDocumento.IdTipoDocumento);
                datos.setearParametro("@Documento", nuevo.Documento);
                datos.setearParametro("@Domicilio", nuevo.Domicilio);
                datos.setearParametro("@FechaNacimiento", nuevo.FechaNacimiento);
                datos.setearParametro("@IdCobertura", nuevo.Cobertura.IdCobertura);

                // IMAGEN
                if (!string.IsNullOrEmpty(nuevo.Imagen?.UrlImagen))
                    datos.setearParametro("@UrlImagen", nuevo.Imagen.UrlImagen);
                else
                    datos.setearParametro("@UrlImagen", DBNull.Value);

                datos.ejecutarAccion();
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


        public Paciente BuscarPorIdPaciente(int idPaciente)
        {
            AccesoDatos datos = new AccesoDatos();
            Paciente paciente = new Paciente();

            try
            {
                datos.setearConsulta(@"
            select 
                P.IdPaciente,
                PE.Nombre,
                PE.Apellido,
                PE.Telefono,
                TD.Descripcion AS TipoDocumento,
                P.IdTipoDocumento,
                P.Documento,
                P.Domicilio,
                P.FechaNacimiento,
                C.Descripcion AS Cobertura,
                P.IdCobertura,
                I.IdImagen,
                I.UrlImagen
            from Pacientes P
            join TiposDocumento TD ON TD.IdTipoDocumento = P.IdTipoDocumento
            join Coberturas C ON C.IdCobertura = P.IdCobertura
            join Personas PE ON PE.IdPersona = P.IdPersona
            left join Imagenes I ON I.IdImagen = PE.IdImagen
            where P.IdPaciente = @IdPaciente
        ");

                datos.setearParametro("@IdPaciente", idPaciente);
                datos.ejecutarLectura();

                if (datos.Lector.Read())
                {
                    paciente.IdPaciente = (int)datos.Lector["IdPaciente"];
                    paciente.Nombre = (string)datos.Lector["Nombre"];
                    paciente.Apellido = (string)datos.Lector["Apellido"];

                    if (!(datos.Lector["Telefono"] is DBNull))
                        paciente.Telefono = datos.Lector["Telefono"].ToString();

                    paciente.TipoDocumento.IdTipoDocumento = (int)datos.Lector["IdTipoDocumento"];
                    paciente.TipoDocumento.Descripcion = (string)datos.Lector["TipoDocumento"];

                    paciente.Documento = datos.Lector["Documento"].ToString();
                    paciente.Domicilio = (string)datos.Lector["Domicilio"];
                    paciente.FechaNacimiento = (DateTime)datos.Lector["FechaNacimiento"];

                    if (!(datos.Lector["Cobertura"] is DBNull))
                    {
                        paciente.Cobertura.IdCobertura = (int)datos.Lector["IdCobertura"];
                        paciente.Cobertura.Descripcion = (string)datos.Lector["Cobertura"];
                    }

                    if (!(datos.Lector["IdImagen"] is DBNull))
                    {
                        paciente.Imagen.IdImagen = (int)datos.Lector["IdImagen"];
                        paciente.Imagen.UrlImagen = (string)datos.Lector["UrlImagen"];
                    }

                    paciente.Alergias = ListarAlergias(paciente.IdPaciente);
                    paciente.CondicionBase = ListarCondiciones(paciente.IdPaciente);
                }

                return paciente;
            }
            catch (Exception ex)
            {
                throw new Exception("Error al buscar paciente por IdPaciente", ex);
            }
            finally
            {
                datos.cerrarConexion();
            }
        }


        public List<Paciente> ListarPorMedico(int idMedico)
        {
            List<Paciente> lista = new List<Paciente>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta(@"
            SELECT DISTINCT 
                P.IdPaciente,
                PE.Nombre,
                PE.Apellido,
                PE.Telefono,
                TD.Descripcion AS TipoDocumento,
                P.IdTipoDocumento,
                P.Documento,
                P.Domicilio,
                P.FechaNacimiento,
                C.Descripcion AS Cobertura,
                P.IdCobertura
            FROM Turnos T
            JOIN Pacientes P ON P.IdPaciente = T.IdPaciente
            JOIN Personas PE ON PE.IdPersona = P.IdPersona
            JOIN TiposDocumento TD ON TD.IdTipoDocumento = P.IdTipoDocumento
            JOIN Coberturas C ON C.IdCobertura = P.IdCobertura
            WHERE T.IdMedico = @IdMedico
        ");

                datos.setearParametro("@IdMedico", idMedico);
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Paciente paciente = new Paciente();
                    paciente.IdPaciente = (int)datos.Lector["IdPaciente"];
                    paciente.Nombre = (string)datos.Lector["Nombre"];
                    paciente.Apellido = (string)datos.Lector["Apellido"];
                    paciente.Telefono = datos.Lector["Telefono"].ToString();
                    paciente.Documento = datos.Lector["Documento"].ToString();
                    paciente.FechaNacimiento = (DateTime)datos.Lector["FechaNacimiento"];
                    paciente.Cobertura.Descripcion = datos.Lector["Cobertura"].ToString();

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




    }
}
