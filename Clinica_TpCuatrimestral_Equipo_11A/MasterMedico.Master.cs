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
    public partial class MasterMedico : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Medico medico = (Medico)Session["Medico"];

                if (medico == null)
                {
                    Response.Redirect("Default.aspx");
                    return;
                }

                lblNombreMedico.Text = medico.Nombre + " " + medico.Apellido;
                lblMatricula.Text = medico.Matricula;

                if (medico.Especialidades != null && medico.Especialidades.Count > 0)
                {
                    // Mostrar todas las especialidades del médico (una o varias)
                    lblEspecialidad.Text = string.Join(", ", medico.Especialidades.Select(esp => esp.Descripcion));
                }
                else
                {
                    lblEspecialidad.Text = "Sin especialidad";
                }

                if (medico.Imagen != null && !string.IsNullOrEmpty(medico.Imagen.UrlImagen))
                    imgPerfil.ImageUrl = medico.Imagen.UrlImagen;
                else
                    imgPerfil.ImageUrl = "~/Imagenes/Perfil_Placeholder.png";
            }
        }
    }
}