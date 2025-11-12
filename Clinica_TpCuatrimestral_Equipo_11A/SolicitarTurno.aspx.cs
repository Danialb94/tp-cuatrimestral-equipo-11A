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
        protected void Page_Load(object sender, EventArgs e)
        {
            EspecialidadNegocio negocioEsp = new EspecialidadNegocio();
            MedicoNegocio negocioMed = new MedicoNegocio();
            try
            {


                if (!IsPostBack)
                {
                    //CARGA DDL ESPECIALIDADES
                    List<string> listaEspecialidades = negocioEsp.listarDescripcion();
                    ddlEspecialidades.DataSource = listaEspecialidades;
                    ddlEspecialidades.DataBind();
                    ListItem itemEspecialidadDefecto = new ListItem();
                    itemEspecialidadDefecto.Text = "Seleccionar la especialidad";
                    itemEspecialidadDefecto.Attributes.Add("disabled", "disabled"); // El atributo "Disabled" evita que el usuario pueda seleccionarlo después
                    itemEspecialidadDefecto.Selected = true; // El atributo "Selected" asegura que aparezca por defecto
                    ddlEspecialidades.Items.Insert(0, itemEspecialidadDefecto);

                    //CARGA DDL MEDICOS
                    List<string> listaProfesionales = negocioMed.NombresProfesionales();
                    ddlProfesionales.DataSource = listaProfesionales;
                    ddlProfesionales.DataBind();
                    ListItem itemProfesionalDefecto = new ListItem();
                    itemProfesionalDefecto.Text = "Seleccionar al profesional";
                    itemProfesionalDefecto.Attributes.Add("disabled", "disabled"); // El atributo "Disabled" evita que el usuario pueda seleccionarlo después
                    itemProfesionalDefecto.Selected = true; // El atributo "Selected" asegura que aparezca por defecto
                    ddlProfesionales.Items.Insert(0, itemProfesionalDefecto);

                    //CARGA DDL ESPECIALIDADES SI VIENE DE CARTILLA
                    string esp = Request.QueryString["esp"] != null ? Request.QueryString["esp"].ToString() : "";
                    if (esp != "")
                    {
                        int indice = listaEspecialidades.FindIndex(x => x == esp);
                        ddlEspecialidades.ClearSelection();
                        ddlEspecialidades.Items[indice+1].Selected = true;
                    }
                    else
                    {
                        // Si no viene especialidad, seleccionar el item por defecto
                        itemEspecialidadDefecto.Selected = true;
                    }
                    
                    //CARGA DDL MEDICO SI VIENE DE CARTILLA
                    int idMedico = Request.QueryString["id"] != null ? int.Parse(Request.QueryString["id"]) : 0;
                    if (idMedico != 0)
                    {
                        string nombreMedico = negocioMed.NombresProfesionales(idMedico);
                        int indice = listaProfesionales.FindIndex(x => x == nombreMedico);
                        ddlProfesionales.ClearSelection();
                        ddlProfesionales.Items[indice + 1].Selected = true;
                    }
                    else
                    {
                        // Si no viene especialidad, seleccionar el item por defecto
                        itemEspecialidadDefecto.Selected = true;
                    }

                }
            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
            }
        }
    }
}