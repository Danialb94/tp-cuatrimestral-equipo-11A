using dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace negocio
{
    internal class ImagenNegocio
    {
        public void Agregar(Imagen nuevo, int IdPersona)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("INSERT INTO Imagenes (UrlImagen) VALUES (@UrlImagen); SET @IDI = SCOPE_IDENTITY(); UPDATE Personas SET IdImagen = @IDI Where IdPersona = @IdPersona");
                //IMAGEN
                datos.setearParametro("@UrlImagen", nuevo.UrlImagen);
                datos.setearParametro("@IdPersona", IdPersona);
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
        public void Modificar(Imagen nuevo)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("UPDATE Imagenes SET UrlImagen = @UrlImagen WHERE IdImagen = @IdImagen");
                //IMAGEN
                datos.setearParametro("@UrlImagen", nuevo.UrlImagen);
                datos.setearParametro("@IdImagen", nuevo.IdImagen);
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
        public void Eliminar(Imagen seleccion)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("UPDATE Personas SET IdImagen = null WHERE IdImagen = @IdImagen go DELETE FROM Imagenes WHERE IdImagen = @IdImagen");
                //IMAGEN
                datos.setearParametro("@IdImagen", seleccion.IdImagen);
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
