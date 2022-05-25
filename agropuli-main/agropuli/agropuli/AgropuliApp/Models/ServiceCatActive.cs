using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AgropuliApp.Models
{
    public class ServiceCatActive
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public bool IsActive { get; set; }
        public string ImageMimeType { get; set; }
        public string Imagen { get; set; }
        public decimal Price { get; set; }
    }
}