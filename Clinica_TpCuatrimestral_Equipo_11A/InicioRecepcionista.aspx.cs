using dominio;
using negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;

namespace Clinica_TpCuatrimestral_Equipo_11A
{
    public partial class InicioRecepcionista : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cargarEspecialidades();
                cargarEstados();
                //txtFechaDesde.Text = DateTime.Now.ToString("yyyy-MM-dd");
                cargarTurnosRecepcionista();
            }
        }

        private void cargarEspecialidades()
        {
            EspecialidadNegocio negocioEsp = new EspecialidadNegocio();
            try
            {
                
                ddlEspecialidadesRecepcionista.DataSource = negocioEsp.listarDescripcion();
                ddlEspecialidadesRecepcionista.DataBind();

               
                ListItem itemPorDefecto = new ListItem("Todas las Especialidades", "");
                itemPorDefecto.Attributes.Add("disabled", "disabled");
                itemPorDefecto.Selected = true;
                ddlEspecialidadesRecepcionista.Items.Insert(0, itemPorDefecto);
            }
            catch (Exception ex)
            {

                Session.Add("error", ex);
                Response.Redirect("Error.aspx", false);
            }
        }

        private void cargarEstados()
        {
            TurnoNegocio negocio = new TurnoNegocio();
            try
            {

                ddlEstado.DataSource = negocio.listarEstados();
                ddlEstado.DataBind();


                ListItem itemPorDefecto = new ListItem("Todos los Estados", "");
                itemPorDefecto.Attributes.Add("disabled", "disabled");
                itemPorDefecto.Selected = true;
                ddlEstado.Items.Insert(0, itemPorDefecto);
            }
            catch (Exception ex)
            {

                Session.Add("error", ex);
                Response.Redirect("Error.aspx", false);
            }
        }


        private void cargarTurnosRecepcionista()
        {
            TurnoNegocio negocio = new TurnoNegocio();
            List<Turno> listaTurnos = negocio.listarTurnos();
            Session["ListaTurnosCompleta"] = listaTurnos;
            gvTurnosRecepcionista.DataSource = listaTurnos;
            gvTurnosRecepcionista.DataBind();
        }

        protected void AplicarFiltros(object sender, EventArgs e)
        {
            List<Turno> listaTurnos = Session["ListaTurnosCompleta"] as List<Turno>;

            if (listaTurnos == null)
            {
                cargarTurnosRecepcionista();
                return;
            }

            List<Turno> turnosFiltrados = new List<Turno>(listaTurnos);

            // FILTRO POR ESPECIALIDAD
            string especialidadSeleccionada = ddlEspecialidadesRecepcionista.SelectedValue;
            if (!string.IsNullOrEmpty(especialidadSeleccionada))
            {
                turnosFiltrados = turnosFiltrados.FindAll(x =>
                    x.Especialidad != null &&
                    x.Especialidad.Descripcion == especialidadSeleccionada
                );
            }
            // FILTRO POR ESTADO
            string estadoSeleccionado = ddlEstado.SelectedValue;
            if (!string.IsNullOrEmpty(estadoSeleccionado))
            {
                turnosFiltrados = turnosFiltrados.FindAll(x =>
                    x.Estado != null &&
                    x.Estado == estadoSeleccionado
                );
            }
            // FILTRO POR FECHA DESDE
            if (!string.IsNullOrEmpty(txtFechaDesde.Text))
            {
                DateTime fechaDesde = DateTime.Parse(txtFechaDesde.Text);
                turnosFiltrados = turnosFiltrados.FindAll(x =>
                    x.FechaHora.Date >= fechaDesde.Date
                );
            }

            // Ordenar por fecha descendente (más recientes primero)
            turnosFiltrados = turnosFiltrados.OrderBy(x => x.FechaHora).ToList();

            // Mostrar resultados
            gvTurnosRecepcionista.DataSource = turnosFiltrados;
            gvTurnosRecepcionista.DataBind();
        }

        protected void btnLimpiarFiltros_Click(object sender, EventArgs e)
        {
            // Limpiar todos los filtros
            ddlEspecialidadesRecepcionista.SelectedIndex = 0;
            ddlEstado.SelectedIndex = 0;
            txtFechaDesde.Text = "";

            // Recargar todos los turnos
            cargarTurnosRecepcionista();
        }
    }
}
