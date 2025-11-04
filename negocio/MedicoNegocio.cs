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
        // 🔹 1. Listar todos los turnos del médico
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
                        E.Descripcion AS Especialidad,
                        ES.Descripcion AS Estado,
                        P.Nombre,
                        P.Apellido,
                        C.Descripcion AS Cobertura
                    FROM Turnos T
                    INNER JOIN Pacientes PA ON T.IdPaciente = PA.IdPaciente
                    INNER JOIN Personas P ON PA.IdPersona = P.IdPersona
                    INNER JOIN Coberturas C ON PA.IdCobertura = C.IdCobertura
                    INNER JOIN Especialidades E ON T.IdEspecialidad = E.IdEspecialidad
                    INNER JOIN Estados ES ON T.IdEstado = ES.IdEstado
                    WHERE T.IdMedico = @IdMedico
                    ORDER BY T.FechaTurno ASC");

                datos.setearParametro("@IdMedico", idMedico);
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Turno aux = new Turno();
                    aux.IdTurno = (int)datos.Lector["IdTurno"];
                    aux.FechaHora = (DateTime)datos.Lector["FechaTurno"];
                    aux.Estado = (string)datos.Lector["Estado"];

                    aux.Paciente = new Paciente();
                    aux.Paciente.Nombre = (string)datos.Lector["Nombre"];
                    aux.Paciente.Apellido = (string)datos.Lector["Apellido"];
                    aux.Paciente.Cobertura = (string)datos.Lector["Cobertura"];

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

        // 🔹 2. Agregar (registrar diagnóstico y observaciones del turno)
        public void AgregarRegistroClinico(int idTurno, string diagnostico, string observaciones)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta(@"
                    UPDATE Turnos 
                    SET Diagnostico = @Diagnostico, 
                        Observacion = @Observacion, 
                        IdEstado = 1 -- Atendido
                    WHERE IdTurno = @IdTurno");

                datos.setearParametro("@Diagnostico", diagnostico);
                datos.setearParametro("@Observacion", observaciones);
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

        // 🔹 3. Modificar datos personales y acceso del médico
        public void ModificarDatos(Medico medico)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta(@"
                    -- Actualiza datos personales
                    UPDATE Personas 
                    SET 
                        Nombre = @Nombre, 
                        Apellido = @Apellido, 
                        Telefono = @Telefono
                    WHERE IdPersona = (SELECT IdPersona FROM Medicos WHERE IdMedico = @IdMedico);

                    -- Actualiza datos de usuario (correo y contraseña)
                    UPDATE Usuarios 
                    SET 
                        Email = @Email, 
                        Contrasenia = @Contrasenia
                    WHERE IdUsuario = (SELECT IdUsuario FROM Medicos WHERE IdMedico = @IdMedico);
                ");

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
                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }
    }
}
