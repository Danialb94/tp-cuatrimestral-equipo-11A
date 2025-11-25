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
                AND FechaTurno >= @fechaDesde
                ORDER BY t.FechaTurno ASC");
                datos.setearParametro("@IdPaciente", IdPaciente);
                datos.setearParametro("@fechaDesde", DateTime.Now);
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

        //  MÉDICO – CONSULTAS Y REGISTRO CLÍNICO
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
                T.Motivo,
                RC.IdRegistro,
                RC.Diagnostico,
                RC.Observacion,
                RC.Tratamiento
                FROM RegistroClinico RC
                INNER JOIN Turnos T ON RC.IdTurno = T.IdTurno
                INNER JOIN Estados E ON T.IdEstado = E.IdEstado
                WHERE T.IdMedico = @idMedico 
                AND T.IdPaciente = @idPaciente
                AND E.Descripcion = 'Atendido'
                ORDER BY T.FechaTurno DESC");

                datos.setearParametro("@idMedico", idMedico);
                datos.setearParametro("@idPaciente", idPaciente);
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Turno turno = new Turno();
                    turno.IdTurno = (int)datos.Lector["IdTurno"];
                    turno.FechaHora = (DateTime)datos.Lector["FechaTurno"];
                    turno.Motivo = datos.Lector["Motivo"].ToString();

                    turno.Registros = new List<RegistroClinico>();

                    RegistroClinico reg = new RegistroClinico();
                    reg.IdRegistro = (int)datos.Lector["IdRegistro"];
                    reg.IdTurno = turno.IdTurno;
                    reg.Diagnostico = datos.Lector["Diagnostico"]?.ToString();
                    reg.Observacion = datos.Lector["Observacion"]?.ToString();
                    reg.Tratamiento = datos.Lector["Tratamiento"]?.ToString();

                    turno.Registros.Add(reg);

                    lista.Add(turno);
                }

                return lista;
            }
            finally { datos.cerrarConexion(); }
        }

        public DateTime? ObtenerUltimaConsulta(int idPaciente, int idMedico)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta(@"
                SELECT TOP 1 T.FechaTurno
                FROM RegistroClinico RC
                INNER JOIN Turnos T ON RC.IdTurno = T.IdTurno
                WHERE T.IdPaciente = @idPaciente
                AND T.IdMedico = @idMedico
                ORDER BY RC.IdRegistro DESC");

                datos.setearParametro("@idPaciente", idPaciente);
                datos.setearParametro("@idMedico", idMedico);

                datos.ejecutarLectura();

                if (datos.Lector.Read())
                {
                    // Si querés usar la fecha del turno
                    return (DateTime)datos.Lector["FechaTurno"];
                }

                return null;
            }
            finally { datos.cerrarConexion(); }
        }

        public void AgregarConsulta(int idTurno, RegistroClinico registro)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta(@"
                INSERT INTO RegistroClinico (IdTurno, Diagnostico, Observacion, Tratamiento)
                VALUES (@IdTurno, @Diagnostico, @Observacion, @Tratamiento);
                UPDATE Turnos 
                SET IdEstado = (SELECT IdEstado FROM Estados WHERE Descripcion = 'Atendido')
                WHERE IdTurno = @IdTurno;");

                datos.setearParametro("@IdTurno", idTurno);
                datos.setearParametro("@Diagnostico", (object)registro.Diagnostico ?? DBNull.Value);
                datos.setearParametro("@Observacion", (object)registro.Observacion ?? DBNull.Value);
                datos.setearParametro("@Tratamiento", (object)registro.Tratamiento ?? DBNull.Value);

                datos.ejecutarAccion();
            }
            finally { datos.cerrarConexion(); }
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
                AND CONVERT(DATE, FechaTurno) = CONVERT(DATE, @fecha)");

                datos.setearParametro("@idMedico", idMedico);
                datos.setearParametro("@idPaciente", idPaciente);
                datos.setearParametro("@fecha", fecha);

                datos.ejecutarLectura();

                return datos.Lector.Read() ? (int)datos.Lector["IdTurno"] : 0;
            }
            finally { datos.cerrarConexion(); }
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
                T.Motivo,
                ES.Descripcion AS Estado,
                PA.IdPaciente,
                P.Nombre AS NombrePaciente,
                P.Apellido AS ApellidoPaciente,
                RC.IdRegistro,
                RC.Diagnostico,
                RC.Observacion,
                RC.Tratamiento
                FROM Turnos T
                INNER JOIN Pacientes PA ON T.IdPaciente = PA.IdPaciente
                INNER JOIN Personas P ON PA.IdPersona = P.IdPersona
                INNER JOIN Estados ES ON T.IdEstado = ES.IdEstado
                LEFT JOIN RegistroClinico RC ON RC.IdTurno = T.IdTurno
                WHERE T.IdTurno = @IdTurno
                ORDER BY RC.IdRegistro DESC
                ");

                datos.setearParametro("@IdTurno", idTurno);
                datos.ejecutarLectura();

                if (datos.Lector.Read())
                {
                    Turno aux = new Turno();

                    aux.IdTurno = (int)datos.Lector["IdTurno"];
                    aux.FechaHora = (DateTime)datos.Lector["FechaTurno"];
                    aux.Motivo = datos.Lector["Motivo"]?.ToString();
                    aux.Estado = datos.Lector["Estado"]?.ToString();

                    aux.Paciente = new Paciente
                    {
                        IdPaciente = (int)datos.Lector["IdPaciente"],   
                        Nombre = datos.Lector["NombrePaciente"].ToString(),
                        Apellido = datos.Lector["ApellidoPaciente"].ToString()
                    };

                    aux.Registros = new List<RegistroClinico>();

                    aux.Registros.Add(new RegistroClinico
                    {
                        IdRegistro = datos.Lector["IdRegistro"] != DBNull.Value ? (int)datos.Lector["IdRegistro"] : 0,
                        Diagnostico = datos.Lector["Diagnostico"]?.ToString(),
                        Observacion = datos.Lector["Observacion"]?.ToString(),
                        Tratamiento = datos.Lector["Tratamiento"]?.ToString()
                    });

                    return aux;
                }

                return null;
            }
            finally { datos.cerrarConexion(); }
        }



        public RegistroClinico ObtenerRegistroPorTurno(int idTurno)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta(@"
                SELECT TOP 1 *
                FROM RegistroClinico
                WHERE IdTurno = @IdTurno
                ORDER BY IdRegistro DESC
                ");

                datos.setearParametro("@IdTurno", idTurno);
                datos.ejecutarLectura();

                if (datos.Lector.Read())
                {
                    return new RegistroClinico
                    {
                        IdRegistro = (int)datos.Lector["IdRegistro"],
                        IdTurno = (int)datos.Lector["IdTurno"],
                        Diagnostico = datos.Lector["Diagnostico"]?.ToString(),
                        Observacion = datos.Lector["Observacion"]?.ToString(),
                        Tratamiento = datos.Lector["Tratamiento"]?.ToString()
                    };
                }

                return null;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

        public List<DateTime> ConsultarTurnosLibres(int idMedico, string especialidad, DateTime fitlroFecha)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                ///TURNOS OCUPADOS en los proximos 7 días
                datos.setearConsulta(@"
                SELECT FechaTurno
                FROM Turnos
                WHERE IdMedico = @idMedico
                AND FechaTurno >= @fechaDesde
                AND FechaTurno <= @fechaHasta
                AND IdEstado = '2'");

                DateTime fechaDesde = fitlroFecha;
                DateTime fechaHasta = fitlroFecha.AddDays(7);

                datos.setearParametro("@idMedico", idMedico);
                datos.setearParametro("@fechaDesde", fechaDesde);
                datos.setearParametro("@fechaHasta", fechaHasta);
                datos.ejecutarLectura();

                List<DateTime> turnosTomados = new List<DateTime>();
                while (datos.Lector.Read())
                {
                    turnosTomados.Add((DateTime)datos.Lector["FechaTurno"]);
                }

                //GENERA TODOS LOS TURNOS POSIBLES
                List<DateTime> turnosPosibles = GenerarTurnosPosibles(fechaDesde, fechaHasta, idMedico, especialidad);

                //FILTRA TURNOS OCUPADOS
                List<DateTime> turnosLibres = turnosPosibles
                .Where(turno => !turnosTomados.Any(tomado =>
                    tomado.Year == turno.Year &&
                    tomado.Month == turno.Month &&
                    tomado.Day == turno.Day &&
                    tomado.Hour == turno.Hour &&
                    tomado.Minute == turno.Minute))
                .ToList();
                return turnosLibres;
            }
            catch (Exception ex)
            {
                throw new Exception("Error al obtener turnos libres", ex);
            }
            finally { datos.cerrarConexion(); }
        }

        private List<DateTime> GenerarTurnosPosibles(DateTime fechaDesde, DateTime fechaHasta, int idMedico, string especialidad)
        {
            List<DateTime> turnosPosibles = new List<DateTime>();
            MedicoNegocio negocio = new MedicoNegocio();
            Horario horario = negocio.HorariosPorEspecialidadNúmero(idMedico, especialidad);
            for (DateTime fecha = fechaDesde.Date; fecha <= fechaHasta.Date; fecha = fecha.AddDays(1))
            {
                for (int i = 0; i < horario.DiasSemana.Count(); i++)
                {
                    if (fecha.DayOfWeek == (DayOfWeek)int.Parse(horario.DiasSemana[i]))
                    {
                        EspecialidadNegocio negocioEsp = new EspecialidadNegocio();
                        Medico medico = negocio.ListarMedico(idMedico);
                        TimeSpan horarioPosible = TimeSpan.FromHours(medico.Horario[0].HoraEntrada);

                        while (horarioPosible < TimeSpan.FromHours(medico.Horario[0].HoraSalida))
                        {
                            DateTime turno = new DateTime(fecha.Year, fecha.Month, fecha.Day, horarioPosible.Hours, horarioPosible.Minutes, 0);
                            turnosPosibles.Add(turno);
                            horarioPosible = horarioPosible.Add(TimeSpan.FromMinutes(negocioEsp.duracionConsulta(especialidad))); 
                        }
                    }
                }
            }
            return turnosPosibles;
        }

        public void AgregarTurno(Turno turno)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta(@"
                INSERT INTO Turnos (IdPaciente, IdMedico, FechaTurno, Motivo, IdEstado, IdEspecialidad) 
                VALUES (@IdPaciente, @IdMedico, @FechaTurno, @Motivo, @IdEstado, @IdEspecialidad)");

                datos.setearParametro("@IdPaciente", turno.Paciente.IdPaciente);
                datos.setearParametro("@IdMedico", turno.Medico.IdMedico);
                datos.setearParametro("@FechaTurno", turno.FechaHora);
                datos.setearParametro("@Motivo", (object)turno.Motivo ?? DBNull.Value);
                datos.setearParametro("@IdEstado", 2);
                datos.setearParametro("@IdEspecialidad", turno.Especialidad.IdEspecialidad);

                datos.ejecutarAccion();
            }
            catch (Exception ex)
            {
                throw new Exception("Error al registrar el turno", ex);
            }
            finally
            {
                datos.cerrarConexion();
            }
        }
    
        public List<string> listarEstados()
        {
            List<string> lista = new List<string>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                string consulta = @"
                    SELECT Descripcion 
                    FROM Estados";


                datos.setearConsulta(consulta);
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    lista.Add(datos.Lector["Descripcion"].ToString());
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

