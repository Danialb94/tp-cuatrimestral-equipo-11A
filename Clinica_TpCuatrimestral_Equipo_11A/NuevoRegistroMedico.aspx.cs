using dominio;
using negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Clinica_TpCuatrimestral_Equipo_11A
{
    public partial class NuevoRegistroMedico : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["TurnoSeleccionado"] == null)
                {
                    Response.Redirect("PacienteMedico.aspx", false);
                    return;
                }

                string origen = Request.QueryString["origen"];

                if (origen == "inicio")
                {
                    btnVolverInicio.Visible = true;
                    btnCancelar.Visible = false;
                }
                else
                {
                    btnVolverInicio.Visible = false;
                    btnCancelar.Visible = true;
                }

                Turno turno = (Turno)Session["TurnoSeleccionado"];

                txtPaciente.Text = turno.Paciente.Nombre + " " + turno.Paciente.Apellido;
                txtFecha.Text = turno.FechaHora.ToString("yyyy-MM-dd");
                txtMotivo.Text = turno.Motivo ?? "-";
            }

        }

        protected void btnGuardarConsulta_Click(object sender, EventArgs e)
        {
            LimpiarErrores();
            bool valido = true;

            if (string.IsNullOrWhiteSpace(txtDiagnostico.Text))
            {
                txtDiagnostico.CssClass += " is-invalid";
                lblErrorDiagnostico.Text = "El diagnóstico es obligatorio.";
                valido = false;
            }
            else if (Regex.IsMatch(txtDiagnostico.Text.Trim(), @"^\d+$"))
            {
                txtDiagnostico.CssClass += " is-invalid";
                lblErrorDiagnostico.Text = "El diagnóstico no puede ser solo números.";
                valido = false;
            }

            if (string.IsNullOrWhiteSpace(txtTratamiento.Text))
            {
                txtTratamiento.CssClass += " is-invalid";
                lblErrorTratamiento.Text = "El tratamiento es obligatorio.";
                valido = false;
            }
            else if (Regex.IsMatch(txtTratamiento.Text.Trim(), @"^\d+$"))
            {
                txtTratamiento.CssClass += " is-invalid";
                lblErrorTratamiento.Text = "El tratamiento no puede ser solo números.";
                valido = false;
            }

            
            if (!string.IsNullOrWhiteSpace(txtObservacion.Text) &&
                Regex.IsMatch(txtObservacion.Text.Trim(), @"^\d+$"))
            {
                txtObservacion.CssClass += " is-invalid";
                lblErrorObservacion.Text = "La observación no puede ser solo números.";
                valido = false;
            }

            
            if (!valido)
                return;

            
            Turno turno = (Turno)Session["TurnoSeleccionado"];
            int idTurno = turno.IdTurno;

            RegistroClinico registro = new RegistroClinico
            {
                Diagnostico = txtDiagnostico.Text.Trim(),
                Observacion = string.IsNullOrWhiteSpace(txtObservacion.Text)
                                ? "Sin observaciones"
                                : txtObservacion.Text.Trim(),
                Tratamiento = txtTratamiento.Text.Trim()
            };

            TurnoNegocio negocio = new TurnoNegocio();
            negocio.AgregarConsulta(idTurno, registro);

            lblResultado.Text = "✅ La consulta fue registrada correctamente.";
            lblResultado.CssClass = "text-success fw-bold mt-3 d-block";
            lblResultado.Visible = true;

            
            
        }


        private void LimpiarErrores()
        {
            lblErrorDiagnostico.Text = "";
            lblErrorObservacion.Text = "";
            lblErrorTratamiento.Text = "";

            txtDiagnostico.CssClass = "form-control";
            txtObservacion.CssClass = "form-control";
            txtTratamiento.CssClass = "form-control";
        }

        protected void btnVolverInicio_Click(object sender, EventArgs e)
        {
            Response.Redirect("InicioMedico.aspx", false);
        }
    }
}
