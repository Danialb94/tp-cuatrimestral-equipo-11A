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
        public TipoDocumento TipoDocumento { get; set; }
        public string Documento { get; set; }
        public string Domicilio { get; set; }
        public DateTime FechaNacimiento { get; set; }
        public Cobertura Cobertura { get; set; } 
        //public HistoriaClinica HistoriaClinica { get; set; }
        public List<string> Alergias { get; set; }
        public List<string> CondicionBase { get; set; }
        public Paciente()
        {
            Alergias = new List<string>();
            CondicionBase = new List<string>();
            TipoDocumento = new TipoDocumento();
            Cobertura = new Cobertura();
            Imagen = new Imagen();
        }

    }
    //auxiliares para las altas y modificaciones en base de datos
    public class TipoDocumento 
    {
        public int IdTipoDocumento { get; set; }
        public string Descripcion { get; set; }
    }
    public class Cobertura
    {
        public int IdCobertura { get; set; }
        public string Descripcion { get; set; }
    }
}
