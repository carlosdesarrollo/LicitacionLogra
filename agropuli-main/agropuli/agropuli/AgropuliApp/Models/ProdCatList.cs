using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AgropuliApp.Models
{
    public class ProdCatList
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public decimal Price { get; set; }
        public int CategoryId { get; set; }
        public bool IsActive { get; set; }
        public string Imagen { get; set; }
        public string ImageMimeType { get; set; }
    }
}