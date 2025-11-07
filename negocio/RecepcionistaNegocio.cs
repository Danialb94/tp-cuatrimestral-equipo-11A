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


                    aux.Horario = horario;
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

