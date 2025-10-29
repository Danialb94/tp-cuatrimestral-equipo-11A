using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Clinica_TpCuatrimestral_Equipo_11A
{
    public partial class AgregarHistorialMedico : System.Web.UI.Page
    {
        protected void btnGuardarHistorial_Click(object sender, EventArgs e)
        {
            Response.Redirect("PacienteMedico.aspx");
        }


    }
}
