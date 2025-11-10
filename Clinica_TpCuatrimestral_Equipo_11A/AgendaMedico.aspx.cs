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

                // Empieza desde la semana actual (lunes a viernes)
                DateTime hoy = DateTime.Today;
                DateTime lunes = hoy.AddDays(-(int)hoy.DayOfWeek + 1);
                if (lunes > hoy) lunes = lunes.AddDays(-7);

                ViewState["InicioSemana"] = lunes;
                txtMes.Value = hoy.ToString("yyyy-MM");
                CargarSemana(medico.IdMedico, lunes);
            }
        }

        protected void btnSemanaAnterior_Click(object sender, EventArgs e) { CambiarSemana(-7); }
        protected void btnSemanaSiguiente_Click(object sender, EventArgs e) { CambiarSemana(7); }

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

            // Horas de la mañana y tarde
            List<TimeSpan> horasMañana = new List<TimeSpan>
            {
                new TimeSpan(8,0,0),
                new TimeSpan(9,0,0),
                new TimeSpan(10,0,0),
                new TimeSpan(11,0,0)
            };

            List<TimeSpan> horasTarde = new List<TimeSpan>
            {
                new TimeSpan(14,0,0),
                new TimeSpan(15,0,0),
                new TimeSpan(16,0,0),
                new TimeSpan(17,0,0)
            };

            // Encabezado con los días y sus números (Lunes 10, etc.)
            StringBuilder head = new StringBuilder();
            head.Append("<tr>");
            head.Append("<th>Hora</th>");
            for (int d = 0; d < 5; d++)
            {
                DateTime fecha = lunes.AddDays(d);
                string nombreDia = fecha.ToString("dddd", new System.Globalization.CultureInfo("es-ES"));
                nombreDia = char.ToUpper(nombreDia[0]) + nombreDia.Substring(1);
                head.Append(string.Format("<th>{0} {1:dd}</th>", nombreDia, fecha));
            }
            head.Append("</tr>");
            ltEncabezado.Text = head.ToString();

            // Cuerpo de la tabla
            StringBuilder html = new StringBuilder();

            // Mañana
            html.Append("<tr class='table-secondary text-center'><td colspan='6'><strong>Turnos de la mañana</strong></td></tr>");
            html.Append(GenerarFilas(horasMañana, lunes, turnos));

            // Tarde
            html.Append("<tr class='table-secondary text-center'><td colspan='6'><strong>Turnos de la tarde</strong></td></tr>");
            html.Append(GenerarFilas(horasTarde, lunes, turnos));

            ltAgenda.Text = html.ToString();

            // Texto del rango de la semana
            DateTime viernes = lunes.AddDays(4);
            lblSemanaActual.Text = string.Format("SEMANA DEL {0:dd} AL {1:dd} DE {0:MMMM}", lunes, viernes).ToUpper();
        }

        // Crea las filas de la tabla (para cada hora)
        private string GenerarFilas(List<TimeSpan> horas, DateTime lunes, List<Turno> turnos)
        {
            StringBuilder filas = new StringBuilder();

            foreach (var hora in horas)
            {
                filas.Append($"<tr><td class='fw-bold bg-light'>{hora:hh\\:mm}</td>");
                for (int d = 0; d < 5; d++)
                {
                    DateTime fecha = lunes.AddDays(d);
                    var turno = turnos.FirstOrDefault(t => t.FechaHora.Date == fecha.Date && t.FechaHora.Hour == hora.Hours);
                    if (turno != null)
                    {
                        filas.Append($"<td class='bg-info text-white small'><strong>{turno.Paciente.Nombre} {turno.Paciente.Apellido}</strong><br/><span class='fst-italic'>{turno.Especialidad.Descripcion}</span></td>");
                    }
                    else
                    {
                        filas.Append("<td></td>");
                    }
                }
                filas.Append("</tr>");
            }

            return filas.ToString();
        }

    }
}
