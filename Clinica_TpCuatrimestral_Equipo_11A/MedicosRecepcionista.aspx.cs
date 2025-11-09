using negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using dominio;

namespace Clinica_TpCuatrimestral_Equipo_11A
{
    public partial class MedicosRecepcionista : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                cargarEspecialidades();
                cargarMedicos();

                RecepcionistaNegocio negocio = new RecepcionistaNegocio();
                List<Medico> lista = negocio.listarMedicos();

                Session["listaMedicos"] = lista;
                dgvMedicos.DataSource = lista;
                dgvMedicos.DataBind();
            }
            else
            {
                
                dgvMedicos.DataSource = Session["listaMedicos"];
                dgvMedicos.DataBind();
            }
        }



        private void cargarMedicos()
        {
            RecepcionistaNegocio negocio = new RecepcionistaNegocio();
            dgvMedicos.DataSource = negocio.listarMedicos();
            dgvMedicos.DataBind();
        }

        protected void txtFiltroMedico_TextChanged(object sender, EventArgs e)
        {
            List<Medico> lista = (List<Medico>)Session["listaMedicos"];
            List<Medico> listaFiltrada = lista.FindAll(x => x.Nombre.ToUpper().Contains(txtFiltroMedico.Text.ToUpper()) ||
             x.Apellido.ToUpper().Contains(txtFiltroMedico.Text.ToUpper()));
            dgvMedicos.DataSource = listaFiltrada;
            dgvMedicos.DataBind();
        }


        private void cargarEspecialidades()
        {
            EspecialidadNegocio negocioEsp = new EspecialidadNegocio();
            try
            {

                ddlEspecialidadesRecepcionistaMedicos.DataSource = negocioEsp.listarDescripcion();
                ddlEspecialidadesRecepcionistaMedicos.DataBind();


                ListItem itemPorDefecto = new ListItem("Seleccione la especialidad", "");
                itemPorDefecto.Attributes.Add("disabled", "disabled");
                itemPorDefecto.Selected = true;
                ddlEspecialidadesRecepcionistaMedicos.Items.Insert(0, itemPorDefecto);
            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
            }
        }

        protected void ddlEspecialidadesRecepcionistaMedicos_SelectedIndexChanged(object sender, EventArgs e)
        {
            string especialidadSeleccionada = ddlEspecialidadesRecepcionistaMedicos.SelectedValue;


            List<Medico> listaMedicos = (List<Medico>)Session["listaMedicos"];

            if (string.IsNullOrEmpty(especialidadSeleccionada))
            {
                dgvMedicos.DataSource = listaMedicos;
            }
            else
            {
                var filtrados = listaMedicos.FindAll(x =>
                    x.Especialidades != null &&
                    x.Especialidades.Any(esp => esp.Descripcion == especialidadSeleccionada)
                );

                dgvMedicos.DataSource = filtrados;
            }

            dgvMedicos.DataBind();
        }


    }
}
