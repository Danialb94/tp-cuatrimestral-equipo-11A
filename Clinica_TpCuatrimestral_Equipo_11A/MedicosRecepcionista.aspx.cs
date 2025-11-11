using negocio;
using System;
using System.Collections.Generic;
using System.Linq;
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
            }
        }

        private void cargarMedicos()
        {
            RecepcionistaNegocio negocio = new RecepcionistaNegocio();
            List<Medico> lista = negocio.listarMedicos();
            Session["listaMedicos"] = lista;
            dgvMedicos.DataSource = lista;
            dgvMedicos.DataBind();
        }

        protected void txtFiltroMedico_TextChanged(object sender, EventArgs e)
        {
            List<Medico> lista = (List<Medico>)Session["listaMedicos"];
            List<Medico> listaFiltrada = lista.FindAll(x =>
                x.Nombre.ToUpper().Contains(txtFiltroMedico.Text.ToUpper()) ||
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

        protected void dgvMedicos_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Medico medico = (Medico)e.Row.DataItem;

                // ESPECIALIDAD
                Literal litEspecialidad = (Literal)e.Row.FindControl("litEspecialidad");
                if (medico.Especialidades != null && medico.Especialidades.Count > 0)
                {
                    litEspecialidad.Text = medico.Especialidades[0].Descripcion;
                }
                else
                {
                    litEspecialidad.Text = "-";
                }

                // FRANJA HORARIA
                Literal litHorario = (Literal)e.Row.FindControl("litHorario");
                if (medico.Horario != null && medico.Horario.Count > 0)
                {
                    Horario primerHorario = medico.Horario[0];
                    litHorario.Text = $"{primerHorario.HoraEntrada}:00 - {primerHorario.HoraSalida}:00";
                }
                else
                {
                    litHorario.Text = "-";
                }

                // DÍAS DISPONIBLES
                Literal litDias = (Literal)e.Row.FindControl("litDias");
                if (medico.Horario != null && medico.Horario.Count > 0)
                {
                    // Obtener el primer horario y sus días
                    Horario primerHorario = medico.Horario[0];
                    if (primerHorario.DiasSemana != null && primerHorario.DiasSemana.Count > 0)
                    {
                        litDias.Text = string.Join(", ", primerHorario.DiasSemana);
                    }
                    else
                    {
                        litDias.Text = "-";
                    }
                }
                else
                {
                    litDias.Text = "-";
                }
            }
        }
    }
}
