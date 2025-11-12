using dominio;
using negocio;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Clinica_TpCuatrimestral_Equipo_11A
{
    public partial class PacientesRecepcionista : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                cargarPacientes();
        }

        private void cargarPacientes()
        {
            RecepcionistaNegocio negocio = new RecepcionistaNegocio();
            List<Paciente> lista = negocio.listarPacientesRecepcionista();

            Session["listaPacientes"] = lista; 

            dgvPacientesRecepcionista.DataSource = lista;
            dgvPacientesRecepcionista.DataBind();
        }


        protected void dgvPacientesRecepcionista_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "SolicitarTurno")
            {
                int idPaciente = Convert.ToInt32(e.CommandArgument);
                Response.Redirect("SolicitarTurnoRecepcionista.aspx?idPaciente=" + idPaciente);

            }
        }



        protected void txtFiltroPaciente_TextChanged(object sender, EventArgs e)
        {
            List<Paciente> lista = (List<Paciente>)Session["listaPacientes"];
            if (lista == null)
                return;

            string filtro = txtFiltroPaciente.Text.ToUpper();

            List<Paciente> listaFiltrada = lista.FindAll(x =>
                (x.Nombre != null && x.Nombre.ToUpper().Contains(filtro)) ||
                (x.Apellido != null && x.Apellido.ToUpper().Contains(filtro)) ||
                (x.Documento != null && x.Documento.ToString().Contains(filtro)));

            dgvPacientesRecepcionista.DataSource = listaFiltrada;
            dgvPacientesRecepcionista.DataBind();
        }

    }
}