using dominio;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace negocio
{
    public class MedicoNegocio
    {
        // MÉTODO PRINCIPAL - Lista todos los médicos con sus datos de Medico y Persona
        public List<Medico> ListarMedicos()
        {
            List<Medico> lista = new List<Medico>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta(@"
                    SELECT M.IdMedico, M.Matricula, P.Nombre, P.Apellido, I.UrlImagen
                    FROM MEDICOS M
                    JOIN PERSONAS P ON M.IdPersona = P.IdPersona
                    JOIN IMAGENES I ON P.IdImagen = I.IdImagen
                ");
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Medico medico = new Medico();
                    medico.IdMedico = (int)datos.Lector["IdMedico"];
                    medico.Matricula = (string)datos.Lector["Matricula"];
                    medico.Nombre = (string)datos.Lector["Nombre"];
                    medico.Apellido = (string)datos.Lector["Apellido"];
                    medico.Imagen.UrlImagen = (string)datos.Lector["UrlImagen"];

                    // Cargar especialidades y horarios del médico
                    medico.Especialidades = EspecialidadesPorMedico(medico.IdMedico);
                    for (int i = 0; i < medico.Especialidades.Count(); i++)
                    {
                        medico.Horario.Add(HorariosPorEspecialidad(medico.IdMedico, medico.Especialidades[i].Descripcion));
                    }

                    lista.Add(medico);
                }

                return lista;
            }
            catch (Exception ex)
            {
                throw new Exception("Error al listar los médicos.", ex);
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

        public Medico ListarMedico(int idMedico)
        {
            AccesoDatos datos = new AccesoDatos();
            Medico medico = new Medico();

            try
            {
                datos.setearConsulta(@"
                    SELECT M.IdMedico, M.Matricula, P.Nombre, P.Apellido, I.UrlImagen
                    FROM MEDICOS M
                    JOIN PERSONAS P ON M.IdPersona = P.IdPersona
                    JOIN IMAGENES I ON P.IdImagen = I.IdImagen
                    WHERE IdMedico = @IdMedico
                ");
                datos.setearParametro("@idMedico", idMedico);
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    medico.IdMedico = (int)datos.Lector["IdMedico"];
                    medico.Matricula = (string)datos.Lector["Matricula"];
                    medico.Nombre = (string)datos.Lector["Nombre"];
                    medico.Apellido = (string)datos.Lector["Apellido"];
                    medico.Imagen.UrlImagen = (string)datos.Lector["UrlImagen"];

                    // Cargar especialidades y horarios del médico
                    medico.Especialidades = EspecialidadesPorMedico(medico.IdMedico);
                    for (int i = 0; i < medico.Especialidades.Count(); i++)
                    {
                        medico.Horario.Add(HorariosPorEspecialidad(medico.IdMedico, medico.Especialidades[i].Descripcion));
                    }
                }

                return medico;
            }
            catch (Exception ex)
            {
                throw new Exception("Error al listar los médicos.", ex);
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

        // MÉTODOS AUXILIARES
        private List<Especialidad> EspecialidadesPorMedico(int idMedico)
        {
            List<Especialidad> especialidades = new List<Especialidad>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta(@"
                    SELECT DISTINCT E.IdEspecialidad, E.Descripcion
                    FROM Medicos M
                    INNER JOIN MedicosHorariosEspecialidades MHE ON M.IdMedico = MHE.IdMedico
                    INNER JOIN Especialidades E ON MHE.IdEspecialidad = E.IdEspecialidad
                    WHERE M.IdMedico = @IdMedico
                    ORDER BY E.Descripcion
                ");
                datos.setearParametro("@IdMedico", idMedico);
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Especialidad esp = new Especialidad();
                    esp.IdEspecialidad = (int)datos.Lector["IdEspecialidad"];
                    esp.Descripcion = (string)datos.Lector["Descripcion"];
                    especialidades.Add(esp);
                }

                return especialidades;
            }
            catch (Exception ex)
            {
                throw new Exception("Error al obtener especialidades del médico {idMedico}.", ex);
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

        public List<string> NombresProfesionales()
        {
            List<string> medicos = new List<string>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta(@"
                    select P.Nombre, P.Apellido
                    from medicos M
                    join personas P on M.IdPersona = P.IdPersona
                ");
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    string nombre, apellido, nombreCompleto;
                    nombre = (string)datos.Lector["Nombre"];
                    apellido = (string)datos.Lector["Apellido"];
                    nombreCompleto = nombre + " " + apellido;
                    medicos.Add(nombreCompleto);
                }
                return medicos;
            }
            catch (Exception ex)
            {
                throw new Exception("Error al obtener profesionales.", ex);
            }
            finally
            {
                datos.cerrarConexion();
            }
        }
        public string NombresProfesionales(int idMedico)
        {
            string medico = "";
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta(@"
                    select P.Nombre, P.Apellido
                    from medicos M
                    join personas P on M.IdPersona = P.IdPersona
                    where M.IdMedico = @IdMedico;
                ");
                datos.setearParametro("@IdMedico", idMedico);
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    string nombre, apellido, nombreCompleto;
                    nombre = (string)datos.Lector["Nombre"];
                    apellido = (string)datos.Lector["Apellido"];
                    medico = nombre + " " + apellido;
                }
                return medico;
            }
            catch (Exception ex)
            {
                throw new Exception("Error al obtener profesionales.", ex);
            }
            finally
            {
                datos.cerrarConexion();
            }
        }
        public List<string> NombresProfesionales(string especialidad)
        {
            List<string> medicos = new List<string>();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta(@"
                    select P.Nombre, P.Apellido
                    from medicos M
                    join personas P on M.IdPersona = P.IdPersona
                    join MedicosHorariosEspecialidades MHE on M.IdMedico = MHE.IdMedico
                    JOIN Especialidades E ON MHE.IdEspecialidad = E.IdEspecialidad
                    where E.Descripcion = @especialidad
                ");
                datos.setearParametro("@especialidad", especialidad);
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    string nombre, apellido, nombreCompleto;
                    nombre = (string)datos.Lector["Nombre"];
                    apellido = (string)datos.Lector["Apellido"];
                    nombreCompleto = nombre + " " + apellido;
                    medicos.Add(nombreCompleto);
                }
                return medicos;
            }
            catch (Exception ex)
            {
                throw new Exception("Error al obtener profesionales.", ex);
            }
            finally
            {
                datos.cerrarConexion();
            }
        }


        private Horario HorariosPorEspecialidad(int idMedico, string especialidad)
        {
            Horario Hor = new Horario();
            AccesoDatos datos = new AccesoDatos();
            AccesoDatos datosH = new AccesoDatos();

            try
            {
                datos.setearConsulta(@"
                            SELECT DISTINCT 
                            E.Descripcion,
                                CASE H.DiaSemana
                                    WHEN 1 THEN 'Lunes'
                                    WHEN 2 THEN 'Martes'
                                    WHEN 3 THEN 'Miércoles'
                                    WHEN 4 THEN 'Jueves'
                                    WHEN 5 THEN 'Viernes'
                                    WHEN 6 THEN 'Sábado'
                                    WHEN 7 THEN 'Domingo'
                                END AS DiaSemana
                            FROM Medicos M
                            INNER JOIN MedicosHorariosEspecialidades MHE ON M.IdMedico = MHE.IdMedico
                            INNER JOIN Especialidades E ON MHE.IdEspecialidad = E.IdEspecialidad
                            INNER JOIN Horarios H ON MHE.IdHorario = H.IdHorario
                            WHERE M.IdMedico = @IdMedico
                            AND E.Descripcion = @Descripcion
                        ");
                datos.setearParametro("@IdMedico", idMedico);
                datos.setearParametro("@Descripcion", especialidad);
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    //CONSULTA DE HORARIOS POR ESPECIALIDAD
                    Hor.DiasSemana.Add((string)datos.Lector["DiaSemana"]);
                }
                datosH.setearConsulta(@"
                            SELECT DISTINCT E.Descripcion, H.HorarioEntrada, h.HorarioSalida
                            FROM Medicos M
                            INNER JOIN MedicosHorariosEspecialidades MHE ON M.IdMedico = MHE.IdMedico
                            INNER JOIN Especialidades E ON MHE.IdEspecialidad = E.IdEspecialidad
                            INNER JOIN Horarios H ON MHE.IdHorario = H.IdHorario
                            WHERE M.IdMedico = @IdMedico
                            AND E.Descripcion = @Descripcion
                            ORDER BY E.Descripcion
                        ");
                datosH.setearParametro("@IdMedico", idMedico);
                datosH.setearParametro("@Descripcion", especialidad);
                datosH.ejecutarLectura();
                datosH.Lector.Read();
                TimeSpan entrada = (TimeSpan)datosH.Lector["HorarioEntrada"];
                TimeSpan salida = (TimeSpan)datosH.Lector["HorarioSalida"];
                Hor.HoraEntrada = entrada.Hours;
                Hor.HoraSalida = salida.Hours;

                return Hor;
            }
            catch (Exception ex)
            {
                throw new Exception($"Error al obtener días del médico {idMedico} para {especialidad}.", ex);
            }
            finally
            {
                datos.cerrarConexion();
            }
        }
        public Horario HorariosPorEspecialidadNúmero(int idMedico, string especialidad)
        {
            Horario Hor = new Horario();
            AccesoDatos datos = new AccesoDatos();
            AccesoDatos datosH = new AccesoDatos();
            try
            {
                datos.setearConsulta(@"
                            SELECT DISTINCT
                            H.DiaSemana
                            FROM Medicos M
                            INNER JOIN MedicosHorariosEspecialidades MHE ON M.IdMedico = MHE.IdMedico
                            INNER JOIN Especialidades E ON MHE.IdEspecialidad = E.IdEspecialidad
                            INNER JOIN Horarios H ON MHE.IdHorario = H.IdHorario
                            WHERE M.IdMedico = @IdMedico
                            AND E.Descripcion = @Descripcion
                        ");
                datos.setearParametro("@IdMedico", idMedico);
                datos.setearParametro("@Descripcion", especialidad);
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    //CONSULTA DE HORARIOS POR ESPECIALIDAD
                    Hor.DiasSemana.Add(datos.Lector["DiaSemana"].ToString());
                }
                datosH.setearConsulta(@"
                            SELECT DISTINCT H.HorarioEntrada, h.HorarioSalida
                            FROM Medicos M
                            INNER JOIN MedicosHorariosEspecialidades MHE ON M.IdMedico = MHE.IdMedico
                            INNER JOIN Especialidades E ON MHE.IdEspecialidad = E.IdEspecialidad
                            INNER JOIN Horarios H ON MHE.IdHorario = H.IdHorario
                            WHERE M.IdMedico = @IdMedico
                            AND E.Descripcion = @Descripcion
                        ");
                datosH.setearParametro("@IdMedico", idMedico);
                datosH.setearParametro("@Descripcion", especialidad);
                datosH.ejecutarLectura();
                datosH.Lector.Read();
                TimeSpan entrada = (TimeSpan)datosH.Lector["HorarioEntrada"];
                TimeSpan salida = (TimeSpan)datosH.Lector["HorarioSalida"];
                Hor.HoraEntrada = entrada.Hours;
                Hor.HoraSalida = salida.Hours;

                return Hor;
            }
            catch (Exception ex)
            {
                throw new Exception($"Error al obtener días del médico {idMedico} para {especialidad}.", ex);
            }
            finally
            {
                datos.cerrarConexion();
            }
        }




        // ===============================================
        // Listar todos los turnos de un médico
        // ===============================================
        public List<Turno> ListarTurnos(int idMedico)
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
                E.Descripcion AS Especialidad,
                ES.Descripcion AS Estado,
                P.Nombre AS NombrePaciente,
                P.Apellido AS ApellidoPaciente
                FROM Turnos T
                INNER JOIN Pacientes PA ON T.IdPaciente = PA.IdPaciente
                INNER JOIN Personas P ON PA.IdPersona = P.IdPersona
                INNER JOIN Especialidades E ON T.IdEspecialidad = E.IdEspecialidad
                INNER JOIN Estados ES ON T.IdEstado = ES.IdEstado
                WHERE T.IdMedico = @IdMedico
                ORDER BY T.FechaTurno ASC
                ");

                datos.setearParametro("@IdMedico", idMedico);
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Turno turno = new Turno
                    {
                        IdTurno = (int)datos.Lector["IdTurno"],
                        FechaHora = (DateTime)datos.Lector["FechaTurno"],
                        Motivo = datos.Lector["Motivo"] != DBNull.Value
                                    ? datos.Lector["Motivo"].ToString()
                                    : null,
                        Estado = (string)datos.Lector["Estado"],
                        Paciente = new Paciente
                        {
                            Nombre = (string)datos.Lector["NombrePaciente"],
                            Apellido = (string)datos.Lector["ApellidoPaciente"]
                        },
                        Especialidad = new Especialidad
                        {
                            Descripcion = (string)datos.Lector["Especialidad"]
                        }
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


        // ===================================================
        // Registrar diagnóstico y observación de un turno
        // ===================================================
        // ===============================================
        // Registrar un nuevo registro clínico para un turno
        // (Siempre INSERTA - nunca actualiza)
        // ===============================================
        public void RegistrarAtencion(int idTurno, string diagnostico, string observacion, string tratamiento)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                // Cree un nuevo registro clínico
                datos.setearConsulta(@"INSERT INTO RegistroClinico (IdTurno, Diagnostico, Observacion, Tratamiento)
                VALUES (@IdTurno, @Diagnostico, @Observacion, @Tratamiento)");

                datos.setearParametro("@IdTurno", idTurno);
                datos.setearParametro("@Diagnostico", diagnostico);
                datos.setearParametro("@Observacion", observacion);
                datos.setearParametro("@Tratamiento", tratamiento);

                datos.ejecutarAccion();


                // Actualizo el estado del turno a "Atendido"
                datos = new AccesoDatos();
                datos.setearConsulta(@" UPDATE Turnos SET IdEstado = 1  -- Atendido WHERE IdTurno = @IdTurno");
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


        // ===================================================
        // Buscar un médico por IdUsuario (para login)
        // ===================================================
        public Medico BuscarPorIdUsuario(int idUsuario)
        {
            AccesoDatos datos = new AccesoDatos();
            Medico medico = null;

            try
            {
                datos.setearConsulta(@"
                    SELECT 
                        M.IdMedico,
                        M.Matricula,
                        P.IdPersona,
                        P.Nombre,
                        P.Apellido,
                        P.Telefono,
                        U.IdUsuario,
                        U.Email,
                        U.Contrasenia,
                        I.UrlImagen
                    FROM Medicos M
                    INNER JOIN Personas P ON M.IdPersona = P.IdPersona
                    INNER JOIN Usuarios U ON M.IdUsuario = U.IdUsuario
                    LEFT JOIN Imagenes I ON I.IdImagen = P.IdImagen
                    WHERE U.IdUsuario = @IdUsuario
                ");

                datos.setearParametro("@IdUsuario", idUsuario);
                datos.ejecutarLectura();

                if (datos.Lector.Read())
                {
                    medico = new Medico
                    {
                        IdMedico = (int)datos.Lector["IdMedico"],
                        IdPersona = (int)datos.Lector["IdPersona"],
                        IdUsuario = (int)datos.Lector["IdUsuario"],
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

                // Obtener las especialidades del médico
                if (medico != null)
                {
                    medico.Especialidades = ListarEspecialidadesPorMedico(medico.IdMedico);
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

        // ===================================================
        // Listar especialidades del médico
        // ===================================================
        public List<Especialidad> ListarEspecialidadesPorMedico(int idMedico)
        {
            AccesoDatos datos = new AccesoDatos();
            List<Especialidad> lista = new List<Especialidad>();

            try
            {
                datos.setearConsulta(@"
                    SELECT DISTINCT 
                        E.IdEspecialidad, 
                        E.Descripcion 
                    FROM MedicosHorariosEspecialidades MHE
                    INNER JOIN Especialidades E ON MHE.IdEspecialidad = E.IdEspecialidad
                    WHERE MHE.IdMedico = @IdMedico
                ");

                datos.setearParametro("@IdMedico", idMedico);
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Especialidad esp = new Especialidad
                    {
                        IdEspecialidad = (int)datos.Lector["IdEspecialidad"],
                        Descripcion = (string)datos.Lector["Descripcion"]
                    };
                    lista.Add(esp);
                }

                return lista;
            }
            catch (Exception ex)
            {
                throw new Exception("Error al listar las especialidades del médico.", ex);
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

        // ===================================================
        // Actualizar datos personales (Nombre, Apellido, Teléfono, Email)
        // ===================================================
        public void ActualizarDatosBasicos(Medico medico)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta(@"
                    UPDATE Personas 
                    SET Nombre = @Nombre, 
                        Apellido = @Apellido, 
                        Telefono = @Telefono
                    WHERE IdPersona = @IdPersona;

                    UPDATE Usuarios 
                    SET Email = @Email
                    WHERE IdUsuario = @IdUsuario;
                ");

                datos.setearParametro("@Nombre", medico.Nombre);
                datos.setearParametro("@Apellido", medico.Apellido);
                datos.setearParametro("@Telefono", medico.Telefono);
                datos.setearParametro("@Email", medico.Email);
                datos.setearParametro("@IdPersona", medico.IdPersona);
                datos.setearParametro("@IdUsuario", medico.IdUsuario);

                datos.ejecutarAccion();
            }
            catch (Exception ex)
            {
                throw new Exception("Error al actualizar los datos personales del médico.", ex);
            }
            finally
            {
                datos.cerrarConexion();
            }
        }


    }
}
