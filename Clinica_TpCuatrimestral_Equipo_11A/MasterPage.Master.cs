using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using negocio;

namespace Clinica_TpCuatrimestral_Equipo_11A
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!(Page is Default || Page is RegistrarsePaciente||Page is OlvidarPass))
            {
                if (!Seguridad.sesionActiva(Session["usuario"]))
                    Response.Redirect("Default.aspx", false);
            }
        }
    }
}