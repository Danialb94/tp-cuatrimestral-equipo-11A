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
        // Guarda la fecha seleccionada en ViewState para mantenerla entre postbacks
        private DateTime FechaSeleccionada
        {
            get => (DateTime)(ViewState["FechaSeleccionada"] ?? DateTime.Now);
            set => ViewState["FechaSeleccionada"] = value;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Inicializa el DatePicker con la fecha actual
                txtFecha.Text = DateTime.Now.ToString("yyyy-MM-dd");
                FechaSeleccionada = DateTime.Now;
                // Carga los turnos del médico en la fecha actual
                CargarTurnos();
            }
        }
        //Botón “Buscar” o “Ver Turnos” que usa la fecha seleccionada en el DatePicker
        protected void btnBuscarFecha_Click(object sender, EventArgs e)
        {
            if (DateTime.TryParse(txtFecha.Text, out DateTime fecha))
            {
                FechaSeleccionada = fecha;
                CargarTurnos();
            }
        }

        // Método principal: carga los turnos del médico para la fecha seleccionada
        private void CargarTurnos()
        {
            var negocio = new MedicoNegocio();
            int idMedico = 1; // reemplazar por Session["Medico"].IdMedico

            var turnos = negocio.ListarTurnos(idMedico)
                                .Where(t => t.FechaHora.Date == FechaSeleccionada.Date)
                                .ToList();

            lblTotalTurnos.Text = turnos.Count.ToString();
            lblAtendidos.Text = turnos.Count(t => t.Estado == "Atendido").ToString();
            lblAtendidosTotal.Text = turnos.Count.ToString();
            lblPendientes.Text = turnos.Count(t => t.Estado == "Pendiente" || t.Estado == "Programado").ToString();

            lblFechaActual.Text = FechaSeleccionada.ToString("dddd, dd 'de' MMMM 'de' yyyy");
            lblTurnosFecha.Text = FechaSeleccionada.ToString("dd/MM/yyyy");

            gvTurnos.DataSource = turnos.Select(t => new
            {
                Hora = t.FechaHora.ToString("HH:mm"),
                Paciente = $"{t.Paciente.Nombre} {t.Paciente.Apellido}",
                Motivo = t.Motivo ?? "-",
                Estado = t.Estado,
                t.IdTurno
            }).ToList();

            gvTurnos.DataBind();
        }

      
    }
}
