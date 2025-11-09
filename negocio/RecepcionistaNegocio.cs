using dominio;
using System;
using System.Collections.Generic;
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

                    aux.Horario = horario;

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



    }
}

