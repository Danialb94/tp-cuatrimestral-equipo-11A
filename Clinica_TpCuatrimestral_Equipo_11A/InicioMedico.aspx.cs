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
                lblFechaActual.Text = DateTime.Now.ToString("dddd, dd 'de' MMMM 'de' yyyy");
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
                                .Where(t => t.FechaHora >= fecha.Date &&
                                            t.FechaHora < fecha.Date.AddDays(1))
                                .ToList();

            lblTotalTurnos.Text = turnos.Count.ToString();
            lblAtendidos.Text = turnos.Count(t => t.Estado == "Atendido").ToString();
            lblPendientes.Text = turnos.Count(t => t.Estado == "Pendiente").ToString();

            lblTurnosFecha.Text = fecha.ToString("dd/MM/yyyy");

            gvTurnos.DataSource = turnos.Select(t => new
            {
                IdTurno = t.IdTurno,
                Hora = t.FechaHora.ToString("HH:mm"),
                Paciente = t.Paciente.Nombre + " " + t.Paciente.Apellido,
                Motivo = t.Motivo ?? "-",
                Estado = t.Estado
            }).ToList();

            gvTurnos.DataBind();
        }
        protected void gvTurnos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index = Convert.ToInt32(e.CommandArgument);
            int idTurno = Convert.ToInt32(gvTurnos.DataKeys[index].Value);

            if (e.CommandName == "Registro")
            {
                Session["IdTurnoSeleccionado"] = idTurno;
                Response.Redirect("NuevoRegistroMedico.aspx");
            }
            else if (e.CommandName == "Detalle")
            {
                Session["IdTurnoSeleccionado"] = idTurno;
                Response.Redirect("DetalleTurnoMedico.aspx");
            }
            if (e.CommandName == "NuevaConsulta")
            {
                TurnoNegocio negTurno = new TurnoNegocio();
                Turno turno = negTurno.ObtenerPorId(idTurno);

                if (turno != null)
                {
                    PacienteNegocio negPaciente = new PacienteNegocio();
                    Paciente pacienteCompleto = negPaciente.BuscarPorIdPaciente(turno.Paciente.IdPaciente);
                    Session["TurnoSeleccionado"] = turno;
                    Session["PacienteSeleccionado"] = turno.Paciente;

                    Response.Redirect("NuevoRegistroMedico.aspx?origen=inicio", false);
                }
            }




        }


    }
}