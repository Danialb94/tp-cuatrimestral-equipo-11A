using dominio;
using negocio;
using System;
using System.Collections;
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
            MedicoNegocio negocio = new MedicoNegocio();
            try
            {
                if (!IsPostBack)
                {
                    //FILTRO ESPECIALIDAD
                    ddlEspecialidades.DataSource = negocioEsp.listarDescripcion();
                    ddlEspecialidades.DataBind();

                    ListItem itemporDefecto = new ListItem();
                    itemporDefecto.Text = "Seleccionar la especialidad";
                    itemporDefecto.Value = "";
                    itemporDefecto.Attributes.Add("disabled", "disabled"); // El atributo "Disabled" evita que el usuario pueda seleccionarlo después
                    itemporDefecto.Selected = true; // El atributo "Selected" asegura que aparezca por defecto
                    ddlEspecialidades.Items.Insert(0, itemporDefecto);

                    Session["ListaMedicosCompleta"] = negocio.ListarMedicos();
                    ListaMedico = (List<Medico>)Session["ListaMedicosCompleta"];
                }
                else
                {
                    // En PostBack, recuperar la lista de Session
                    ListaMedico = (List<Medico>)Session["ListaMedicosCompleta"];
                    AplicarFiltros();
                }
            }
            catch(Exception ex)
            {
                Session.Add("error", ex);
            }
        }
        protected void txtMedico_TextChanged(object sender, EventArgs e)
        {
            AplicarFiltros();
        }
        protected void ddlEspecialidades_SelectedIndexChanged(object sender, EventArgs e)
        {
            AplicarFiltros();
        }

        private void AplicarFiltros()
        {
            List<Medico> listaCompleta = (List<Medico>)Session["ListaMedicosCompleta"];

            if (listaCompleta == null)
                return;

            List<Medico> listaFiltrada = listaCompleta;

            // Filtro por nombre/apellido
            string filtroTexto = txtMedico.Text;
            if (!string.IsNullOrEmpty(filtroTexto))
            {
                listaFiltrada = listaFiltrada.FindAll(x =>
                    x.Nombre.ToUpper().Contains(filtroTexto.ToUpper()) ||
                    x.Apellido.ToUpper().Contains(filtroTexto.ToUpper()));
            }

            // Filtro por especialidad
            string especialidadSeleccionada = ddlEspecialidades.SelectedValue;
            if (!string.IsNullOrEmpty(especialidadSeleccionada) && especialidadSeleccionada != "")
            {
                listaFiltrada = listaFiltrada.FindAll(x =>
                    x.Especialidades.Any(esp => esp.Descripcion == especialidadSeleccionada));
            }

            ListaMedico = listaFiltrada;
        }


    }
}