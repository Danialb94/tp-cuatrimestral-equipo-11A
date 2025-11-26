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
    public partial class InformeRegistroMedico : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] == null)
                    return;

                int idTurno;
                if (!int.TryParse(Request.QueryString["id"], out idTurno))
                    return;

                CargarInforme(idTurno);
            }
        }

        private void CargarInforme(int idTurno)
        {
            TurnoNegocio negocio = new TurnoNegocio();
            Turno turno = negocio.ObtenerDatosCompletosDelTurno(idTurno);


            if (turno.Medico != null)
            {
                lblMedico.Text = turno.Medico.Nombre + " " + turno.Medico.Apellido;
                lblMatricula.Text = turno.Medico.Matricula;
            }

            if (turno.Especialidad != null)
            {
                lblEspecialidad.Text = turno.Especialidad.Descripcion;
            }

            if (turno == null) return;

            lblPaciente.Text = turno.Paciente.Nombre + " " + turno.Paciente.Apellido;
            lblFecha.Text = turno.FechaHora.ToString("dd/MM/yyyy");
            lblMotivo.Text = turno.Motivo ?? "-";

            RegistroClinico registro = negocio.ObtenerRegistroPorTurno(idTurno);

            if (registro != null)
            {
                lblDiagnostico.Text = registro.Diagnostico;
                lblObservacion.Text = registro.Observacion;
                lblTratamiento.Text = registro.Tratamiento;
            }

            // Firma del médico
            Medico medico = (Medico)Session["Medico"];
            if (medico != null)
                lblMedicoNombre.Text = medico.Nombre + " " + medico.Apellido;
        }
    }
}
