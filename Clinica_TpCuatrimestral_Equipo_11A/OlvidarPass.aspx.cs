using negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Clinica_TpCuatrimestral_Equipo_11A
{
    public partial class OlvidarPass : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
         
            lblError.Visible = false; 

            string emailIngresado = txtEmail.Text.Trim();

            if (string.IsNullOrEmpty(emailIngresado))
            {
                lblError.Text = "Por favor ingresá un correo electrónico.";
                lblError.Visible = true;
                return;
            }

            UsuarioNegocio negocio = new UsuarioNegocio();

           
            if (!negocio.ExisteEmail(emailIngresado))
            {
                lblError.Text = "El correo ingresado no está registrado.";
                lblError.Visible = true;
                return;
            }

            
            negocio.AsignarClaveTemporal(emailIngresado);

          
            Session["emailRecuperar"] = emailIngresado;

            Response.Redirect("~/ConfirmarEmail.aspx");
        }
    }


}
