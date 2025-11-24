using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Clinica_TpCuatrimestral_Equipo_11A
{
    public partial class ConfirmarEmail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string codigoIngresado =
                txtCodigo1.Text +
                txtCodigo2.Text +
                txtCodigo3.Text +
                txtCodigo4.Text +
                txtCodigo5.Text +
                txtCodigo6.Text;

            
            string email = Session["emailRecuperar"]?.ToString();

            if (string.IsNullOrEmpty(email))
                return; 

            negocio.UsuarioNegocio negocio = new negocio.UsuarioNegocio();
            string claveGuardada = negocio.ObtenerContrasenia(email);

            if (codigoIngresado == claveGuardada)
            {
                lblError.Visible = false;

                Response.Redirect("~/ReestablecerPass.aspx");
            }
            else
            {
                lblError.Text = "El código ingresado es incorrecto.";
                lblError.CssClass = "text-danger text-center mt-2";
                lblError.Visible = true;


                txtCodigo1.Text = "";
                txtCodigo2.Text = "";
                txtCodigo3.Text = "";
                txtCodigo4.Text = "";
                txtCodigo5.Text = "";
                txtCodigo6.Text = "";

                txtCodigo1.Focus();

            }
        }

        protected void lnkReenviar_Click(object sender, EventArgs e)
        {
            string email = Session["emailRecuperar"]?.ToString();

            if (string.IsNullOrEmpty(email))
                return;

            negocio.UsuarioNegocio negocio = new negocio.UsuarioNegocio();

           
            negocio.AsignarClaveTemporal(email);

            lblError.Text = "Se envió un nuevo código a tu correo.";
            lblError.CssClass = "text-success text-center mt-2";
        }


    }
}