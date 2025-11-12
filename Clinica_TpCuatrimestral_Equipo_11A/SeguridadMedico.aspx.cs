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
    public partial class SeguridadMedico : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            // Limpia errores anteriores
            lblErrorActual.Text = lblErrorNueva.Text = lblErrorConfirmar.Text = "";
            lblMensajeGeneral.Text = "";

            try
            {
                Medico medico = (Medico)Session["Medico"];
                if (medico == null)
                {
                    lblMensajeGeneral.Text = "Error: sesión expirada. Vuelva a iniciar sesión.";
                    lblMensajeGeneral.CssClass = "text-danger";
                    return;
                }

                string actual = txtActualClave.Text.Trim();
                string nueva = txtNuevaClave.Text.Trim();
                string confirmar = txtConfirmarClave.Text.Trim();

                bool valido = true;

                // Valida que la actual no esté vacía
                if (string.IsNullOrEmpty(actual))
                {
                    lblErrorActual.Text = "Ingrese su contraseña actual.";
                    valido = false;
                }

                // Valida que la nueva cumpla reglas básicas
                if (string.IsNullOrEmpty(nueva))
                {
                    lblErrorNueva.Text = "Ingrese una nueva contraseña.";
                    valido = false;
                }
                else if (nueva.Length < 8 ||
                         !Regex.IsMatch(nueva, @"[A-Z]") ||
                         !Regex.IsMatch(nueva, @"[a-z]") ||
                         !Regex.IsMatch(nueva, @"\d"))
                {
                    lblErrorNueva.Text = "Debe tener al menos 8 caracteres, una mayúscula, una minúscula y un número.";
                    valido = false;
                }

                // Confirmación
                if (nueva != confirmar)
                {
                    lblErrorConfirmar.Text = "Las contraseñas no coinciden.";
                    valido = false;
                }

                if (!valido) return;

                // Verifica la contraseña actual en la base de datos
                UsuarioNegocio negocio = new UsuarioNegocio();
                bool claveCorrecta = negocio.ValidarClave(medico.IdUsuario, actual);

                if (!claveCorrecta)
                {
                    lblErrorActual.Text = "La contraseña actual es incorrecta.";
                    return;
                }

                // Nueva validación: que la nueva no sea igual a la actual
                if (nueva == actual)
                {
                    lblErrorNueva.Text = "La nueva contraseña no puede ser igual a la actual.";
                    return;
                }

                // Actualiza la contraseña
                negocio.ActualizarClave(medico.IdUsuario, nueva);

                lblMensajeGeneral.Text = "Contraseña actualizada correctamente.";
                lblMensajeGeneral.CssClass = "text-success";
            }
            catch (Exception ex)
            {
                lblMensajeGeneral.Text = "Error al actualizar la contraseña: " + ex.Message;
                lblMensajeGeneral.CssClass = "text-danger";
            }
        }
    }
}
