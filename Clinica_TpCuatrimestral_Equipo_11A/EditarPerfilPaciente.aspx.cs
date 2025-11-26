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
    public partial class EditarPerfilPaciente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarPaciente();
            }

        }
        public void CargarPaciente()
        {
            try
            {
                Paciente paciente = (Paciente)Session["Paciente"];
                if (paciente == null)
                {
                    return;
                }

                txtNombreCompleto.Text = paciente.Nombre + " " + paciente.Apellido;
                txtTipoDocu.Text = paciente.TipoDocumento.Descripcion;
                txtDNI.Text = paciente.Documento;
                txtNacimiento.Text = paciente.FechaNacimiento.ToString("dd/MM/yyyy");
                txtDireccion.Text = paciente.Domicilio;
                txtEmail.Text = paciente.Usuario.Email;
                txtTelefono.Text = paciente.Telefono;
                txtCobertura.Text = paciente.Cobertura.Descripcion;
                txtFoto.Text = paciente.Imagen.UrlImagen;

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public void btnEditar_Click(object sender, EventArgs e)
        {
            UsuarioNegocio neg = new UsuarioNegocio();
            try
            {
                Paciente paciente = (Paciente)Session["Paciente"];
                if (paciente == null)
                {
                    return;
                }
                if (neg.ExisteEmail(txtEmail.Text))
                {
                    return;
                }

                paciente.Domicilio = txtDireccion.Text;
                paciente.Usuario.Email = txtEmail.Text;
                paciente.Telefono = txtTelefono.Text;
                paciente.Imagen.UrlImagen = txtFoto.Text;

                PacienteNegocio negocio = new PacienteNegocio();
                negocio.Modificar(paciente);
                Session["Paciente"] = paciente;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


    }
}