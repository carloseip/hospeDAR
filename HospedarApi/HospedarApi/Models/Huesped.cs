using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace HospedarApi.Models
{
    public class Huesped
    {
        public int id_usuario { get; set; }
        public string nombre { get; set; }
        public string departamento { get; set; }
        public string direccion { get; set; }
        public int edad { get; set; }
        public int phone { get; set; }
        public string descripcion { get; set; }
        public DateTime fecha_i { get; set; }
        public DateTime fecha_f { get; set; }
        public string porque { get; set; }
        public string valides { get; set; }
    }
}
