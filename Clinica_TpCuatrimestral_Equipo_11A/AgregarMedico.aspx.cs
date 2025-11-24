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

                lstEspecialidades.DataSource = lista;
                lstEspecialidades.DataTextField = "Descripcion";
                lstEspecialidades.DataValueField = "IdEspecialidad";
                lstEspecialidades.DataBind();
            }
            catch (Exception ex)
            {
                Session.Add("Error", ex);
                Response.Redirect("Error.aspx", false);
            }
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
        new Especialidad { IdEspecialidad = int.Parse(lstEspecialidades.SelectedValue) }
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

            foreach (ListItem item in lstEspecialidades.Items)
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
            negocio.AgregarMedico(nuevo, diasSeleccionados, franjaHoraria);


            EmailService emailService = new EmailService("programacionpruebamail@gmail.com", "wnzlnohczkdzlbas");
            emailService.EnviarClaveBienvenidaMedico(nuevo.Usuario.Email, nuevo.Nombre, nuevo.Apellido, claveTemporal);

            Response.Redirect("MedicosRecepcionista.aspx", false);
        }

    }
}