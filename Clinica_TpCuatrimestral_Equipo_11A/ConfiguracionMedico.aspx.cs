using System;
using System.Collections.Generic;
using System.Text.RegularExpressions;
using System.Web.UI.WebControls;
using dominio;
using negocio;

namespace Clinica_TpCuatrimestral_Equipo_11A
{
    public partial class ConfiguracionMedico : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                CargarDatosMedico();
        }

        private void CargarDatosMedico()
        {
            try
            {
                Medico medico = (Medico)Session["Medico"];
                if (medico == null)
                {
                    lblMensajeGeneral.Text = "No se encontró la sesión del médico. Vuelva a iniciar sesión.";
                    lblMensajeGeneral.CssClass = "text-danger";
                    return;
                }

                txtNombre.Text = medico.Nombre;
                txtApellido.Text = medico.Apellido;
                txtFoto.Text = medico.Imagen != null ? medico.Imagen.UrlImagen : "";
                txtTelefono.Text = medico.Telefono;
                txtCorreo.Text = medico.Email;
                lblMatricula.Text = medico.Matricula;

                MedicoNegocio negocio = new MedicoNegocio();
                var especialidades = negocio.ListarEspecialidadesPorMedico(medico.IdMedico);
                repEspecialidades.DataSource = especialidades;
                repEspecialidades.DataBind();
            }
            catch (Exception ex)
            {
                lblMensajeGeneral.Text = "Error al cargar los datos: " + ex.Message;
                lblMensajeGeneral.CssClass = "text-danger";
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            LimpiarErrores();

            try
            {
                Medico medico = (Medico)Session["Medico"];
                if (medico == null)
                {
                    lblMensajeGeneral.Text = "Error: sesión expirada.";
                    lblMensajeGeneral.CssClass = "text-danger";
                    return;
                }

                bool valido = true;

                // Validar nombre (solo letras y espacios, no vacío)
                if (string.IsNullOrWhiteSpace(txtNombre.Text))
                {
                    txtNombre.CssClass += " is-invalid";
                    lblErrorNombre.Text = "El nombre es obligatorio.";
                    valido = false;
                }
                else if (!Regex.IsMatch(txtNombre.Text.Trim(), @"^[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]+$"))
                {
                    txtNombre.CssClass += " is-invalid";
                    lblErrorNombre.Text = "Ingrese solo letras en el nombre.";
                    valido = false;
                }

                // Validar apellido
                if (string.IsNullOrWhiteSpace(txtApellido.Text))
                {
                    txtApellido.CssClass += " is-invalid";
                    lblErrorApellido.Text = "El apellido es obligatorio.";
                    valido = false;
                }
                else if (!Regex.IsMatch(txtApellido.Text.Trim(), @"^[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]+$"))
                {
                    txtApellido.CssClass += " is-invalid";
                    lblErrorApellido.Text = "Ingrese solo letras en el apellido.";
                    valido = false;
                }

                // Validar correo
                if (!Regex.IsMatch(txtCorreo.Text.Trim(), @"^[^@\s]+@[^@\s]+\.[^@\s]+$"))
                {
                    txtCorreo.CssClass += " is-invalid";
                    lblErrorCorreo.Text = "Ingrese un correo electrónico válido.";
                    valido = false;
                }

                // Validar teléfono
                if (!Regex.IsMatch(txtTelefono.Text.Trim(), @"^[0-9]{8,12}$"))
                {
                    txtTelefono.CssClass += " is-invalid";
                    lblErrorTelefono.Text = "Ingrese un teléfono válido (solo números, 8 a 12 dígitos).";
                    valido = false;
                }

                if (!valido)
                    return;

                bool sinCambios =
                    medico.Nombre == txtNombre.Text.Trim() &&
                    medico.Apellido == txtApellido.Text.Trim() &&
                    medico.Telefono == txtTelefono.Text.Trim() &&
                    medico.Email == txtCorreo.Text.Trim() &&
                    ((medico.Imagen == null && string.IsNullOrWhiteSpace(txtFoto.Text)) ||
                    (medico.Imagen != null && medico.Imagen.UrlImagen == txtFoto.Text.Trim()));

                if (sinCambios)
                {
                    lblMensajeGeneral.Text = "⚠ No se detectaron cambios. La información permanece igual.";
                    lblMensajeGeneral.CssClass = "text-secondary fw-semibold";
                    return;
                }

                // Actualiza los datos
                medico.Nombre = txtNombre.Text.Trim();
                medico.Apellido = txtApellido.Text.Trim();
                medico.Telefono = txtTelefono.Text.Trim();
                medico.Email = txtCorreo.Text.Trim();



                string nuevaFoto = txtFoto.Text.Trim();

                if (string.IsNullOrEmpty(nuevaFoto))
                {

                    medico.Imagen = null;
                }
                else
                {

                    if (medico.Imagen == null)
                        medico.Imagen = new Imagen();

                    medico.Imagen.UrlImagen = nuevaFoto;
                }

                MedicoNegocio negocio = new MedicoNegocio();
                negocio.ActualizarDatosBasicos(medico);
                negocio.ActualizarFoto(medico);
                Session["Medico"] = medico;

                lblMensajeGeneral.Text = "Los datos se actualizaron correctamente.";
                lblMensajeGeneral.CssClass = "text-success";
            }
            catch (Exception ex)
            {
                lblMensajeGeneral.Text = "Error al guardar los cambios: " + ex.Message;
                lblMensajeGeneral.CssClass = "text-danger";
            }
        }

        private void LimpiarErrores()
        {
            lblErrorNombre.Text = lblErrorApellido.Text = lblErrorCorreo.Text = lblErrorTelefono.Text = "";
            txtNombre.CssClass = txtApellido.CssClass = txtCorreo.CssClass = txtTelefono.CssClass = "form-control";
        }
    }
}
