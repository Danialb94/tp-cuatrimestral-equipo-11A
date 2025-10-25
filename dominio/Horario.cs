using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dominio
{
    public class Horario
    {
        public int IdHorario { get; set; }
        public List<string> DiasSemana { get; set; }
        public int HoraEntrada { get; set; }
        public int HoraSalida { get; set; }

        public Horario()
        {
            DiasSemana = new List<string>();
        }
    }
}
