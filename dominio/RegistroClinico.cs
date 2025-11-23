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
        public int IdRegistro { get; set; }
        public int IdTurno { get; set; }

        public string Diagnostico { get; set; }
        public string Observacion { get; set; }
        public string Tratamiento { get; set; }
    }
}