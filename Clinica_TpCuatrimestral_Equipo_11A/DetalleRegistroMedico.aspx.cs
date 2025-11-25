using dominio;
using negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Clinica_TpCuatrimestral_Equipo_11A
{
    public partial class DetalleRegistroMedico : System.Web.UI.Page
    {
        private int idTurno;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Medico"] == null) Response.Redirect("Default.aspx");

            if (!IsPostBack)
            {
                if (Request.QueryString["id"] == null)
                {
                    Response.Redirect("RegistroConsultaMedico.aspx", false);
                    return;
                }

                idTurno = int.Parse(Request.QueryString["id"]);
                CargarDatos(idTurno);

                // Si viene en modo edición
                if (Request.QueryString["modo"] == "editar")
                    HabilitarEdicion(true);
            }
        }

        private void CargarDatos(int idTurno)
        {
            TurnoNegocio negocio = new TurnoNegocio();
            Turno turno = negocio.ObtenerPorId(idTurno);
            if (turno == null)
            {
                Response.Write("<script>alert('⚠️ No se encontró el turno.');</script>");
                return;
            }

            if (turno.Paciente == null)
            {
                Response.Write("<script>alert('⚠️ No se encontró el paciente asociado a este turno.');</script>");
                return;
            }
            txtPaciente.Text = turno.Paciente.Nombre + " " + turno.Paciente.Apellido;
            txtFecha.Text = turno.FechaHora.ToString("yyyy-MM-dd");
            txtMotivo.Text = turno.Motivo;
            RegistroClinico registro = negocio.ObtenerRegistroPorTurno(idTurno);

            if (registro != null)
            {
                txtDiagnostico.Text = registro.Diagnostico;
                txtObservacion.Text = registro.Observacion;
                txtTratamiento.Text = registro.Tratamiento;

                hfIdRegistro.Value = registro.IdRegistro.ToString();  
            }

        }
        protected void btnEditar_Click(object sender, EventArgs e)
        {
            HabilitarEdicion(true);
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                int idRegistro = int.Parse(hfIdRegistro.Value);

                TurnoNegocio negocio = new TurnoNegocio();

                RegistroClinico registro = new RegistroClinico
                {
                    Diagnostico = txtDiagnostico.Text,
                    Observacion = txtObservacion.Text,
                    Tratamiento = txtTratamiento.Text
                };

                negocio.ActualizarRegistroClinico(idRegistro, registro);

                Response.Redirect("RegistroConsultaMedico.aspx", false);
            }
            catch
            {
                Response.Write("<script>alert('Error al guardar los cambios.');</script>");
            }
        }


        private void HabilitarEdicion(bool habilitar)
        {
            txtDiagnostico.ReadOnly = !habilitar;
            txtObservacion.ReadOnly = !habilitar;
            txtTratamiento.ReadOnly = !habilitar;
            btnGuardar.Visible = habilitar;
            btnEditar.Visible = !habilitar;
        }
    }
}