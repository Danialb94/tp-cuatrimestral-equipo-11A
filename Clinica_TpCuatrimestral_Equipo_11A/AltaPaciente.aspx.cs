using dominio;
using negocio;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Clinica_TpCuatrimestral_Equipo_11A
{
    public partial class AltaPaciente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtNacimiento.Attributes["max"] = DateTime.Today.AddYears(-18).ToString("yyyy-MM-dd");
                CargarCoberturas();
                CargarTiposDocumento();
            }
        }


        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                Page.Validate();
                if (!Page.IsValid)
                    return;

                UsuarioNegocio usuarioNeg = new UsuarioNegocio();

                if (usuarioNeg.ExisteEmail(txtEmail.Text))
                {
                    lblError.Text = "El email ya está registrado. Por favor, use otro.";
                    lblError.Visible = true;
                    return;
                }

                DateTime fechaNacimiento;

                if (!DateTime.TryParse(txtNacimiento.Text, out fechaNacimiento))
                {
                    lblError.Text = "Por favor ingrese una fecha válida.";
                    lblError.Visible = true;
                    return;
                }

                int edad = DateTime.Today.Year - fechaNacimiento.Year;
                if (fechaNacimiento > DateTime.Today.AddYears(-edad)) edad--;

                if (edad < 18)
                {
                    lblError.Text = "Debe ser mayor de 18 años para registrarse.";
                    lblError.Visible = true;
                    return;
                }

                Paciente nuevo = new Paciente();
                nuevo.Nombre = txtNombre.Text;
                nuevo.Apellido = txtApellido.Text;
                nuevo.Domicilio = txtDireccion.Text;
                nuevo.Documento = txtDNI.Text;
                nuevo.FechaNacimiento = DateTime.Parse(txtNacimiento.Text);
                nuevo.Telefono = txtTelefono.Text;

                string claveTemporal = usuarioNeg.GenerarClaveTemporal();

                nuevo.Usuario = new Usuario();
                nuevo.Usuario.Email = txtEmail.Text;
                nuevo.Usuario.Contrasenia = claveTemporal;
                nuevo.Usuario.Permiso = new Permiso() { IdPermiso = 4 };

                nuevo.TipoDocumento = new TipoDocumento();
                nuevo.TipoDocumento.IdTipoDocumento = int.Parse(ddlTipoDocumento.SelectedValue);

                nuevo.Cobertura = new Cobertura();
                nuevo.Cobertura.IdCobertura = int.Parse(ddlCobertura.SelectedValue);

                RecepcionistaNegocio negocio = new RecepcionistaNegocio();
                negocio.altaPacienteRecepcionista(nuevo);

                EmailService emailService = new EmailService("programacionpruebamail@gmail.com", "wnzlnohczkdzlbas");
                emailService.EnviarClaveBienvenida(nuevo.Usuario.Email, nuevo.Nombre, nuevo.Apellido, claveTemporal);

                Response.Redirect("PacientesRecepcionista.aspx", false);
            }
            catch (Exception ex)
            {
                Session.Add("Error", ex);
                Response.Redirect("Error.aspx");
            }
        }


        protected void CargarCoberturas()
        {
            try
            {
                CoberturaNegocio coberturaNeg = new CoberturaNegocio();
                ddlCobertura.DataSource = coberturaNeg.listar();
                ddlCobertura.DataTextField = "Descripcion";
                ddlCobertura.DataValueField = "IdCobertura";
                ddlCobertura.DataBind();
            }
            catch (Exception ex)
            {

                Session.Add("Error", ex);
                Response.Redirect("Error.aspx");
            }
            
        }

        protected void CargarTiposDocumento()
        {
            try
            {
                TipoDocumentoNegocio tipoNeg = new TipoDocumentoNegocio();
                ddlTipoDocumento.DataSource = tipoNeg.listar();
                ddlTipoDocumento.DataTextField = "Descripcion";
                ddlTipoDocumento.DataValueField = "IdTipoDocumento";
                ddlTipoDocumento.DataBind();
            }
            catch (Exception ex)
            {
                Session.Add("Error", ex);
                Response.Redirect("Error.aspx");
            }
        }


    }
}