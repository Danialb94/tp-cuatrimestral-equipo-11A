
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using dominio;
using negocio;


namespace Clinica_TpCuatrimestral_Equipo_11A
{
    public partial class Recepcionista : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Usuario usuario = (Usuario)Session["usuario"]; 
            if (!Seguridad.sesionActiva(usuario) ||
                !(Seguridad.esRecepcionista(usuario) || Seguridad.esAdministrador(usuario)))
            {
                Session.Add("Error", "No tenés permisos para ver esta página");
                Response.Redirect("Error.aspx", false);
            }
        }
    }
}