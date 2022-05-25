using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AgropuliApp.Models
{
    public class ProdCotiList
    {
        public string Reference { get; set; }
        public DateTime Created { get; set; }
        public string NombreCompleto { get; set; }
        public string Phone { get; set; }
        public string Email { get; set; }
        public decimal? Total { get; set; }
    }
}