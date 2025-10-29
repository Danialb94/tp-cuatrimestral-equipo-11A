using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dominio
{
    public class HistoriaClinica
    {
        public int IdHistoriaClinica { get; set; }
        public Turno Turno { get; set; }
        public string Diagnostico { get; set; }
        public string Tratamiento { get; set; }

    }
}
