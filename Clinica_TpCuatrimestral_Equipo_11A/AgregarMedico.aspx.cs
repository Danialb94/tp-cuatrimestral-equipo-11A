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

                ddlEspecialidades.Items.Insert(0, new ListItem("Seleccione especialidad", "0"));
            }
            catch (Exception ex)
            {
                // Mostrar mensaje de error amigable o loguearlo
                throw ex;
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            Medico nuevo = new Medico();
            nuevo.Nombre = txtNombre.Text;
            nuevo.Apellido = txtApellido.Text;
            nuevo.Telefono = txtTelefono.Text;
            nuevo.Matricula = txtMatricula.Text;
            nuevo.Usuario = new Usuario { Email = txtEmail.Text, Contrasenia = txtNombre.Text, Permiso = new Permiso { IdPermiso = 2 } };
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
            negocio.AgregarMedico(nuevo, diasSeleccionados, franjaHoraria);

            Response.Redirect("MedicosRecepcionista.aspx", false);
        }

    }
}