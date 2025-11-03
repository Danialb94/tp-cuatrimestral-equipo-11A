using System;
using System.Web.UI;
using dominio;
using negocio;
namespace Clinica_TpCuatrimestral_Equipo_11A
{
    public partial class Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Usuario usuario;
            UsuarioNegocio negocio = new UsuarioNegocio();

            try
            {
                usuario = new Usuario(txtEmail.Text, txtPassword.Text);
                if (negocio.Loguear(usuario))
                {
                    Session.Add("usuario", usuario);
                    if (Session["usuario"] != null && ((dominio.Usuario)Session["usuario"]).TipoUsuario == dominio.TipoUsuario.PACIENTE)
                    {
                        Response.Redirect("InicioPaciente.aspx", false);
                    }
                    else if (Session["usuario"] != null && ((dominio.Usuario)Session["usuario"]).TipoUsuario == dominio.TipoUsuario.RECEPCIONISTA)
                    {
                        Response.Redirect("InicioRecepcionista.aspx", false);
                    }
                    else if (Session["usuario"] != null && ((dominio.Usuario)Session["usuario"]).TipoUsuario == dominio.TipoUsuario.MEDICO)
                    {
                        Response.Redirect("InicioMedico.aspx", false);
                    }
                    else if (Session["usuario"] != null && ((dominio.Usuario)Session["usuario"]).TipoUsuario == dominio.TipoUsuario.ADMIN)
                    {
                        Response.Redirect("InicioRecepcionista.aspx", false);
                    }
                    else
                    {
                        Session.Add("Error", "Usuario o contraseña incorrectos");
                        Response.Redirect("Error.aspx", false);
                    }
                }
            }
            catch (Exception ex)
            {
                Session.Add("Error", ex.ToString());
                Response.Redirect("Error.aspx", false);

            }
           
        }
    }
}
