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
    public partial class AgregarMedico : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarEspecialidades();

            }
        }

        private void CargarEspecialidades()
        {
            try
            {
                EspecialidadNegocio negocio = new EspecialidadNegocio();
                List<Especialidad> lista = negocio.listar();

                ddlEspecialidades.DataSource = lista;
                ddlEspecialidades.DataTextField = "Descripcion";
                ddlEspecialidades.DataValueField = "IdEspecialidad";
                ddlEspecialidades.DataBind();
            }
            catch (Exception ex)
            {
                Session.Add("Error", ex);
                Response.Redirect("Error.aspx", false);
            }
        }

        private void ActualizarLabel()
        {
            var lista = Session["Configuraciones"] as List<EspecialidadHorario>;

            if (lista == null || lista.Count == 0)
            {
                lblResumenEspecialidades.Visible = false;
                return;
            }

            lblResumenEspecialidades.Visible = true;
            lblResumenEspecialidades.Text = "Especialidades cargadas:<br/>";

            foreach (var item in lista)
            {
                string dias = string.Join(", ", item.Dias);
                string franjas = string.Join(" | ", item.FranjasHorarias);

                lblResumenEspecialidades.Text +=
                    $"- {item.Especialidad.Descripcion} → {dias} | {franjas}<br/>";
            }
        }

        protected void btnAgregarEspecialidad_Click(object sender, EventArgs e)
        {
            List<string> diasSeleccionados = new List<string>();
            if (chkLunes.Checked) diasSeleccionados.Add("Lunes");
            if (chkMartes.Checked) diasSeleccionados.Add("Martes");
            if (chkMiercoles.Checked) diasSeleccionados.Add("Miércoles");
            if (chkJueves.Checked) diasSeleccionados.Add("Jueves");
            if (chkViernes.Checked) diasSeleccionados.Add("Viernes");

            string franja = txtFranjaHoraria.Text;

            EspecialidadHorario config = new EspecialidadHorario
            {
                Especialidad = new Especialidad
                {
                    IdEspecialidad = int.Parse(ddlEspecialidades.SelectedValue),
                    Descripcion = ddlEspecialidades.SelectedItem.Text
                },
                Dias = diasSeleccionados,
                FranjasHorarias = new List<string> { franja }
            };

            // Guardar en Session
            List<EspecialidadHorario> lista;
            if (Session["Configuraciones"] == null)
                lista = new List<EspecialidadHorario>();
            else
                lista = (List<EspecialidadHorario>)Session["Configuraciones"];

            lista.Add(config);
            Session["Configuraciones"] = lista;

            // Limpiar campos visualmente
            txtFranjaHoraria.Text = "";
            chkLunes.Checked = chkMartes.Checked = chkMiercoles.Checked = chkJueves.Checked = chkViernes.Checked = false;

            ActualizarLabel();
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {

            Page.Validate();
            if (!Page.IsValid)
                return;

            UsuarioNegocio usuarioNeg = new UsuarioNegocio();

            Medico nuevo = new Medico();
            nuevo.Nombre = txtNombre.Text;
            nuevo.Apellido = txtApellido.Text;
            nuevo.Telefono = txtTelefono.Text;
            nuevo.Matricula = txtMatricula.Text;

            string claveTemporal = usuarioNeg.GenerarClaveTemporal();

            nuevo.Usuario = new Usuario();
            nuevo.Usuario.Email = txtEmail.Text;
            nuevo.Usuario.Contrasenia = claveTemporal;
            nuevo.Usuario.Permiso = new Permiso() { IdPermiso = 2 };
            nuevo.Especialidades = new List<Especialidad> {
        new Especialidad { IdEspecialidad = int.Parse(ddlEspecialidades.SelectedValue) }
    };

            List<string> diasSeleccionados = new List<string>();
            if (chkLunes.Checked) diasSeleccionados.Add("Lunes");
            if (chkMartes.Checked) diasSeleccionados.Add("Martes");
            if (chkMiercoles.Checked) diasSeleccionados.Add("Miércoles");
            if (chkJueves.Checked) diasSeleccionados.Add("Jueves");
            if (chkViernes.Checked) diasSeleccionados.Add("Viernes");

            string franjaHoraria = txtFranjaHoraria.Text;

            RecepcionistaNegocio negocio = new RecepcionistaNegocio();
            nuevo.Especialidades = new List<Especialidad>();

            foreach (ListItem item in ddlEspecialidades.Items)
            {
                if (item.Selected)
                {
                    nuevo.Especialidades.Add(new Especialidad
                    {
                        IdEspecialidad = int.Parse(item.Value),
                        Descripcion = item.Text
                    });
                }
            }
            List<EspecialidadHorario> configuraciones = (List<EspecialidadHorario>)Session["Configuraciones"];
            negocio.AgregarMedico(nuevo, configuraciones);



            EmailService emailService = new EmailService("programacionpruebamail@gmail.com", "wnzlnohczkdzlbas");
            emailService.EnviarClaveBienvenidaMedico(nuevo.Usuario.Email, nuevo.Nombre, nuevo.Apellido, claveTemporal);

            Response.Redirect("MedicosRecepcionista.aspx", false);
        }

    }
}