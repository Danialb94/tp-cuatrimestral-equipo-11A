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
    public partial class SolicitarTurnoRecepcionista : System.Web.UI.Page
    {
        List<string> listaEspecialidades { get; set; }
        List<Medico> listaMedicos;
        public string FechaSeleccionada { get; set; }
        public string HoraSeleccionada { get; set; }
        public string DiaSeleccionado { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            EspecialidadNegocio negocioEsp = new EspecialidadNegocio();
            MedicoNegocio negocioMed = new MedicoNegocio();
            try
            {
                if (!IsPostBack)
                {
                    //CARGA DDL ESPECIALIDADES
                    listaEspecialidades = negocioEsp.listarDescripcion();
                    ddlEspecialidades.DataSource = listaEspecialidades;
                    ddlEspecialidades.DataBind();

                    //CARGA DDL MEDICOS
                    Session["ListaMedicosCompleta"] = negocioMed.ListarMedicos();
                    listaMedicos = (List<Medico>)Session["ListaMedicosCompleta"];
                    ddlProfesionales.DataSource = listaMedicos;
                    ddlProfesionales.DataTextField = "NombreCompleto";
                    ddlProfesionales.DataValueField = "IdMedico";
                    ddlProfesionales.DataBind();

                    ItemsporDefectoEsp();
                    ItemsporDefectoProf();
                    txtFecha.Text = DateTime.Now.ToString("dd/MM/yyyy");

                    visualInicio();

                }
                else
                {
                    if (ViewState["FechaSeleccionada"] != null)
                    {
                        FechaSeleccionada = ViewState["FechaSeleccionada"].ToString();
                        HoraSeleccionada = ViewState["HoraSeleccionada"].ToString();
                        DiaSeleccionado = ViewState["DiaSeleccionado"].ToString();
                    }
                }
            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
            }
        }
        protected void ItemsporDefectoEsp()
        {
            ListItem itemEspecialidadDefecto = new ListItem();
            itemEspecialidadDefecto.Text = "Seleccionar la especialidad";
            itemEspecialidadDefecto.Value = "0";
            itemEspecialidadDefecto.Attributes.Add("disabled", "disabled");
            itemEspecialidadDefecto.Selected = true; // El atributo "Selected" asegura que aparezca por defecto
            ddlEspecialidades.Items.Insert(0, itemEspecialidadDefecto);
        }
        protected void ItemsporDefectoProf()
        {
            ListItem itemProfesionalDefecto = new ListItem();
            itemProfesionalDefecto.Text = "Seleccionar al profesional";
            itemProfesionalDefecto.Value = "0";
            itemProfesionalDefecto.Attributes.Add("disabled", "disabled");
            itemProfesionalDefecto.Selected = true; // El atributo "Selected" asegura que aparezca por defecto
            ddlProfesionales.Items.Insert(0, itemProfesionalDefecto);
        }

        protected void ddlEspecialidades_SelectedIndexChanged(object sender, EventArgs e)
        {
            cargaProfesionales();
        }

        private void cargaProfesionales()
        {
            List<Medico> listaFiltrada = (List<Medico>)Session["ListaMedicosCompleta"];
            string especialidadSeleccionada = ddlEspecialidades.SelectedValue;
            if (!string.IsNullOrEmpty(especialidadSeleccionada) && especialidadSeleccionada != "")
            {
                listaFiltrada = listaFiltrada.FindAll(x =>
                    x.Especialidades.Any(esp => esp.Descripcion == especialidadSeleccionada));
            }
            listaMedicos = listaFiltrada;

            if (listaMedicos == null)
            {
                return;
            }

            ddlProfesionales.DataSource = listaMedicos;
            ddlProfesionales.DataTextField = "NombreCompleto";
            ddlProfesionales.DataValueField = "IdMedico";
            ddlProfesionales.DataBind();
            ItemsporDefectoProf();
            visualCambioEsp();
        }

        protected void ddlProfesionales_SelectedIndexChanged(object sender, EventArgs e)
        {
            cargarTurnosLibres();
        }

        private void cargarTurnosLibres()
        {
            if (ddlProfesionales.SelectedValue == "0" || string.IsNullOrEmpty(ddlProfesionales.SelectedValue)) return;
            int idMedicoSeleccionado = int.Parse(ddlProfesionales.SelectedValue);
            List<Medico> listaMedicos = (List<Medico>)Session["ListaMedicosCompleta"];
            Medico medicoSeleccionado = listaMedicos.Find(x => x.IdMedico == idMedicoSeleccionado);
            TurnoNegocio negocio = new TurnoNegocio();
            List<DateTime> turnosLibres = negocio.ConsultarTurnosLibres(idMedicoSeleccionado, ddlEspecialidades.SelectedValue, DateTime.Parse(txtFecha.Text));


            if (turnosLibres != null && turnosLibres.Count > 0)
            {
                // Formatear los turnos para el GridView
                var turnosFormateados = turnosLibres.Select(t => new
                {
                    Fecha = t.ToString("dd/MM/yyyy"),
                    DiaSemana = t.ToString("dddd", new System.Globalization.CultureInfo("es-ES")),
                    Hora = t.ToString("HH:mm"),
                    Especialidad = ddlEspecialidades.SelectedValue,
                    Medico = ddlProfesionales.SelectedItem.Text,
                    FechaCompleta = t
                }).ToList();

                dgvFechas.DataSource = turnosFormateados;
                dgvFechas.DataBind();
            }
            else
            {
                // No hay turnos disponibles
                dgvFechas.DataSource = null;
                dgvFechas.DataBind();
                // Opcional: mostrar mensaje
                // lblMensaje.Text = "No hay turnos disponibles";
            }

            visualCambioProf();
        }


        /// VISUALES
        public void visualInicio()
        {
            CampoProfesional.Visible = false;
            CampoMotivo.Visible = false;
            CampoDias.Visible = false;
        }
        public void visualCambioEsp()
        {
            CampoProfesional.Visible = true;
            CampoMotivo.Visible = false;
            CampoDias.Visible = false;
            txtMotivoConsulta.Text = "";
        }
        public void visualCambioProf()
        {
            CampoProfesional.Visible = true;
            CampoMotivo.Visible = true;
            CampoDias.Visible = true;
        }
        ///---------------------------------///
        ///
        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            try
            {
                aviso.Text = "";
                if (DateTime.Parse(txtFecha.Text) < DateTime.Now)
                {
                    txtFecha.Text = DateTime.Now.ToString("dd/MM/yyyy");
                }
                cargarTurnosLibres();
            }
            catch
            {
                aviso.Text = "* No se pudo leer la fecha ingresada";
                return;
            }
        }

        protected void dgvFechas_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            // Obtener la fecha completa del CommandArgument
            DateTime fechaCompleta = DateTime.Parse(e.CommandArgument.ToString());

            // Guardar en ViewState para mantener los valores
            FechaSeleccionada = fechaCompleta.ToString("dd/MM/yyyy");
            HoraSeleccionada = fechaCompleta.ToString("HH:mm");
            DiaSeleccionado = fechaCompleta.ToString("dddd", new System.Globalization.CultureInfo("es-ES"));

            ViewState["FechaSeleccionada"] = FechaSeleccionada;
            ViewState["HoraSeleccionada"] = HoraSeleccionada;
            ViewState["DiaSeleccionado"] = DiaSeleccionado;

            ScriptManager.RegisterStartupScript(this, GetType(), "abrirModal",
            "var modal = new bootstrap.Modal(document.getElementById('exampleModal')); modal.show();",
            true);
        }

        protected void btnConfirmarTurno_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
                return;

            try
            {
                Turno turno = new Turno();
                EspecialidadNegocio neg = new EspecialidadNegocio();

                turno.Paciente.IdPaciente = Request.QueryString["idPaciente"] != null ? int.Parse(Request.QueryString["idPaciente"]) : 0;
                turno.Especialidad.IdEspecialidad = neg.recuperarId(ddlEspecialidades.SelectedValue);
                turno.Medico.IdMedico = int.Parse(ddlProfesionales.SelectedValue);
                string[] partesFecha = FechaSeleccionada.Split('/');
                string[] partesHora = HoraSeleccionada.Split(':');
                DateTime fechaHora = new DateTime(
                    int.Parse(partesFecha[2]), // año
                    int.Parse(partesFecha[1]), // mes
                    int.Parse(partesFecha[0]), // día
                    int.Parse(partesHora[0]),  // hora
                    int.Parse(partesHora[1]),  // minuto
                    0                          // segundo
                );
                turno.FechaHora = fechaHora;
                turno.Motivo = txtMotivoConsulta.Text;

                TurnoNegocio negocio = new TurnoNegocio();
                negocio.AgregarTurno(turno);
                Response.Redirect("InicioRecepcionista.aspx");
            }
            catch
            {
                return;
            }

        }


    }
}