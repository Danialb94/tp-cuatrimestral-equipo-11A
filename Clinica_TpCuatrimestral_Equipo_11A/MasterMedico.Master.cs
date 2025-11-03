using dominio;
using negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace Clinica_TpCuatrimestral_Equipo_11A
{
    public partial class MasterMedico : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Usuario usuario = (Usuario)Session["usuario"];
            if (!Seguridad.sesionActiva(usuario) ||
                !(Seguridad.esMedico (usuario) || Seguridad.esAdministrador(usuario)))
            {
                Session.Add("Error", "No tenés permisos para ver esta página");
                Response.Redirect("Error.aspx", false);
            }
        }
    }
}