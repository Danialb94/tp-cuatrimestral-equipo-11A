using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using dominio;
using negocio;

namespace Clinica_TpCuatrimestral_Equipo_11A
{
    public partial class PacienteMedico : System.Web.UI.Page
    {
        private static List<Paciente> listaPacientes = new List<Paciente>();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                CargarPacientes();
        }

        private void CargarPacientes()
        {
            var medico = Session["Medico"] as Medico;
            if (medico == null)
            {
                Response.Redirect("Default.aspx");
                return;
            }

            PacienteNegocio negocio = new PacienteNegocio();
            listaPacientes = negocio.ListarPorMedico(medico.IdMedico);

            listaPacientes = listaPacientes
                .OrderBy(p => p.Nombre)
                .ThenBy(p => p.Apellido)
                .ToList();

            gvPacientes.DataSource = listaPacientes;
            gvPacientes.DataBind();

            lblTotalPacientes.Text = listaPacientes.Count.ToString();
        }


        protected void txtBuscar_TextChanged(object sender, EventArgs e)
        {
            string texto = txtBuscar.Text.Trim().ToLower();

            List<Paciente> filtrados = listaPacientes
                .Where(p => p.Nombre.ToLower().Contains(texto)
                         || p.Apellido.ToLower().Contains(texto))
                .ToList();

            gvPacientes.DataSource = filtrados;
            gvPacientes.DataBind();
        }

        protected void btnLimpiar_Click(object sender, EventArgs e)
        {
            txtBuscar.Text = "";
            CargarPacientes();
        }

        protected void btnVerHistorial_Click(object sender, EventArgs e)
        {
            int idPaciente = int.Parse(((LinkButton)sender).CommandArgument);

            Paciente seleccionado = listaPacientes.FirstOrDefault(p => p.IdPaciente == idPaciente);

            if (seleccionado != null)
            {
                Session["PacienteSeleccionado"] = seleccionado;

                Response.Redirect("RegistroConsultaMedico.aspx", false);
            }
        }
    }
}
