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
    public partial class SeguridadPaciente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                Paciente paciente = (Paciente)Session["Paciente"];
                if (paciente == null)
                {
                    return;
                }

               


                string actual = txtActualClave.Text;
                string nueva = txtNuevaClave.Text;
                string confirmar = txtConfirmarClave.Text;

                // Confirmación
                if (nueva != confirmar)
                {
                    lblErrorConfirmar.Text = "Las contraseñas no coinciden.";
                    return;
                }

                // Verificar la contraseña actual en la base de datos
                UsuarioNegocio negocio = new UsuarioNegocio();
                bool claveCorrecta = negocio.ValidarClave(paciente.IdUsuario, actual);

                if (!claveCorrecta)
                {
                    lblErrorActual.Text = "La contraseña actual es incorrecta.";
                    return;
                }

                //  Nueva validación: que la nueva no sea igual a la actual
                if (nueva == actual)
                {
                    lblErrorNueva.Text = "La nueva contraseña no puede ser igual a la actual.";
                    return;
                }

                // Actualizar la contraseña
                negocio.ActualizarClave(paciente.IdUsuario, nueva);



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