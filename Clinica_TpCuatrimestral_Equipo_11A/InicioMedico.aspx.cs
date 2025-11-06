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
    public partial class InicioMedico : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtFecha.Text = DateTime.Now.ToString("yyyy-MM-dd");
                CargarTurnos(DateTime.Now);
            }
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            if (DateTime.TryParse(txtFecha.Text, out DateTime fechaSeleccionada))
                CargarTurnos(fechaSeleccionada);
        }

        private void CargarTurnos(DateTime fecha)
        {
            var medico = Session["Medico"] as Medico;
            if (medico == null)
            {
                Response.Redirect("Default.aspx");
                return;
            }

            var negocio = new MedicoNegocio();
            var turnos = negocio.ListarTurnos(medico.IdMedico)
                                .Where(t => t.FechaHora.Date == fecha.Date)
                                .ToList();

            // Resumen
            lblTotalTurnos.Text = turnos.Count.ToString();
            lblAtendidos.Text = turnos.Count(t => t.Estado == "Atendido").ToString();
            lblPendientes.Text = turnos.Count(t => t.Estado == "Pendiente" || t.Estado == "Programado").ToString();

            // Encabezados
            lblFechaActual.Text = fecha.ToString("dddd, dd 'de' MMMM 'de' yyyy");
            lblTurnosFecha.Text = fecha.ToString("dd/MM/yyyy");

            // Grilla
            gvTurnos.DataSource = turnos.Select(t => new
            {
                Hora = t.FechaHora.ToString("HH:mm"),
                Paciente = t.Paciente.Nombre + " " + t.Paciente.Apellido,
                Motivo = t.Motivo ?? "-",
                Estado = t.Estado
            }).ToList();

            gvTurnos.DataBind();
        }
    }
}