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
    public partial class MasterPaciente : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Usuario usuario = (Usuario)Session["usuario"];
            if (!Seguridad.sesionActiva(usuario) ||
                !(Seguridad.esPaciente(usuario) || Seguridad.esAdministrador(usuario)))
            {
                Session.Add("Error", "No tenés permisos para ver esta página");
                Response.Redirect("Error.aspx", false);
            }
            if (!IsPostBack)
            {
                Paciente paciente = new Paciente();
                paciente = (Paciente)Session["Paciente"];

                if (paciente == null)
                {
                    Response.Redirect("Default.aspx");
                }
                if(paciente.Nombre!=null && paciente.Apellido != null)
                {
                    lblNombrePaciente.Text = paciente.Apellido + ", " + paciente.Nombre;
                }
                if (paciente.Imagen != null && !string.IsNullOrEmpty(paciente.Imagen.UrlImagen))
                    imgPerfil.ImageUrl = paciente.Imagen.UrlImagen;
            }
        }
    }
}