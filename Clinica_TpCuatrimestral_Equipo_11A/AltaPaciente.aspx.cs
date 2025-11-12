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
    public partial class AltaPaciente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarCoberturas();
                CargarTiposDocumento();
            }
        }


        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                Paciente nuevo = new Paciente();
                nuevo.Nombre = txtNombre.Text;
                nuevo.Apellido = txtApellido.Text;
                nuevo.Domicilio = txtDireccion.Text;
                nuevo.Documento = txtDNI.Text;
                nuevo.FechaNacimiento = DateTime.Parse(txtNacimiento.Text);
                nuevo.Telefono = txtTelefono.Text;

                nuevo.Usuario = new Usuario();
                nuevo.Usuario.Email = txtEmail.Text;
                nuevo.Usuario.Contrasenia = "1234";
                nuevo.Usuario.Permiso = new Permiso() { IdPermiso = 4 };

                nuevo.TipoDocumento = new TipoDocumento();
                nuevo.TipoDocumento.IdTipoDocumento = int.Parse(ddlTipoDocumento.SelectedValue);

                nuevo.Cobertura = new Cobertura();
                nuevo.Cobertura.IdCobertura = int.Parse(ddlCobertura.SelectedValue);

                RecepcionistaNegocio negocio = new RecepcionistaNegocio();
                negocio.altaPacienteRecepcionista(nuevo);

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