using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dominio
{
    public class Paciente:Persona
    {
        public int IdPaciente { get; set; }
        public string TipoDocumento { get; set; }
        public string Documento { get; set; }
        public string Domicilio { get; set; }
        public DateTime FechaNacimiento { get; set; }
        public string Cobertura { get; set; } 
        public HistoriaClinica HistoriaClinica { get; set; }
        public Imagen Imagen { get; set; }
        public List<string> Alergias { get; set; }
        public List<string> CondicionBase { get; set; }
        public Paciente()
        {
            Alergias = new List<string>();
            CondicionBase = new List<string>();
        }

    }
}
