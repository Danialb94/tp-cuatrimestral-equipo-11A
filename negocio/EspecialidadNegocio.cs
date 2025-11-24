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
            datos.setearConsulta("SELECT IdEspecialidad, Descripcion, DuracionConsulta FROM Especialidades");
            datos.ejecutarLectura();

            while (datos.Lector.Read())
            {
                Especialidad esp = new Especialidad();
                esp.IdEspecialidad = (int)datos.Lector["IdEspecialidad"];
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

    public List<string> listarDescripcion()
    {
        List<string> lista = new List<string>();
        AccesoDatos datos = new AccesoDatos();

        try
        {
            datos.setearConsulta("SELECT IdEspecialidad, Descripcion, DuracionConsulta FROM Especialidades");
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
    public int duracionConsulta(string especialidad)
    {
        AccesoDatos datos = new AccesoDatos();
        int aux=0;
        try
        {
            datos.setearConsulta(@"
                SELECT DuracionConsulta 
                FROM Especialidades
                WHERE Descripcion = @Descripcion");
            datos.setearParametro("@Descripcion", especialidad);
            datos.ejecutarLectura();

            if (datos.Lector.Read())
            {
                aux = (int)datos.Lector["DuracionConsulta"];
            }

            return aux;
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
