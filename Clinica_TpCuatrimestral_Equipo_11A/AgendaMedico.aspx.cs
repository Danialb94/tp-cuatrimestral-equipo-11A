using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using dominio;
using negocio;

namespace Clinica_TpCuatrimestral_Equipo_11A
{
    public partial class AgendaMedico : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Medico medico = (Medico)Session["Medico"];
                if (medico == null)
                {
                    Response.Redirect("Default.aspx", false);
                    return;
                }

                DateTime hoy = DateTime.Today;
                DateTime lunes = hoy.AddDays(-(int)hoy.DayOfWeek + 1);
                if (lunes > hoy) lunes = lunes.AddDays(-7);

                ViewState["InicioSemana"] = lunes;
                txtMes.Value = hoy.ToString("yyyy-MM");
                CargarSemana(medico.IdMedico, lunes);
            }
        }

        protected void btnSemanaAnterior_Click(object sender, EventArgs e) => CambiarSemana(-7);
        protected void btnSemanaSiguiente_Click(object sender, EventArgs e) => CambiarSemana(7);

        protected void btnSemanaActual_Click(object sender, EventArgs e)
        {
            Medico medico = (Medico)Session["Medico"];
            if (medico == null) return;

            DateTime hoy = DateTime.Today;
            DateTime lunes = hoy.AddDays(-(int)hoy.DayOfWeek + 1);
            if (lunes > hoy) lunes = lunes.AddDays(-7);

            ViewState["InicioSemana"] = lunes;
            txtMes.Value = hoy.ToString("yyyy-MM");
            CargarSemana(medico.IdMedico, lunes);
        }

        protected void btnBuscarMes_Click(object sender, EventArgs e)
        {
            Medico medico = (Medico)Session["Medico"];
            if (medico == null) return;

            if (DateTime.TryParse(txtMes.Value + "-01", out DateTime mes))
            {
                DateTime lunes = mes.AddDays(-(int)mes.DayOfWeek + 1);
                if (lunes > mes) lunes = lunes.AddDays(-7);
                ViewState["InicioSemana"] = lunes;
                CargarSemana(medico.IdMedico, lunes);
            }
        }

        private void CambiarSemana(int dias)
        {
            Medico medico = (Medico)Session["Medico"];
            if (medico == null) return;

            DateTime inicio = (DateTime)ViewState["InicioSemana"];
            DateTime nuevaSemana = inicio.AddDays(dias);
            ViewState["InicioSemana"] = nuevaSemana;
            CargarSemana(medico.IdMedico, nuevaSemana);
        }

        private void CargarSemana(int idMedico, DateTime lunes)
        {
            var negocio = new MedicoNegocio();
            var turnos = negocio.ListarTurnos(idMedico)
                .Where(t => t.FechaHora.Date >= lunes && t.FechaHora.Date < lunes.AddDays(7))
                .ToList();

            List<TimeSpan> horas = new List<TimeSpan>
            {
                new TimeSpan(8,0,0), new TimeSpan(9,0,0),
                new TimeSpan(10,0,0), new TimeSpan(11,0,0),
                new TimeSpan(14,0,0), new TimeSpan(15,0,0),
                new TimeSpan(16,0,0), new TimeSpan(17,0,0)
            };

            StringBuilder html = new StringBuilder();

            foreach (var hora in horas)
            {
                html.Append("<tr>");
                html.Append($"<td class='fw-bold bg-light'>{hora:hh\\:mm}</td>");

                for (int d = 0; d < 5; d++)
                {
                    DateTime fecha = lunes.AddDays(d);
                    var turno = turnos.FirstOrDefault(t =>
                        t.FechaHora.Date == fecha.Date && t.FechaHora.Hour == hora.Hours);

                    if (turno != null)
                        html.Append($"<td class='bg-info text-white small'>{turno.Paciente.Nombre} {turno.Paciente.Apellido}<br/>({turno.Especialidad.Descripcion})</td>");
                    else
                        html.Append("<td></td>");
                }

                html.Append("</tr>");
            }

            ltAgenda.Text = html.ToString();

            DateTime viernes = lunes.AddDays(4);
            lblSemanaActual.Text = $"Semana del {lunes:dd} al {viernes:dd} de {lunes:MMMM}".ToUpper();
        }
    }
}
