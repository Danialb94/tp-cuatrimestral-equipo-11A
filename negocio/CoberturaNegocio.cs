using dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace negocio
{
    public class CoberturaNegocio
    {
        public List<Cobertura> listar()
        {
            List<Cobertura> lista = new List<Cobertura>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("SELECT IdCobertura, Descripcion FROM Coberturas");
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Cobertura cobertura = new Cobertura();
                    cobertura.IdCobertura = (int)datos.Lector["IdCobertura"];
                    cobertura.Descripcion = (string)datos.Lector["Descripcion"];
                    lista.Add(cobertura);
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

