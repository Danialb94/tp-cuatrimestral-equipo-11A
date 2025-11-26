using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dominio
{
    public class EspecialidadHorario
    {
        public Especialidad Especialidad { get; set; }
        public List<string> Dias { get; set; }
        public List<string> FranjasHorarias { get; set; }
    }

}
