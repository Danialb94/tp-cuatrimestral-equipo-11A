using System;
using System.Collections.Generic;
using dominio; 
using negocio;

public class EspecialidadNegocio
{
    public List<Especialidad> listar()
    {
        List<Especialidad> lista = new List<Especialidad>();
        AccesoDatos datos = new AccesoDatos();

        try
        {
            datos.setearConsulta("SELECT Id, Descripcion, DuracionConsulta FROM Especialidad");
            datos.ejecutarLectura();

            while (datos.Lector.Read())
            {
                Especialidad esp = new Especialidad();
                esp.IdEspecialidad = (int)datos.Lector["Id"];
                esp.Descripcion = (string)datos.Lector["Descripcion"];
                esp.DuracionConsulta = (int)datos.Lector["DuracionConsulta"];

                lista.Add(esp);
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
