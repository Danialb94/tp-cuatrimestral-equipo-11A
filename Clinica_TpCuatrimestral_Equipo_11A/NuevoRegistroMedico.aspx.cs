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
    public partial class NuevoRegistroMedico : System.Web.UI.Page
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
                Paciente paciente = (Paciente)Session["PacienteSeleccionado"];
                txtPaciente.Text = paciente.Nombre + " " + paciente.Apellido;
                txtFecha.Text = DateTime.Now.ToString("yyyy-MM-dd");
            }
        }

        protected void btnGuardarConsulta_Click(object sender, EventArgs e)
        {
            try
            {
                Medico medico = (Medico)Session["Medico"];
                Paciente paciente = (Paciente)Session["PacienteSeleccionado"];
                DateTime fecha = DateTime.Parse(txtFecha.Text);

                TurnoNegocio negocio = new TurnoNegocio();
                int idTurno = negocio.ObtenerTurnoDelDia(medico.IdMedico, paciente.IdPaciente, fecha);

                if (idTurno == 0)
                {
                    Response.Write("<script>alert('⚠️ No hay un turno asignado para esa fecha.');</script>");
                    return;
                }

                RegistroClinico registro = new RegistroClinico
                {
                    Diagnostico = txtDiagnostico.Text,
                    Observacion = txtObservacion.Text,
                    Tratamiento = null 
                };

                negocio.AgregarConsulta(idTurno, registro);

                Response.Redirect("RegistroConsultaMedico.aspx", false);
            }
            catch (Exception)
            {
                Response.Write("<script>alert('Error al guardar la consulta.');</script>");
            }
        }
    }
}
