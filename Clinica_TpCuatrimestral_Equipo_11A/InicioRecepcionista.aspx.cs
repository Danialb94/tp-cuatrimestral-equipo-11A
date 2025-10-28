using System;
using System.Collections.Generic;
using System.Web.UI.WebControls;
using dominio;
using negocio;

namespace Clinica_TpCuatrimestral_Equipo_11A
{
    public partial class InicioRecepcionista : System.Web.UI.Page
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
                
                ddlEspecialidadesRecepcionista.DataSource = negocioEsp.listarDescripcion();
                ddlEspecialidadesRecepcionista.DataBind();

               
                ListItem itemPorDefecto = new ListItem("Seleccione la especialidad", "");
                itemPorDefecto.Attributes.Add("disabled", "disabled");
                itemPorDefecto.Selected = true;
                ddlEspecialidadesRecepcionista.Items.Insert(0, itemPorDefecto);
            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
            }
        }

        protected void ddlEspecialidadesRecepcionista_SelectedIndexChanged(object sender, EventArgs e)
        {
            string especialidadSeleccionada = ddlEspecialidadesRecepcionista.SelectedValue;
           
        }
    }
}
