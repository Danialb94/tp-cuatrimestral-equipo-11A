using System;
using System.Collections.Generic;
using System.Linq;
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
                cargarTurnos(); 
            }
        }

        private void cargarEspecialidades()
        {
            EspecialidadNegocio negocioEsp = new EspecialidadNegocio();
            try
            {
                var lista = negocioEsp.listar();
                ddlCancelarRecepcionista.DataSource = lista;
                ddlCancelarRecepcionista.DataTextField = "Descripcion";
                ddlCancelarRecepcionista.DataValueField = "IdEspecialidad";
                ddlCancelarRecepcionista.DataBind();

                ddlCancelarRecepcionista.Items.Insert(0, new ListItem("Todas las especialidades", "0"));
            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
            }
        }

        private void cargarTurnos(int idEspecialidad = 0)
        {
            RecepcionistaNegocio negocio = new RecepcionistaNegocio();
            try
            {
                List<Turno> listaTurnos = negocio.listarTurnosDesdeHoy();

                if (idEspecialidad != 0)
                    listaTurnos = listaTurnos.Where(t => t.Especialidad.IdEspecialidad == idEspecialidad).ToList();

                dgvCancelarTurnosRecepcionista.DataSource = listaTurnos;
                dgvCancelarTurnosRecepcionista.DataBind();
            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
            }
        }

        protected void ddlCancelarRecepcionista_SelectedIndexChanged(object sender, EventArgs e)
        {
            int idEspecialidad = int.Parse(ddlCancelarRecepcionista.SelectedValue);
            cargarTurnos(idEspecialidad);
        }

        protected void dgvCancelarTurnosRecepcionista_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "CancelarTurno")
            {
                int idTurno = Convert.ToInt32(e.CommandArgument);
                RecepcionistaNegocio negocio = new RecepcionistaNegocio();

                try
                {
                    negocio.CancelarClinica(idTurno);
                    
                    int idEspecialidad = int.Parse(ddlCancelarRecepcionista.SelectedValue);
                    cargarTurnos(idEspecialidad);
                }
                catch (Exception ex)
                {
                    lblMensaje.CssClass = "text-danger fw-semibold";
                    lblMensaje.Text = "Error al cancelar el turno.";
                    Session.Add("error", ex);
                }
            }
        }
    }
}
