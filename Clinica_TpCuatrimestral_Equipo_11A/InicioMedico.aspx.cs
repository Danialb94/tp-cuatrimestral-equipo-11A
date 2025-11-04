using dominio;
using negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;

namespace Clinica_TpCuatrimestral_Equipo_11A
{
    public partial class InicioMedico : System.Web.UI.Page
    {
        // 🔹 Guarda la fecha seleccionada en ViewState para mantenerla entre postbacks
        private DateTime fechaSeleccionada
        {
            get { return (DateTime)(ViewState["FechaSeleccionada"] ?? DateTime.Now); }
            set { ViewState["FechaSeleccionada"] = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Inicializa el DatePicker con la fecha actual
                txtFecha.Text = DateTime.Now.ToString("yyyy-MM-dd");
                fechaSeleccionada = DateTime.Now;

                // Carga los turnos del médico en la fecha actual
                CargarTurnos();
            }
        }

        // 🔹 Botón “Buscar” o “Ver Turnos” que usa la fecha seleccionada en el DatePicker
        protected void btnBuscarFecha_Click(object sender, EventArgs e)
        {
            if (DateTime.TryParse(txtFecha.Text, out DateTime fecha))
            {
                fechaSeleccionada = fecha;
                CargarTurnos();
            }
        }

        // 🔹 Método principal: carga los turnos del médico para la fecha seleccionada
        private void CargarTurnos()
        {
            MedicoNegocio negocio = new MedicoNegocio();

            // ⚠️ Por ahora usamos un ID fijo. Después se reemplaza con Session["Medico"].IdMedico
            int idMedico = 1;

            List<Turno> lista = negocio.ListarTurnos(idMedico);
            var turnosDia = lista.Where(t => t.FechaHora.Date == fechaSeleccionada.Date).ToList();

            // 📊 Calculamos estadísticas del día
            int total = turnosDia.Count;
            int atendidos = turnosDia.Count(t => t.Estado == "Atendido");
            int pendientes = turnosDia.Count(t => t.Estado == "Pendiente" || t.Estado == "Programado");

            lblTotalTurnos.Text = total.ToString();
            lblAtendidos.Text = atendidos.ToString();
            lblAtendidosTotal.Text = total.ToString();
            lblPendientes.Text = pendientes.ToString();

            // 📅 Actualizamos etiquetas de fecha
            lblFechaActual.Text = fechaSeleccionada.ToString("dddd, dd 'de' MMMM 'de' yyyy");
            lblTurnosFecha.Text = fechaSeleccionada.ToString("dd/MM/yyyy");

            // 🩺 Cargamos la grilla con los turnos del día
            gvTurnos.DataSource = turnosDia.Select(t => new
            {
                Hora = t.FechaHora.ToString("HH:mm"),
                Paciente = $"{t.Paciente.Nombre} {t.Paciente.Apellido}",
                Motivo = t.Motivo ?? "-",
                Estado = t.Estado,
                t.IdTurno
            }).ToList();

            gvTurnos.DataBind();
        }

        // 🔹 Manejo de los botones dentro del GridView
        protected void gvTurnos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int idTurno = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "VerHistorial")
            {
                Response.Redirect($"HistoriaClinicaMedico.aspx?idTurno={idTurno}");
            }
            else if (e.CommandName == "VerDetalle")
            {
                Response.Redirect($"DetalleTurnoMedico.aspx?idTurno={idTurno}");
            }
        }
    }
}
