using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AgropuliApp.Models
{
    public class ServiceCotiList
    {
        public long Id { get; set; }
        public string UsuarioCreacion { get; set; }
        public string NombreCompleto { get; set; }
        public string Phone { get; set; }
        public DateTime? FechaCreacion { get; set; }
        public string Email { get; set; }
        public decimal? Total { get; set; }
        public string Estado { get; set; }
        public string Servicio { get; set; }

    }
}