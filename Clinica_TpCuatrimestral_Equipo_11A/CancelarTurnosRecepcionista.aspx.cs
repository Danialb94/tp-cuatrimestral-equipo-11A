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
    public partial class CancelarTurnosRecepcionista : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cargarEspecialidades();
            }
        }

        private void cargarEspecialidades()
        {
            EspecialidadNegocio negocioEsp = new EspecialidadNegocio();
            try
            {

                ddlCancelarRecepcionista.DataSource = negocioEsp.listarDescripcion();
                ddlCancelarRecepcionista.DataBind();


                ListItem itemPorDefecto = new ListItem("Seleccione la especialidad", "");
                itemPorDefecto.Attributes.Add("disabled", "disabled");
                itemPorDefecto.Selected = true;
                ddlCancelarRecepcionista.Items.Insert(0, itemPorDefecto);
            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
            }
        }

        protected void ddlEspecialidadesRecepcionista_SelectedIndexChanged(object sender, EventArgs e)
        {
            string especialidadSeleccionada = ddlCancelarRecepcionista.SelectedValue;

        }
        protected void ddlCancelarRecepcionista_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        protected void ddlMedicoCancelar_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        protected void ddlFechaCancelar_SelectedIndexChanged(object sender, EventArgs e)
        {
           
        }
    }
}
