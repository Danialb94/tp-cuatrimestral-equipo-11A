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
    public partial class AgregarMedico : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarEspecialidades();
            }
        }

        private void CargarEspecialidades()
        {
            try
            {
                EspecialidadNegocio negocio = new EspecialidadNegocio(); 
                List<Especialidad> lista = negocio.listar(); 

                ddlEspecialidades.DataSource = lista;
                ddlEspecialidades.DataTextField = "Descripcion";
                ddlEspecialidades.DataValueField = "IdEspecialidad";
                ddlEspecialidades.DataBind();

                ddlEspecialidades.Items.Insert(0, new ListItem("Seleccione especialidad", "0"));
            }
            catch (Exception ex)
            {
                // Mostrar mensaje de error amigable o loguearlo
                throw ex;
            }
        }
    }
}