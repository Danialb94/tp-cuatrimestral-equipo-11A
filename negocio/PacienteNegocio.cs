using dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace negocio
{
    internal class PacienteNegocio
    {
        //public List<Paciente> listar()
        //{
        //    List<Paciente> lista = new List<Paciente>();
        //    AccesoDatos datos = new AccesoDatos();

        //    try
        //    {
        //        datos.setearConsulta("select P.IdPaciente, PE.Nombre, PE.Apellido, PE.Telefono, TD.Descripcion AS TipoDocumento, P.Documento, P.Domicilio, P.FechaNacimiento, C.Descripcion AS Cobertura, I.UrlImagen from Pacientes P join TiposDocumento TD ON TD.IdTipoDocumento = P.IdTipoDocumento join Coberturas C ON C.IdCobertura = P.IdCobertura join Personas PE ON PE.IdPersona = P.IdPersona join Usuarios U ON U.IdUsuario = PE.IdUsuario join Imagenes I ON I.IdImagen = PE.IdImagen");
        //        datos.ejecutarLectura();
        //        while (datos.Lector.Read())
        //        {
        //            Paciente paciente = new Paciente();
        //            paciente.IdPaciente = (int)datos.Lector["IdPaciente"];
        //            if (!(datos.Lector["Nombre"] is DBNull))
        //                paciente.Nombre = (string)datos.Lector["Nombre"];
        //            if (!(datos.Lector["Apellido"] is DBNull))
        //                paciente.Apellido = (string)datos.Lector["Apellido"];
        //            if (!(datos.Lector["TipoDocumento"] is DBNull))
        //                paciente.TipoDocumento = (string)datos.Lector["Descripcion"];
        //            if (!(datos.Lector["Documento"] is DBNull))
        //                paciente.Documento = (string)datos.Lector["Documento"];
        //            if (!(datos.Lector["Domicilio"] is DBNull))
        //                paciente.Domicilio = (string)datos.Lector["Domicilio"];
        //            if (!(datos.Lector["FechaNacimiento"] is DBNull))
        //                paciente.FechaNacimiento = (DateTime)datos.Lector["FechaNacimiento"];
        //            if (!(datos.Lector["Cobertura"] is DBNull))
        //                paciente.Cobertura = (string)datos.Lector["Descripcion"];
        //            if (!(datos.Lector["Cobertura"] is DBNull))
        //                paciente.Cobertura = (string)datos.Lector["Descripcion"];

        //            //public int IdPaciente { get; set; }
        //            //public string TipoDocumento { get; set; }
        //            //public string Documento { get; set; }
        //            //public string Domicilio { get; set; }
        //            //public DateTime FechaNacimiento { get; set; }
        //            //public string Cobertura { get; set; }
        //            ////public HistoriaClinica HistoriaClinica { get; set; }
        //            //public List<string> Alergias { get; set; }
        //            //public List<string> CondicionBase { get; set; }
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //    }
        //}
    }
}
