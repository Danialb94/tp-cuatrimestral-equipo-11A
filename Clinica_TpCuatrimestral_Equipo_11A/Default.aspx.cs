using System;
using System.Web.UI;

namespace Clinica_TpCuatrimestral_Equipo_11A
{
    public partial class Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/InicioPaciente.aspx");
            //Response.Redirect("~/InicioMedico.aspx");
            //Response.Redirect("~/InicioRecepcionista.aspx");
        }
    }
}
