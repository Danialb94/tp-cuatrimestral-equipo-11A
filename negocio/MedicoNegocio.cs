using dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace negocio
{
    public class MedicoNegocio
    {
        // ================================
        //      Listar turnos por médico
        // ================================
        public List<Turno> ListarTurnos(int idMedico)
        {
            List<Turno> lista = new List<Turno>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta(@"SELECT T.IdTurno, T.FechaTurno, E.Descripcion AS Especialidad, ES.Descripcion AS Estado,
                P.Nombre AS NombrePaciente, P.Apellido AS ApellidoPaciente FROM Turnos T INNER JOIN Pacientes PA ON T.IdPaciente = PA.IdPaciente 
                INNER JOIN Personas P ON PA.IdPersona = P.IdPersona INNER JOIN Especialidades E ON T.IdEspecialidad = E.IdEspecialidad
                INNER JOIN Estados ES ON T.IdEstado = ES.IdEstado WHERE T.IdMedico = @IdMedico ORDER BY T.FechaTurno ASC");

                datos.setearParametro("@IdMedico", idMedico);
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Turno turno = new Turno();
                    turno.IdTurno = (int)datos.Lector["IdTurno"];
                    turno.FechaHora = (DateTime)datos.Lector["FechaTurno"];
                    turno.Estado = (string)datos.Lector["Estado"];
                    turno.Paciente = new Paciente
                    {
                        Nombre = (string)datos.Lector["NombrePaciente"],
                        Apellido = (string)datos.Lector["ApellidoPaciente"]
                    };
                    turno.Especialidad = new Especialidad
                    {
                        Descripcion = (string)datos.Lector["Especialidad"]
                    };

                    lista.Add(turno);
                }

                return lista;
            }
            catch (Exception ex)
            {
                throw new Exception("Error al listar los turnos del médico.", ex);
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

        // ==============================================
        // Registrar diagnóstico u observación del turno
        // ==============================================
        public void RegistrarAtencion(int idTurno, string diagnostico, string observacion)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta(@"UPDATE Turnos SET Diagnostico = @Diagnostico,Observacion = @Observacion,IdEstado = 1 WHERE IdTurno = @IdTurno");

                datos.setearParametro("@Diagnostico", diagnostico);
                datos.setearParametro("@Observacion", observacion);
                datos.setearParametro("@IdTurno", idTurno);

                datos.ejecutarAccion();
            }
            catch (Exception ex)
            {
                throw new Exception("Error al registrar la atención médica.", ex);
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

        // =========================================
        //   Buscar médico por usuario (para login)
        // =========================================
        public Medico BuscarPorIdUsuario(int idUsuario)
        {
            AccesoDatos datos = new AccesoDatos();
            Medico medico = null;

            try
            {
                // 🔹 Primero traemos los datos básicos del médico
                datos.setearConsulta(@"SELECT M.IdMedico, M.Matricula, P.Nombre, P.Apellido, P.Telefono, U.Email, U.Contrasenia, I.UrlImagen FROM Medicos M
                INNER JOIN Personas P ON M.IdPersona = P.IdPersona INNER JOIN Usuarios U ON M.IdUsuario = U.IdUsuario LEFT JOIN Imagenes I 
                ON I.IdImagen = P.IdImagen WHERE U.IdUsuario = @IdUsuario");

                datos.setearParametro("@IdUsuario", idUsuario);
                datos.ejecutarLectura();

                if (datos.Lector.Read())
                {
                    medico = new Medico
                    {
                        IdMedico = (int)datos.Lector["IdMedico"],
                        Matricula = (string)datos.Lector["Matricula"],
                        Nombre = (string)datos.Lector["Nombre"],
                        Apellido = (string)datos.Lector["Apellido"],
                        Telefono = Convert.ToString(datos.Lector["Telefono"]),
                        Email = (string)datos.Lector["Email"],
                        Contrasenia = (string)datos.Lector["Contrasenia"],
                        Imagen = new Imagen
                        {
                            UrlImagen = datos.Lector["UrlImagen"] != DBNull.Value
                                ? datos.Lector["UrlImagen"].ToString()
                                : "~/Imagenes/Perfil_Placeholder.png"
                        },
                        Especialidades = new List<Especialidad>()
                    };
                }

                datos.cerrarConexion();

                // 🔹 Ahora traemos las especialidades que tiene el médico
                if (medico != null)
                {
                    AccesoDatos datosEsp = new AccesoDatos();

                    datosEsp.setearConsulta(@"SELECT DISTINCT E.IdEspecialidad, E.Descripcion FROM MedicosHorariosEspecialidades MHE
                    INNER JOIN Especialidades E ON MHE.IdEspecialidad = E.IdEspecialidad WHERE MHE.IdMedico = @IdMedico");

                    datosEsp.setearParametro("@IdMedico", medico.IdMedico);
                    datosEsp.ejecutarLectura();

                    while (datosEsp.Lector.Read())
                    {
                        Especialidad esp = new Especialidad
                        {
                            IdEspecialidad = (int)datosEsp.Lector["IdEspecialidad"],
                            Descripcion = (string)datosEsp.Lector["Descripcion"]
                        };

                        medico.Especialidades.Add(esp);
                    }

                    datosEsp.cerrarConexion();
                }

                return medico;
            }
            catch (Exception ex)
            {
                throw new Exception("Error al buscar el médico por usuario.", ex);
            }
            finally
            {
                datos.cerrarConexion();
            }
        }


        // =========================================
        //  Actualizar datos personales del médico
        // =========================================
        public void ActualizarDatos(Medico medico)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta(@"UPDATE Personas SET Nombre = @Nombre, Apellido = @Apellido, Telefono = @Telefono
                WHERE IdPersona = (SELECT IdPersona FROM Medicos WHERE IdMedico = @IdMedico); UPDATE Usuarios 
                SET Email = @Email, Contrasenia = @Contrasenia WHERE IdUsuario = (SELECT IdUsuario FROM Medicos WHERE IdMedico = @IdMedico)");

                datos.setearParametro("@Nombre", medico.Nombre);
                datos.setearParametro("@Apellido", medico.Apellido);
                datos.setearParametro("@Telefono", medico.Telefono);
                datos.setearParametro("@Email", medico.Email);
                datos.setearParametro("@Contrasenia", medico.Contrasenia);
                datos.setearParametro("@IdMedico", medico.IdMedico);

                datos.ejecutarAccion();
            }
            catch (Exception ex)
            {
                throw new Exception("Error al actualizar los datos del médico.", ex);
            }
            finally
            {
                datos.cerrarConexion();
            }
        }
    }
}