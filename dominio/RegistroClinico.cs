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
        public string Diagnostico { get; set; }
        public string Observaciones { get; set; }
        public string Tratamiento { get; set; }
    }
}