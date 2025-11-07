using negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Clinica_TpCuatrimestral_Equipo_11A
{
    public partial class MedicosRecepcionista : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                cargarMedicos();
        }

        private void cargarMedicos()
        {
            RecepcionistaNegocio negocio = new RecepcionistaNegocio();
            gvMedicos.DataSource = negocio.listarMedicos();
            gvMedicos.DataBind();
        }
    }
}
