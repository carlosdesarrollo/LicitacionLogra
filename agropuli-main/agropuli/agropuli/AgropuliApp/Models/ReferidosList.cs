using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AgropuliApp.Models
{
    public class ReferidosList
    {
        public DateTime? FechaCreacion { get; set; }
        public string Cedula { get; set; }
        public string NombreCompleto { get; set; }
        public int Nivel { get; set; }
    }
}