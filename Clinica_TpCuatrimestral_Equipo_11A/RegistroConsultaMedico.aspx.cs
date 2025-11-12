using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using dominio;
using negocio;

namespace Clinica_TpCuatrimestral_Equipo_11A
{
    public partial class RegistroConsultaMedico : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Medico"] == null || Session["PacienteSeleccionado"] == null)
                {
                    Response.Redirect("PacienteMedico.aspx", false);
                    return;
                }

                Medico medico = (Medico)Session["Medico"];
                Paciente paciente = (Paciente)Session["PacienteSeleccionado"];

                CargarDatosPaciente(paciente, medico);
                CargarConsultas(paciente.IdPaciente, medico.IdMedico);
            }
        }

        private void CargarDatosPaciente(Paciente paciente, Medico medico)
        {
            lblNombre.Text = paciente.Nombre;
            lblApellido.Text = paciente.Apellido;
            lblFechaNac.Text = paciente.FechaNacimiento.ToString("dd/MM/yyyy");
            lblEdad.Text = CalcularEdad(paciente.FechaNacimiento).ToString() + " años";
            lblDomicilio.Text = paciente.Domicilio;
            lblProfesional.Text = medico.Nombre + " " + medico.Apellido;

            lblAlergias.Text = (paciente.Alergias != null && paciente.Alergias.Count > 0)
                ? string.Join(", ", paciente.Alergias)
                : "Sin alergias";

            lblCondiciones.Text = (paciente.CondicionBase != null && paciente.CondicionBase.Count > 0)
                ? string.Join(", ", paciente.CondicionBase)
                : "Sin condiciones previas";

            TurnoNegocio negocio = new TurnoNegocio();
            DateTime? ultima = negocio.ObtenerUltimaConsulta(paciente.IdPaciente, medico.IdMedico);
            lblUltimaConsulta.Text = ultima.HasValue ? ultima.Value.ToString("dd/MM/yyyy") : "Sin registros";
        }

        private int CalcularEdad(DateTime nacimiento)
        {
            int edad = DateTime.Today.Year - nacimiento.Year;
            if (nacimiento > DateTime.Today.AddYears(-edad)) edad--;
            return edad;
        }

        private void CargarConsultas(int idPaciente, int idMedico)
        {
            TurnoNegocio negocio = new TurnoNegocio();
            gvConsultas.DataSource = negocio.ListarConsultasPorMedicoYPaciente(idMedico, idPaciente);
            gvConsultas.DataBind();
        }

        protected void btnNuevaConsulta_Click(object sender, EventArgs e)
        {
            Response.Redirect("NuevoRegistroMedico.aspx", false);
        }
    }
}
