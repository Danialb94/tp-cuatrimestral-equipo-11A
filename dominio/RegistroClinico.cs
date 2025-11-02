using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dominio
{
    public class RegistroClinico
    {
        public Turno Turno { get; set; }
        public string Diagnostico { get; set; }
        public string Observaciones { get; set; }
    }
}
