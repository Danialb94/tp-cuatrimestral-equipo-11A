using dominio;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace negocio
{
    public class RecepcionistaNegocio
    {
        public List<Medico> listarMedicos()
        {
            List<Medico> lista = new List<Medico>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta(@"
                    SELECT DISTINCT
                        M.IdMedico,
                        P.Nombre,
                        P.Apellido,
                        P.Telefono,
                        M.Matricula,
                        E.Descripcion AS Especialidad,
                        H.HorarioEntrada,
                        H.HorarioSalida,
                        I.UrlImagen,
                        (
                            SELECT STRING_AGG(
                                CASE H2.DiaSemana
                                    WHEN 1 THEN 'Lunes'
                                    WHEN 2 THEN 'Martes'
                                    WHEN 3 THEN 'Miércoles'
                                    WHEN 4 THEN 'Jueves'
                                    WHEN 5 THEN 'Viernes'
                                    WHEN 6 THEN 'Sábado'
                                    WHEN 7 THEN 'Domingo'
                                END,
                                ', '
                            ) WITHIN GROUP (ORDER BY H2.DiaSemana)
                            FROM MedicosHorariosEspecialidades MHE2
                            INNER JOIN Horarios H2 ON MHE2.IdHorario = H2.IdHorario
                            WHERE MHE2.IdMedico = M.IdMedico
                              AND MHE2.IdEspecialidad = E.IdEspecialidad
                              AND H2.HorarioEntrada = H.HorarioEntrada
                              AND H2.HorarioSalida = H.HorarioSalida
                        ) AS DiasSemana
                    FROM Medicos M
                    INNER JOIN Personas P ON M.IdPersona = P.IdPersona
                    INNER JOIN MedicosHorariosEspecialidades MHE ON M.IdMedico = MHE.IdMedico
                    INNER JOIN Especialidades E ON MHE.IdEspecialidad = E.IdEspecialidad
                    INNER JOIN Horarios H ON MHE.IdHorario = H.IdHorario
                    LEFT JOIN Imagenes I ON I.IdImagen = P.IdImagen
                    ORDER BY E.Descripcion, M.IdMedico;
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

                    TimeSpan entrada = (TimeSpan)datos.Lector["HorarioEntrada"];
                    TimeSpan salida = (TimeSpan)datos.Lector["HorarioSalida"];
                    horario.HoraEntrada = entrada.Hours;
                    horario.HoraSalida = salida.Hours;

                    horario.DiasSemana.Add((string)datos.Lector["DiasSemana"]);

                    aux.Horario.Add(horario);

                    aux.Imagen.UrlImagen = (string)datos.Lector["UrlImagen"];

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


        public List<Medico> listarMedicosRecepcionista()
        {
            List<Medico> lista = new List<Medico>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta(@"
                    SELECT DISTINCT
                        M.IdMedico,
                        P.Nombre,
                        P.Apellido,
                        P.Telefono,
                        M.Matricula,
                        E.Descripcion AS Especialidad,
                        H.HorarioEntrada,
                        H.HorarioSalida,
                        I.UrlImagen,
                        (
                            SELECT STRING_AGG(
                                CASE H2.DiaSemana
                                    WHEN 1 THEN 'Lunes'
                                    WHEN 2 THEN 'Martes'
                                    WHEN 3 THEN 'Miércoles'
                                    WHEN 4 THEN 'Jueves'
                                    WHEN 5 THEN 'Viernes'
                                    WHEN 6 THEN 'Sábado'
                                    WHEN 7 THEN 'Domingo'
                                END,
                                ', '
                            ) WITHIN GROUP (ORDER BY H2.DiaSemana)
                            FROM MedicosHorariosEspecialidades MHE2
                            INNER JOIN Horarios H2 ON MHE2.IdHorario = H2.IdHorario
                            WHERE MHE2.IdMedico = M.IdMedico
                              AND MHE2.IdEspecialidad = E.IdEspecialidad
                              AND H2.HorarioEntrada = H.HorarioEntrada
                              AND H2.HorarioSalida = H.HorarioSalida
                        ) AS DiasSemana
                    FROM Medicos M
                    INNER JOIN Personas P ON M.IdPersona = P.IdPersona
                    INNER JOIN MedicosHorariosEspecialidades MHE ON M.IdMedico = MHE.IdMedico
                    INNER JOIN Especialidades E ON MHE.IdEspecialidad = E.IdEspecialidad
                    INNER JOIN Horarios H ON MHE.IdHorario = H.IdHorario
                    LEFT JOIN Imagenes I ON I.IdImagen = P.IdImagen
                    ORDER BY E.Descripcion, M.IdMedico;
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

                    TimeSpan entrada = (TimeSpan)datos.Lector["HorarioEntrada"];
                    TimeSpan salida = (TimeSpan)datos.Lector["HorarioSalida"];
                    horario.HoraEntrada = entrada.Hours;
                    horario.HoraSalida = salida.Hours;

                    horario.DiasSemana.Add((string)datos.Lector["DiasSemana"]);

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
        public void AgregarMedico(Medico nuevo, List<string> diasSeleccionados, string franjaHoraria)
        {
            AccesoDatos datos = new AccesoDatos();
            int idMedico = 0;

            try
            {

                datos.setearConsulta(@"
            DECLARE @IDU int, @IDP int;

            INSERT INTO Usuarios (Email, Contrasenia, IdPermiso, Estado) 
            VALUES (@Email, @Contrasenia, @IdPermiso, 1);

            SET @IDU = SCOPE_IDENTITY();

            INSERT INTO Personas (Nombre, Apellido, Telefono, IdUsuario)  
            VALUES (@Nombre, @Apellido, @Telefono, @IDU);

            SET @IDP = SCOPE_IDENTITY();

            INSERT INTO Medicos (Matricula, IdUsuario, IdPersona)  
            VALUES (@Matricula, @IDU, @IDP);

            SELECT SCOPE_IDENTITY() AS IdMedico;
        ");


                datos.setearParametro("@Email", nuevo.Usuario.Email);
                datos.setearParametro("@Contrasenia", nuevo.Usuario.Contrasenia);
                datos.setearParametro("@IdPermiso", nuevo.Usuario.Permiso.IdPermiso);
                datos.setearParametro("@Nombre", nuevo.Nombre);
                datos.setearParametro("@Apellido", nuevo.Apellido);
                datos.setearParametro("@Telefono", nuevo.Telefono);
                datos.setearParametro("@Matricula", nuevo.Matricula);

                datos.ejecutarLectura();


                if (datos.Lector.Read())
                    idMedico = Convert.ToInt32(datos.Lector["IdMedico"]);

                datos.cerrarConexion();

                foreach (string dia in diasSeleccionados)
                {
                    int diaSemana = ObtenerNumeroDia(dia);

                    int idHorario = ObtenerIdHorario(diaSemana, franjaHoraria);
                    {
                        datos = new AccesoDatos();
                        datos.setearConsulta("INSERT INTO MedicosHorariosEspecialidades (IdMedico, IdHorario, IdEspecialidad) VALUES (@idMedico, @idHorario, @idEspecialidad)");

                        datos.setearParametro("@IdMedico", idMedico);
                        datos.setearParametro("@IdHorario", idHorario);
                        datos.setearParametro("@IdEspecialidad", nuevo.Especialidades.First().IdEspecialidad);
                        datos.ejecutarAccion();
                        datos.cerrarConexion();
                    }
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
        private int ObtenerNumeroDia(string dia)
        {
            switch (dia.ToLower())
            {
                case "lunes": return 1;
                case "martes": return 2;
                case "miércoles":
                case "miercoles": return 3;
                case "jueves": return 4;
                case "viernes": return 5;
                case "sábado":
                case "sabado": return 6;
                case "domingo": return 7;
                default: return 0;
            }
        }

        private int ObtenerIdHorario(int diaSemana, string franja)
        {

            string[] partes = franja.Split('-');
            string entrada = partes[0].Trim();
            string salida = partes[1].Trim();

            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("SELECT IdHorario FROM Horarios WHERE DiaSemana = @dia AND HorarioEntrada = @entrada AND HorarioSalida = @salida");
                datos.setearParametro("@dia", diaSemana);
                datos.setearParametro("@entrada", entrada);
                datos.setearParametro("@salida", salida);
                datos.ejecutarLectura();

                if (datos.Lector.Read())
                    return Convert.ToInt32(datos.Lector["IdHorario"]);
                else
                    return 0;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }



        public void cancelarAgendaMedico(int idMedico)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta(@"
            UPDATE Turnos
            SET IdEstado = (
                SELECT IdEstado FROM Estados WHERE Descripcion = 'Cancelado por Clínica'
            )
            WHERE IdMedico = @idMedico
            AND CONVERT(date, FechaTurno) = CONVERT(date, GETDATE())
            AND IdEstado IN (
                SELECT IdEstado FROM Estados WHERE Descripcion = 'Pendiente'
            )");

                datos.setearParametro("@idMedico", idMedico);
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

        public List<Turno> listarTurnosPorEspecialidad(int idEspecialidad)
        {
            List<Turno> lista = new List<Turno>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta(@"
            SELECT  
                T.IdTurno,
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
            INNER JOIN Especialidades ESP ON T.IdEspecialidad = ESP.IdEspecialidad
            WHERE ESP.IdEspecialidad = @idEspecialidad
              AND T.FechaTurno >= CAST(GETDATE() AS DATE)
              AND E.Descripcion = 'Pendiente'
            ORDER BY T.FechaTurno ASC");

                datos.setearParametro("@idEspecialidad", idEspecialidad);
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
        public void CancelarClinica(int idTurno)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta(@"UPDATE Turnos
                    SET IdEstado = '3'
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

        public List<Turno> listarTurnosDesdeHoy()
        {
            List<Turno> lista = new List<Turno>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta(@"
            SELECT  
                T.IdTurno,
                P.Nombre + ' ' + P.Apellido AS Paciente,
                PM.Nombre + ' ' + PM.Apellido AS Medico,
                T.FechaTurno,
                E.Descripcion AS Estado,
                ESP.IdEspecialidad,
                ESP.Descripcion AS Especialidad
            FROM Turnos T
            INNER JOIN Pacientes PA ON T.IdPaciente = PA.IdPaciente
            INNER JOIN Personas P ON PA.IdPersona = P.IdPersona
            INNER JOIN Medicos M ON T.IdMedico = M.IdMedico
            INNER JOIN Personas PM ON M.IdPersona = PM.IdPersona
            INNER JOIN Estados E ON T.IdEstado = E.IdEstado
            INNER JOIN Especialidades ESP ON T.IdEspecialidad = ESP.IdEspecialidad
            WHERE T.FechaTurno >= CAST(GETDATE() AS DATE)
              AND E.Descripcion = 'Pendiente'
            ORDER BY T.FechaTurno ASC");

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
                    aux.Especialidad.IdEspecialidad = (int)datos.Lector["IdEspecialidad"];
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

        public void altaPacienteRecepcionista(Paciente nuevo)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta(@"
            DECLARE @IDU INT, @IDP INT;

            INSERT INTO Usuarios (Email, Contrasenia, IdPermiso, Estado)
            VALUES (@Email, @Contrasenia, @IdPermiso, 1);

            SET @IDU = SCOPE_IDENTITY();

            INSERT INTO Personas (Nombre, Apellido, Telefono, IdUsuario)
            VALUES (@Nombre, @Apellido, @Telefono, @IDU);

            SET @IDP = SCOPE_IDENTITY();

            INSERT INTO Pacientes (IdTipoDocumento, Documento, Domicilio, FechaNacimiento, IdPersona, IdCobertura)
            VALUES (@IdTipoDocumento, @Documento, @Domicilio, @FechaNacimiento, @IDP, @IdCobertura);
        ");

                datos.setearParametro("@Email", nuevo.Usuario.Email);
                datos.setearParametro("@Contrasenia", nuevo.Usuario.Contrasenia);
                datos.setearParametro("@IdPermiso", nuevo.Usuario.Permiso.IdPermiso);
                datos.setearParametro("@Nombre", nuevo.Nombre);
                datos.setearParametro("@Apellido", nuevo.Apellido);
                datos.setearParametro("@Telefono", nuevo.Telefono);
                datos.setearParametro("@IdTipoDocumento", nuevo.TipoDocumento.IdTipoDocumento);
                datos.setearParametro("@Documento", nuevo.Documento);
                datos.setearParametro("@Domicilio", nuevo.Domicilio);
                datos.setearParametro("@FechaNacimiento", nuevo.FechaNacimiento);
                datos.setearParametro("@IdCobertura", nuevo.Cobertura.IdCobertura);

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

        public List<Paciente> listarPacientesRecepcionista()
        {
            List<Paciente> lista = new List<Paciente>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta(@"
            SELECT P.IdPaciente, Pe.Nombre, Pe.Apellido, P.Documento, C.Descripcion AS Cobertura
            FROM Pacientes P
            INNER JOIN Personas Pe ON Pe.IdPersona = P.IdPersona
            INNER JOIN Coberturas C ON C.IdCobertura = P.IdCobertura
        ");
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Paciente aux = new Paciente();
                    aux.IdPaciente = (int)datos.Lector["IdPaciente"];
                    aux.Nombre = datos.Lector["Nombre"].ToString();
                    aux.Apellido = datos.Lector["Apellido"].ToString();
                    aux.Documento = datos.Lector["Documento"].ToString();
                    aux.Cobertura = new Cobertura();
                    aux.Cobertura.Descripcion = datos.Lector["Cobertura"].ToString();

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




    }

}


