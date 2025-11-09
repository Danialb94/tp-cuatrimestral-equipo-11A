using dominio;
using negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Clinica_TpCuatrimestral_Equipo_11A
{
    public partial class CartillaMedica : System.Web.UI.Page
    {
        public List<Medico> ListaMedico { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            // ID = "ddlEspecialidades"
            EspecialidadNegocio negocioEsp = new EspecialidadNegocio();
            try
            {
                if (!IsPostBack)
                {
                    //FILTRO ESPECIALIDAD
                    ddlEspecialidades.DataSource = negocioEsp.listarDescripcion();
                    ddlEspecialidades.DataBind();
                    ListItem itemporDefecto = new ListItem();
                    itemporDefecto.Text = "Seleccionar la especialidad";
                    itemporDefecto.Attributes.Add("disabled", "disabled"); // El atributo "Disabled" evita que el usuario pueda seleccionarlo después
                    itemporDefecto.Selected = true; // El atributo "Selected" asegura que aparezca por defecto
                    ddlEspecialidades.Items.Insert(0, itemporDefecto);

                    RecepcionistaNegocio negocio = new RecepcionistaNegocio();
                    ListaMedico = negocio.listarMedicos();
                }
            }
            catch(Exception ex)
            {
                Session.Add("error", ex);
            }
        }
    }
}