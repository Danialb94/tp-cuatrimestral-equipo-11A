using dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace negocio
{
    public class TurnoNegocio
    {

        public List<Turno> listarTurnos()
        {
            List<Turno> lista = new List<Turno>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                string consulta = @"  SELECT  T.IdTurno,
                P.Nombre + ' ' + P.Apellido AS Paciente,
                PM.Nombre + ' ' + PM.Apellido AS Medico,
                T.FechaTurno,
                E.Descripcion AS Estado,
                ESP.Descripcion AS Especialidad
                FROM Turnos T
                INNER JOIN Pacientes PA ON T.IdPaciente = PA.IdPaciente
                INNER JOIN Personas P ON PA.IdPersona = P.IdPersona
                INNER JOIN Medicos M ON T.IdMedico = M.IdMedico
                INNER JOIN Personas PM ON M.IdPersona = PM.IdPersona
                INNER JOIN Estados E ON T.IdEstado = E.IdEstado
                INNER JOIN Especialidades ESP ON T.IdEspecialidad = ESP.IdEspecialidad";


                datos.setearConsulta(consulta);
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Turno aux = new Turno();

                    aux.IdTurno = (int)datos.Lector["IdTurno"];

                    aux.Paciente = new Paciente();
                    aux.Paciente.Nombre = datos.Lector["Paciente"].ToString();

                    aux.Medico = new Medico();
                    aux.Medico.Nombre = datos.Lector["Medico"].ToString();

                    aux.FechaHora = (DateTime)datos.Lector["FechaTurno"];

                    aux.Estado = datos.Lector["Estado"].ToString();

                    aux.Especialidad = new Especialidad();
                    aux.Especialidad.Descripcion = datos.Lector["Especialidad"].ToString();


                    lista.Add(aux);
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
        public List<Turno> listarTurnosxPaciente(int IdPaciente)
        {
            List<Turno> lista = new List<Turno>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta(@"SELECT  
                    T.IdTurno,
                    PM.Nombre,
                    PM.Apellido,
                    T.FechaTurno,
                    ESP.Descripcion AS Especialidad
                FROM Turnos T
                INNER JOIN Pacientes PA ON T.IdPaciente = PA.IdPaciente
                INNER JOIN Personas P ON PA.IdPersona = P.IdPersona
                INNER JOIN Medicos M ON T.IdMedico = M.IdMedico
                INNER JOIN Personas PM ON M.IdPersona = PM.IdPersona
                INNER JOIN Estados E ON T.IdEstado = E.IdEstado
                INNER JOIN Especialidades ESP ON T.IdEspecialidad = ESP.IdEspecialidad
                WHERE PA.IdPaciente = @IdPaciente
                AND E.Descripcion = 'Pendiente'
                ORDER BY t.FechaTurno ASC");
                datos.setearParametro("@IdPaciente", IdPaciente);
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Turno aux = new Turno();
                    aux.IdTurno = (int)datos.Lector["IdTurno"];
                    aux.Medico = new Medico();
                    aux.Medico.Nombre = (string)datos.Lector["Nombre"];
                    aux.Medico.Apellido = (string)datos.Lector["Apellido"];
                    aux.FechaHora = (DateTime)datos.Lector["FechaTurno"];
                    aux.Especialidad = new Especialidad();
                    aux.Especialidad.Descripcion = (string)datos.Lector["Especialidad"];
                    lista.Add(aux);
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

        public void CancelarxPaciente(int idTurno)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta(@"UPDATE Turnos
                    SET IdEstado = '4'
                    WHERE IdTurno = @IdTurno");
                datos.setearParametro("@IdTurno", idTurno);
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



        /// PREUBAAAA

        public List<Medico> listarMedicos()
        {
            List<Medico> lista = new List<Medico>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta(@"
                     SELECT 
                         M.IdMedico,
                         P.Nombre,
                         P.Apellido,
                         P.Telefono,
                         M.Matricula,
                         E.Descripcion AS Especialidad,
                         H.IdHorario,
                         H.HorarioEntrada,
                         H.HorarioSalida,
                         H.DiaSemana
                     FROM Medicos M
                     INNER JOIN Personas P ON M.IdPersona = P.IdPersona
                     INNER JOIN MedicosHorariosEspecialidades MHE ON M.IdMedico = MHE.IdMedico
                     INNER JOIN Especialidades E ON MHE.IdEspecialidad = E.IdEspecialidad
                     INNER JOIN Horarios H ON MHE.IdHorario = H.IdHorario
                 ");

                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Medico aux = new Medico();
                    aux.IdMedico = (int)datos.Lector["IdMedico"];
                    aux.Nombre = (string)datos.Lector["Nombre"];
                    aux.Apellido = (string)datos.Lector["Apellido"];
                    aux.Telefono = datos.Lector["Telefono"].ToString();
                    aux.Matricula = (string)datos.Lector["Matricula"];


                    Especialidad esp = new Especialidad();
                    esp.Descripcion = (string)datos.Lector["Especialidad"];
                    aux.Especialidades.Add(esp);

                    Horario horario = new Horario();
                    horario.IdHorario = (int)datos.Lector["IdHorario"];


                    TimeSpan entrada = (TimeSpan)datos.Lector["HorarioEntrada"];
                    TimeSpan salida = (TimeSpan)datos.Lector["HorarioSalida"];
                    horario.HoraEntrada = entrada.Hours;
                    horario.HoraSalida = salida.Hours;


                    int dia = int.Parse(datos.Lector["DiaSemana"].ToString());
                    string[] nombresDias = { "Domingo", "Lunes", "Martes", "Miércoles", "Jueves", "Viernes", "Sábado" };
                    horario.DiasSemana.Add(nombresDias[dia % 7]);


                    aux.Horario.Add(horario);
                    lista.Add(aux);
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


        public List<Turno> ListarConsultasPorMedicoYPaciente(int idMedico, int idPaciente)
        {
            List<Turno> lista = new List<Turno>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta(@"
                SELECT 
                T.IdTurno,
                T.FechaTurno,
                T.Diagnostico,
                T.Observacion
                FROM Turnos T
                INNER JOIN Estados E ON T.IdEstado = E.IdEstado
                WHERE T.IdMedico = @idMedico 
                AND T.IdPaciente = @idPaciente
                AND E.Descripcion = 'Atendido'
                ORDER BY T.FechaTurno DESC
                ");

                datos.setearParametro("@idMedico", idMedico);
                datos.setearParametro("@idPaciente", idPaciente);
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Turno aux = new Turno();
                    aux.IdTurno = (int)datos.Lector["IdTurno"]; // 🔹 ahora el GridView recibe el ID correcto
                    aux.FechaHora = (DateTime)datos.Lector["FechaTurno"];
                    aux.Diagnostico = datos.Lector["Diagnostico"] != DBNull.Value
                        && !string.IsNullOrWhiteSpace(datos.Lector["Diagnostico"].ToString())
                        ? datos.Lector["Diagnostico"].ToString()
                        : "Sin diagnóstico registrado";
                    aux.Observacion = datos.Lector["Observacion"] != DBNull.Value
                        && !string.IsNullOrWhiteSpace(datos.Lector["Observacion"].ToString())
                        ? datos.Lector["Observacion"].ToString()
                        : "Sin observación registrada";

                    lista.Add(aux);
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



        public DateTime? ObtenerUltimaConsulta(int idPaciente, int idMedico)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta(@"
                SELECT TOP 1 FechaTurno
                FROM Turnos T
                INNER JOIN Estados E ON T.IdEstado = E.IdEstado
                WHERE T.IdPaciente = @idPaciente 
                AND T.IdMedico = @idMedico
                AND E.Descripcion = 'Atendido'
                ORDER BY FechaTurno DESC
                ");

                datos.setearParametro("@idPaciente", idPaciente);
                datos.setearParametro("@idMedico", idMedico);
                datos.ejecutarLectura();

                return datos.Lector.Read() ? (DateTime?)datos.Lector["FechaTurno"] : null;
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


        public void AgregarConsulta(Turno turno)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta(@"
                UPDATE Turnos
                SET Diagnostico = @Diagnostico,
                Observacion = @Observacion,
                IdEstado = (SELECT IdEstado FROM Estados WHERE Descripcion = 'Atendido')
                WHERE IdTurno = @IdTurno");

                datos.setearParametro("@Diagnostico", (object)turno.Diagnostico ?? DBNull.Value);
                datos.setearParametro("@Observacion", (object)turno.Observacion ?? DBNull.Value);
                datos.setearParametro("@IdTurno", turno.IdTurno);

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

        public int ObtenerTurnoDelDia(int idMedico, int idPaciente, DateTime fecha)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta(@"
                SELECT TOP 1 IdTurno
                FROM Turnos
                WHERE IdMedico = @idMedico
                AND IdPaciente = @idPaciente
                AND CONVERT(DATE, FechaTurno) = CONVERT(DATE, @fecha)
        ");
                datos.setearParametro("@idMedico", idMedico);
                datos.setearParametro("@idPaciente", idPaciente);
                datos.setearParametro("@fecha", fecha);
                datos.ejecutarLectura();

                if (datos.Lector.Read())
                    return (int)datos.Lector["IdTurno"];
                else
                    return 0;
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


        public Turno ObtenerPorId(int idTurno)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta(@"
                SELECT 
                T.IdTurno,
                T.FechaTurno,
                T.Diagnostico,
                T.Observacion,
                P.Nombre AS NombrePaciente,
                P.Apellido AS ApellidoPaciente
                FROM Turnos T
                INNER JOIN Pacientes PA ON T.IdPaciente = PA.IdPaciente
                INNER JOIN Personas P ON PA.IdPersona = P.IdPersona
                WHERE T.IdTurno = @idTurno");

                datos.setearParametro("@idTurno", idTurno);
                datos.ejecutarLectura();

                if (datos.Lector.Read())
                {
                    Turno aux = new Turno();
                    aux.IdTurno = (int)datos.Lector["IdTurno"];
                    aux.FechaHora = (DateTime)datos.Lector["FechaTurno"];
                    aux.Diagnostico = datos.Lector["Diagnostico"] != DBNull.Value
                        ? datos.Lector["Diagnostico"].ToString()
                        : "";
                    aux.Observacion = datos.Lector["Observacion"] != DBNull.Value
                        ? datos.Lector["Observacion"].ToString()
                        : "";

                    aux.Paciente = new Paciente
                    {
                        Nombre = datos.Lector["NombrePaciente"].ToString(),
                        Apellido = datos.Lector["ApellidoPaciente"].ToString()
                    };

                    return aux;
                }

                return null;
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

