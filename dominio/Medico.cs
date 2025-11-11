using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace dominio
{
    public class Medico : Persona
    {
        public int IdMedico { get; set; }
        public string Matricula { get; set; }
        public List<Especialidad> Especialidades { get; set; }
        public List<Horario> Horario { get; set; }
        public Medico()
        {
            Especialidades = new List<Especialidad>();
            Horario = new List<Horario>();
            Imagen = new Imagen();
        }
    }
}
