using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using negocio;
using dominio;


namespace Clinica_TpCuatrimestral_Equipo_11A
{
    public partial class DetalleTurnoMedico : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["IdTurnoSeleccionado"] == null)
                {
                    Response.Redirect("InicioMedico.aspx");
                    return;
                }

                int idTurno = (int)Session["IdTurnoSeleccionado"];

                TurnoNegocio negocio = new TurnoNegocio();
                var turno = negocio.ObtenerPorId(idTurno);

                lblPaciente.Text = turno.Paciente.Nombre + " " + turno.Paciente.Apellido;
                lblFechaHora.Text = turno.FechaHora.ToString("dd/MM/yyyy HH:mm");
                lblMotivo.Text = turno.Motivo;
                lblEstado.Text = turno.Estado;

                
            }
        }


    }
}