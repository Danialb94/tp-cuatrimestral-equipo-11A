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
    public partial class SolicitarTurno : System.Web.UI.Page
    {
        List<string> listaEspecialidades { get; set; }
        List<Medico> listaMedicos;
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

                    //CARGA SI VIENE DESDE CARTILLA
                    //CARGA DDL ESPECIALIDADES
                    string esp = Request.QueryString["esp"] != null ? Request.QueryString["esp"].ToString() : "";
                    if (esp != "")
                    {
                        int indice = listaEspecialidades.FindIndex(x => x == esp);
                        ddlEspecialidades.ClearSelection();
                        ddlEspecialidades.Items[indice+1].Selected = true;
                    }
                    //CARGA DDL MEDICO
                    int idMedico = Request.QueryString["id"] != null ? int.Parse(Request.QueryString["id"]) : 0;
                    if (idMedico != 0)
                    {
                        int indice = listaMedicos.FindIndex(x => x.IdMedico == idMedico);
                        if (indice != -1) // Verifica que se encontró
                        {
                            ddlProfesionales.ClearSelection();
                            ddlProfesionales.Items[indice + 1].Selected = true;
                        }
                    }

                    if (esp == "" && idMedico == 0) visualInicio();
                    else {
                        visualCambioProf();
                        cargarTurnosLibres();
                    }
                    ;
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
            List<DateTime> turnosLibres = negocio.ConsultarTurnosLibres(idMedicoSeleccionado, ddlEspecialidades.SelectedValue);


            if (turnosLibres != null && turnosLibres.Count > 0)
            {
                // Formatear los turnos para el GridView
                var turnosFormateados = turnosLibres.Select(t => new
                {
                    Fecha = t.ToString("dd/MM/yyyy"),
                    DiaSemana = t.ToString("dddd", new System.Globalization.CultureInfo("es-ES")),
                    Hora = t.ToString("HH:mm"),
                    FechaCompleta = t // Por si necesitas el DateTime completo después
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
        }
        public void visualCambioProf()
        {
            CampoProfesional.Visible = true;
            CampoMotivo.Visible = true;
            CampoDias.Visible = true;
        }

    }
}