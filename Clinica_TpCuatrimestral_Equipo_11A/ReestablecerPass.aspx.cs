using negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Clinica_TpCuatrimestral_Equipo_11A
{
    public partial class ReestablecerPass : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
           
            lblError.Visible = false;

            string pass1 = txtNewPassword.Text.Trim();
            string pass2 = txtConfirmPassword.Text.Trim();

            if (string.IsNullOrEmpty(pass1) || string.IsNullOrEmpty(pass2))
            {
                lblError.Text = "Debes completar ambos campos de contraseña.";
                lblError.CssClass = "text-danger text-center mt-2";
                lblError.Visible = true;
                return;
            }

          
            if (pass1 != pass2)
            {
                lblError.Text = "Las contraseñas no coinciden.";
                lblError.CssClass = "text-danger text-center mt-2";
                lblError.Visible = true;
                return;
            }

            
            bool cumple =
                pass1.Length >= 8 &&
                pass1.Any(char.IsDigit) &&
                pass1.Any(char.IsUpper) &&
                pass1.Any(ch => !char.IsLetterOrDigit(ch));

            if (!cumple)
            {
                lblError.Text = "La contraseña no cumple con los requisitos.";
                lblError.CssClass = "text-danger text-center mt-2";
                lblError.Visible = true;
                return;
            }

            string email = Session["emailRecuperar"]?.ToString();
            if (email == null)
            {
                lblError.Text = "Ocurrió un error: sesión expirada.";
                lblError.CssClass = "text-danger text-center mt-2";
                lblError.Visible = true;
                return;
            }

         
            UsuarioNegocio negocio = new UsuarioNegocio();
            negocio.CambiarContrasenia(email, pass1);

            
            Response.Redirect("~/Default.aspx");
        }
    }
}