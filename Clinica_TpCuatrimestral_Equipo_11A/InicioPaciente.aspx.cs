using dominio;
using negocio;
using System;
using System.Collections.Generic;
using System.Data.SqlTypes;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Clinica_TpCuatrimestral_Equipo_11A
{
    public partial class InicioPaciente : System.Web.UI.Page
    {
        int idTurno;

        protected void Page_Load(object sender, EventArgs e)
        {
            Paciente paciente = new Paciente();
            paciente = Session["Paciente"] as Paciente;
            if (paciente == null)
            {
                Response.Redirect("Default.aspx");
            }
            CargarTurnos();
        }

        protected void CargarTurnos()
        {
            Paciente paciente = new Paciente();
            paciente = Session["Paciente"] as Paciente;
            PacienteNegocio negocioPaciente = new PacienteNegocio();
            TurnoNegocio negocioTurno = new TurnoNegocio();
            List<Turno> turnos = new List<Turno>();
            turnos = negocioTurno.listarTurnosxPaciente(paciente.IdPaciente);

            if (turnos.Count() > 0)
            {
                gvTurnos.Visible = true;
                lblTitulo.Text = "Turnos Próximos";
                gvTurnos.DataSource = turnos.Select(t => new
                {
                    id = t.IdTurno,
                    Hora = t.FechaHora.ToString("HH:mm"),
                    Fecha = t.FechaHora.ToString("dd/MM/yyyy"),
                    Especialidad = t.Especialidad.Descripcion,
                    Medico = t.Medico.Nombre + " " + t.Medico.Apellido
                }).ToList();
                gvTurnos.DataBind();
            }
            else
            {
                lblTitulo.Text = "No tenés turnos Pendientes";
                gvTurnos.Visible = false;
            }
        }

        protected void btnConfirmarCancelar_Click(object sender, EventArgs e)
        {
            idTurno = Convert.ToInt32(hdnTurnoId.Value);
            if (idTurno != 0)
            {
                TurnoNegocio negocio = new TurnoNegocio();
                negocio.CancelarxPaciente(idTurno);
                Response.Redirect("InicioPaciente.aspx");
            }
        }
    }
}