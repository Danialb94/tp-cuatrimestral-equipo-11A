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
    public partial class SolicitarTurnoRecepcionista : System.Web.UI.Page
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

                ddlEspecialidades.DataSource = negocioEsp.listarDescripcion();
                ddlEspecialidades.DataBind();


                ListItem itemPorDefecto = new ListItem("Seleccione la especialidad", "");
                itemPorDefecto.Attributes.Add("disabled", "disabled");
                itemPorDefecto.Selected = true;
                ddlEspecialidades.Items.Insert(0, itemPorDefecto);
            }
            catch (Exception ex)
            {

                Session.Add("error", ex);
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void ddlEspecialidades_SelectedIndexChanged(object sender, EventArgs e)
        {
            string especialidadSeleccionada = ddlEspecialidades.SelectedValue;

            if (!string.IsNullOrEmpty(especialidadSeleccionada))
            {
                cargarProfesionalesPorEspecialidad(especialidadSeleccionada);
            }
            else
            {
                ddlProfesionales.Items.Clear();
                ddlProfesionales.Items.Insert(0, new ListItem("Seleccione un profesional", ""));
            }
        }



        private void cargarProfesionalesPorEspecialidad(string descripcionEspecialidad)
        {
            RecepcionistaNegocio negocio = new RecepcionistaNegocio();

            try
            {
                List<Medico> medicos = negocio.listarMedicosRecepcionista()
                    .Where(m => m.Especialidades.Any(e => e.Descripcion == descripcionEspecialidad))
                    .ToList();

               
                var lista = medicos.Select(x => new
                {
                    IdMedico = x.IdMedico,
                    NombreCompleto = x.Nombre + " " + x.Apellido
                }).ToList();

                ddlProfesionales.DataSource = lista;
                ddlProfesionales.DataTextField = "NombreCompleto";
                ddlProfesionales.DataValueField = "IdMedico";
                ddlProfesionales.DataBind();

                ddlProfesionales.Items.Insert(0, new ListItem("Seleccione un profesional", ""));
            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
                Response.Redirect("Error.aspx", false);
            }
        }


    }
}