using dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace negocio
{
    public class TipoDocumentoNegocio
    {
        public List<TipoDocumento> listar()
        {
            List<TipoDocumento> lista = new List<TipoDocumento>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("SELECT IdTipoDocumento, Descripcion FROM TiposDocumento");
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    TipoDocumento tipo = new TipoDocumento();
                    tipo.IdTipoDocumento = (int)datos.Lector["IdTipoDocumento"];
                    tipo.Descripcion = (string)datos.Lector["Descripcion"];

                    lista.Add(tipo);
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
