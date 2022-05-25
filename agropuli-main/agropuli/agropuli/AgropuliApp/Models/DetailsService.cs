using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AgropuliApp.Models
{
    public class DetailsService
    {
        public long Id { get; set; }
        public int CategoriaID { get; set; }
        public string Categoria { get; set; }
        public string ImgTypeCat { get; set; }
        public string ImgCat { get; set; }
        public int ServicioID { get; set; }
        public string Servicio { get; set; }
        public string ImgTypeService { get; set; }
        public string ImgService { get; set; }
        public decimal? Precio { get; set; }
    }
}