using AgropuliApp.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.Entity;
using System.Globalization;
using System.Linq;
using System.Net;
using System.Text;
using System.Web.Mvc;

namespace AgropuliApp.Controllers
{
    [Authorize]
    public class OrderController : BaseController
    {
        // GET: Orders
        public ActionResult Index(string id)
        {
            var order = db.Order.Include(o => o.User).Where(x => x.Username == User.Identity.Name && x.TypeMod == "Pedido").OrderByDescending(x => x.Created);
            return View(order.ToList());
        }

        public ActionResult ServiceCatList(int id)
        {
            var service = db.Service.Where(x => x.CategoryId == id && x.IsActive == true).Select(x => new { id = x.Id, name = x.Name, typeimg = x.ImageMimeType, image = x.Imagen, precio = x.Price }).OrderByDescending(x => x.id);
            List<ServiceCatActive> listar = new List<ServiceCatActive>();    
            foreach (var item in service)
            {
                ServiceCatActive ent = new ServiceCatActive();
                ent.Id = item.id;
                ent.Name = item.name;
                ent.ImageMimeType = item.typeimg;
                ent.Imagen = ConvertTo64(item.image);
                ent.Price = item.precio;
                listar.Add(ent);
            }
            ViewBag.ServicesCat = listar;

            return View();
        }

        public ActionResult ListProducts()
        {
            var usucession = User.Identity.Name;
            var rolid = GetUser(User.Identity.Name).RoleId;
            ViewBag.RolId = rolid;
            if (rolid == 2)
            {
                var query = from a in db.Order
                            join b in db.User on a.Username equals b.Username
                            where a.TypeMod == "Pedido" && a.Username == usucession
                            select new ProdCotiList
                            {
                                Reference = a.Reference,
                                Created = a.Created,
                                NombreCompleto = b.FullName,
                                Phone = b.Phone,
                                Email = b.Email,
                                Total = a.Total
                            };

                return View(query.ToList());
            }
            else
            {
                var query = from a in db.Order
                            join b in db.User on a.Username equals b.Username
                            where a.TypeMod == "Pedido"
                            select new ProdCotiList
                            {
                                Reference = a.Reference,
                                Created = a.Created,
                                NombreCompleto = b.FullName,
                                Phone = b.Phone,
                                Email = b.Email,
                                Total = a.Total
                            };
                return View(query.ToList());
            }
        }

        public ActionResult ListServices()
        {
            var usucession = User.Identity.Name;
            var rolid = GetUser(User.Identity.Name).RoleId;
            ViewBag.RolId = rolid;

            if (rolid == 2)
            {
                var query = from a in db.ServiceCompras
                            join b in db.Service on a.ServicioId equals b.Id
                            join c in db.User on a.UsuarioCreacion equals c.Username
                            where a.UsuarioCreacion == usucession
                            select new ServiceCotiList
                            {
                                Id = a.Id,
                                UsuarioCreacion = a.UsuarioCreacion,
                                Estado = a.Estado,
                                NombreCompleto = c.FullName,
                                Phone = c.Phone,
                                Total = a.Precio,
                                Email = c.Email,
                                Servicio = b.Name,
                                FechaCreacion = a.FechaCreacion
                            };
                return View(query.ToList());
            }
            else if (rolid == 3)
            {
                var query = from a in db.ServiceCompras
                            join b in db.Service on a.ServicioId equals b.Id
                            join c in db.User on a.UsuarioCreacion equals c.Username
                            where a.Estado == "Pendiente"
                            select new ServiceCotiList
                            {
                                Id = a.Id,
                                UsuarioCreacion = a.UsuarioCreacion,
                                Estado = a.Estado,
                                NombreCompleto = c.FullName,
                                Phone = c.Phone,
                                Total = a.Precio,
                                Email = c.Email,
                                Servicio = b.Name,
                                FechaCreacion = a.FechaCreacion
                            };

                return View(query.ToList());
            }
            else
            {
                var query = from a in db.ServiceCompras
                            join b in db.Service on a.ServicioId equals b.Id
                            join c in db.User on a.UsuarioCreacion equals c.Username
                            select new ServiceCotiList
                            {
                                Id = a.Id,
                                UsuarioCreacion = a.UsuarioCreacion,
                                Estado = a.Estado,
                                NombreCompleto = c.FullName,
                                Phone = c.Phone,
                                Total = a.Precio,
                                Email = c.Email,
                                Servicio = b.Name,
                                FechaCreacion = a.FechaCreacion
                            };

                return View(query.ToList());
            }            
        }

        // GET: Orders/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Order order = db.Order.Find(id);
            if (order == null)
            {
                return HttpNotFound();
            }
            return View(order);
        }   

        // GET: Orders/Details/5
        public ActionResult DetailsService(long id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            var detailservice = (from a in db.ServiceCompras
                                join b in db.Service on a.ServicioId equals b.Id
                                join c in db.Category on b.CategoryId equals c.Id
                                where a.Id == id
                                select new DetailsService
                                {
                                    Id = a.Id,
                                    CategoriaID = c.Id,
                                    Categoria = c.Name,
                                    ImgTypeCat = c.ImageMimeType,
                                    //ImgCat = c.Imagen,
                                    ServicioID = b.Id,
                                    Servicio = b.Name,
                                    ImgTypeService = b.ImageMimeType,
                                    //ImgService = b.Imagen,
                                    Precio = a.Precio
                                }).First();

            if (detailservice == null)
            {
                return HttpNotFound();
            }

            Order order = null;

            order = new Order() { Reference = Helper.GetOrderReference(), Username = User.Identity.Name, Created = DateTime.Now, Total = detailservice.Precio, TypeMod = "Servicio" };
            db.Order.Add(order);
            db.SaveChanges();

            Session["OrderServicio"] = order;

            ViewBag.RolId = GetUser(User.Identity.Name).RoleId;
            ViewBag.Details = detailservice;
            ViewBag.Payu = SetPayuService(order);
            ViewBag.User = GetUser(User.Identity.Name);
            return View();
        }

        [HttpGet]
        public ActionResult ProductCatList(int id)
        {
            var query = db.Product.Where(x => x.CategoryId == id && x.IsActive == true).OrderByDescending(x => x.Id);
            List<ProdCatList> listar = new List<ProdCatList>();
            foreach (var item in query)
            {
                ProdCatList ent = new ProdCatList();
                ent.Id = item.Id;
                ent.Name = item.Name;
                ent.ImageMimeType = item.ImageMimeType;
                ent.Imagen = ConvertTo64(item.Imagen);
                ent.Price = item.Price;
                ent.Description = item.Description;
                listar.Add(ent);
            }
            ViewBag.Productos = listar;

            return View();
        }

        [HttpGet]
        public ActionResult AddProduct()
        {
            var category = db.Category.Select(x => new { id = x.Id, name = x.Name, image = x.Imagen, type = x.ImageMimeType });
            List<CategoriaAllST> lista = new List<CategoriaAllST>();
            foreach (var item in category)
            {
                CategoriaAllST ent = new CategoriaAllST();
                ent.Id = item.id;
                ent.Name = item.name;
                ent.ImageMimeType = item.type;
                ent.Imagen = ConvertTo64(item.image);
                lista.Add(ent);
            }

            ViewBag.Categories = lista;

            return View();
        }

        [HttpPost]
        public ActionResult AddProduct(OrderProduct model)
        {
            if (Session["OrderProducts"] == null)
            {
                Session["OrderProducts"] = new List<OrderProduct>();
            }

            List<OrderProduct> orderProducts = (List<OrderProduct>)Session["OrderProducts"];
            orderProducts.Add(model);

            Session["OrderProducts"] = orderProducts;

            return Json("El producto fue agregado a la pedido.", JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public ActionResult AddProduct2(OrderProduct model)
        {
            ViewBag.Categories = db.Category.ToList();

            if (Session["OrderProducts"] == null)
            {
                Session["OrderProducts"] = new List<OrderProduct>();
            }

            List<OrderProduct> orderProducts = (List<OrderProduct>)Session["OrderProducts"];
            orderProducts.Add(model);

            Session["OrderProducts"] = orderProducts;

            TempData["Alert"] = new Alert("success", "El producto fue agregado a la pedido.");

            return View();
        }

        [HttpGet]
        public ActionResult GetCometnarios(string id, string menu)
        {
            return Json(db.Comentarios.Where(x => x.Codigo == id && x.Menu == menu).Select(x => new { id = x.Id, comentario = x.Comentario, codigo = x.Codigo }), JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public ActionResult GetService(int id)
        {
            return Json(db.Service.Where(x => x.Id == id).Select(x => new { id = x.Id, name = x.Name, precio = x.Price, imagen = x.Imagen, imgtipo = x.ImageMimeType }), JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public ActionResult GetCategory(int id)
        {
            return Json(db.Category.Where(x => x.Id == id).Select(x => new { id = x.Id, name = x.Name }), JsonRequestBehavior.AllowGet);
        }

        public string ConvertTo64(string img)
        {
            string imgstring = "";
            if (img != null && img != "")
            {
                byte[] bytes = null;
                bytes = Encoding.Default.GetBytes(img);
                imgstring = Convert.ToBase64String(bytes);
            }           

            return imgstring;
        }

        [HttpGet]
        public ActionResult GetAllCategory()
        {
            var category = db.Category.Select(x => new { id = x.Id, name = x.Name, image = x.Imagen, type = x.ImageMimeType });
            List<CategoriaAllST> lista = new List<CategoriaAllST>();
            foreach (var item in category)
            {
                CategoriaAllST ent = new CategoriaAllST();
                ent.Id = item.id;
                ent.Name = item.name;
                ent.ImageMimeType = item.type;
                ent.Imagen = ConvertTo64(item.image);
                lista.Add(ent);
            }

            return Json(lista, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public ActionResult GetProductsByCategory(int id)
        {
            return Json(db.Product.Where(x => x.CategoryId == id && x.IsActive == true).Select(x => new { id = x.Id, name = x.Name }), JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public ActionResult GetProduct(int id)
        {
            db.Configuration.ProxyCreationEnabled = false;
            var Product = db.Product.First(x => x.Id == id);            
            return Json(Product, JsonRequestBehavior.AllowGet);
        }
        [HttpGet]
        public ActionResult GetImageFileCategory(int id)
        {
            var Category = db.Category.First(x => x.Id == id);
            if (Category != null)
            {

                string type = string.Empty;
                if (!string.IsNullOrEmpty(Category.ImageMimeType))
                {
                    type = Category.ImageMimeType;
                }
                else
                {
                    type = "image/jpeg";
                }

                byte[] bytes = null;

                if (Category.Imagen != null)
                {
                    bytes = Encoding.Default.GetBytes(Category.Imagen);

                    string ss = Convert.ToBase64String(bytes);
                    return Json(ss, JsonRequestBehavior.AllowGet);
                }
                else
                {
                    bytes = null;
                    return Json(bytes, JsonRequestBehavior.AllowGet);
                }


            }
            else
            {
                return null;
            }
        }


        [HttpGet]
        public ActionResult GetImageFile(int id)
        {
            var Product = db.Product.First(x => x.Id == id);
            if (Product != null)
            {

                string type = string.Empty;
                if (!string.IsNullOrEmpty(Product.ImageMimeType))
                {
                    type = Product.ImageMimeType;
                }
                else
                {
                    type = "image/jpeg";
                }

                byte[] bytes = null;

                if (Product.Imagen != null)
                {
                    bytes = Encoding.Default.GetBytes(Product.Imagen);

                    string ss = Convert.ToBase64String(bytes);
                    return Json(ss, JsonRequestBehavior.AllowGet);
                }
                else
                {
                    bytes = null;
                    return Json(bytes, JsonRequestBehavior.AllowGet);
                }                

                
            }
            else
            {
                return null;
            }
        }

        [HttpGet]
        public FileContentResult GetImageProduct(int ProductID)
        {
            Product product = db.Product.FirstOrDefault(c => c.Id == ProductID);
            if (product != null)
            {

                string type = string.Empty;
                if (!string.IsNullOrEmpty(product.ImageMimeType))
                {
                    type = product.ImageMimeType;
                }
                else
                {
                    type = "image/jpeg";
                }

                byte[] bytes = Encoding.Default.GetBytes(product.Imagen);

                return File(bytes, type);
            }
            else
            {
                return null;
            }
        }

        [HttpGet]
        public ActionResult GetImageFileService(int id)
        {
            var Service = db.Service.First(x => x.Id == id);
            if (Service != null)
            {

                string type = string.Empty;
                if (!string.IsNullOrEmpty(Service.ImageMimeType))
                {
                    type = Service.ImageMimeType;
                }
                else
                {
                    type = "image/jpeg";
                }

                byte[] bytes = null;

                if (Service.Imagen != null)
                {
                    bytes = Encoding.Default.GetBytes(Service.Imagen);

                    string ss = Convert.ToBase64String(bytes);
                    return Json(ss, JsonRequestBehavior.AllowGet);
                }
                else
                {
                    bytes = null;
                    return Json(bytes, JsonRequestBehavior.AllowGet);
                }


            }
            else
            {
                return null;
            }
        }

        public ActionResult RemoveProduct(int id)
        {
            List<OrderProduct> orderProducts = (List<OrderProduct>)Session["OrderProducts"];
            orderProducts.RemoveAt(id);

            Session["OrderProducts"] = orderProducts;

            return RedirectToAction("PayOrder");
        }

        [HttpPost]
        public ActionResult DescuentoPedido(string reference, decimal importe, int prodid)
        {
            Order order = db.Order.Where(x => x.Reference == reference).FirstOrDefault();
            Session["Order"] = order;

            order = (Order)Session["Order"];
            OrderProduct orderProducts = db.OrderProduct.Where(x => x.OrderReference == reference && x.ProductId == prodid).FirstOrDefault();
            orderProducts.OrderReference = reference;
            orderProducts.ProductId = orderProducts.ProductId;
            orderProducts.Quantity = orderProducts.Quantity;
            orderProducts.SubTotalPrice = importe;

            db.Entry(orderProducts).State = EntityState.Modified;
            db.SaveChanges();

            decimal total = 0;
            List<OrderProduct> orderProductsList = (List<OrderProduct>)db.OrderProduct.Where(x => x.OrderReference == reference).ToList();
            foreach (var item in orderProductsList)
            {
                item.OrderReference = order.Reference;
                item.Product = db.Product.First(x => x.Id == item.ProductId);
                order.OrderProduct.Add(item);
                total = total + (item.SubTotalPrice);
            }

            order.Total = total;

            db.Entry(order).State = EntityState.Modified;
            db.SaveChanges();

            return Json("Importe modificado correctamente", JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public ActionResult Pay(string reference)
        {
            if (reference != null)
            {
                Order order = db.Order.Where(x => x.Reference == reference).FirstOrDefault();
                Session["Order"] = order;

                order = (Order)Session["Order"];
                List<OrderProduct> orderProducts = (List<OrderProduct>)db.OrderProduct.Where(x => x.OrderReference == reference).ToList();

                order.OrderProduct.Clear();

                decimal total = 0;

                foreach (var item in orderProducts)
                {
                    item.OrderReference = order.Reference;
                    item.Product = db.Product.First(x => x.Id == item.ProductId);
                    order.OrderProduct.Add(item);
                    total = total + (item.Quantity * item.Product.Price);
                }

                order.Total = total;

                db.Entry(order).State = EntityState.Modified;
                db.SaveChanges();

                ViewBag.Order = order;
                ViewBag.Payu = SetPayu(order);
                ViewBag.User = GetUser(User.Identity.Name);
                ViewBag.RolId = GetUser(User.Identity.Name).RoleId;
            }
            else
            {
                if (Session["OrderProducts"] == null || ((List<OrderProduct>)Session["OrderProducts"]).Count == 0)
                {
                    TempData["Alert"] = new Alert("danger", "Agregue al menos un producto al pedido.");

                    return RedirectToAction("AddProduct");
                }

                Order order = null;

                if (Session["Order"] == null)
                {
                    order = new Order() { Reference = Helper.GetOrderReference(), Username = User.Identity.Name, Created = DateTime.Now, TypeMod = "Pedido" };
                    db.Order.Add(order);
                    db.SaveChanges();

                    Session["Order"] = order;
                }

                order = (Order)Session["Order"];
                List<OrderProduct> orderProducts = (List<OrderProduct>)Session["OrderProducts"];

                order.OrderProduct.Clear();

                decimal total = 0;

                foreach (var item in orderProducts)
                {
                    item.OrderReference = order.Reference;
                    item.Product = db.Product.First(x => x.Id == item.ProductId);
                    order.OrderProduct.Add(item);
                    total = total + (item.Quantity * item.Product.Price);
                }

                order.Total = total;

                db.Entry(order).State = EntityState.Modified;
                db.SaveChanges();

                ViewBag.Order = order;
                ViewBag.Payu = SetPayu(order);
                ViewBag.User = GetUser(User.Identity.Name);
                ViewBag.RolId = GetUser(User.Identity.Name).RoleId;
            }


            return View();
        }

        public Payu SetPayuService(Order model)
        {
            bool payuTest = bool.Parse(ConfigurationManager.AppSettings["PayuTest"]);
            string env = payuTest == true ? "Test" : "Production";

            Payu payu = new Payu();

            payu.AccountId = ConfigurationManager.AppSettings[string.Format("AccountId.{0}", env)];
            payu.MerchantId = ConfigurationManager.AppSettings[string.Format("MerchantId.{0}", env)];
            payu.ApiKey = ConfigurationManager.AppSettings[string.Format("ApiKey.{0}", env)];
            payu.Amount = Math.Round(model.Total.Value).ToString();
            payu.BuyerEmail = model.Email;
            payu.Currency = "COP";
            payu.Description = "Servicio Agropuli";
            payu.Lng = "es";
            payu.ReferenceCode = model.Reference;
            payu.Tax = "0";
            payu.TaxReturnBase = "0";
            payu.Test = payuTest == true ? "1" : "0";
            payu.ConfirmationUrl = "http://app.agropuli.com.co/Order/PayuConfirmation";
            payu.ResponseUrl = "http://app.agropuli.com.co/Order/PayuResponse";
            payu.Url = ConfigurationManager.AppSettings[string.Format("URL.{0}", env)];

            payu.CreateSignature();

            return payu;
        }

        public Payu SetPayu(Order model)
        {
            bool payuTest = bool.Parse(ConfigurationManager.AppSettings["PayuTest"]);
            string env = payuTest == true ? "Test" : "Production";

            Payu payu = new Payu();

            payu.AccountId = ConfigurationManager.AppSettings[string.Format("AccountId.{0}", env)];
            payu.MerchantId = ConfigurationManager.AppSettings[string.Format("MerchantId.{0}", env)];
            payu.ApiKey = ConfigurationManager.AppSettings[string.Format("ApiKey.{0}", env)];
            payu.Amount = Math.Round(model.Total.Value).ToString();
            payu.BuyerEmail = model.Email;
            payu.Currency = "COP";
            payu.Description = "Pedido Agropuli";
            payu.Lng = "es";
            payu.ReferenceCode = model.Reference;
            payu.Tax = "0";
            payu.TaxReturnBase = "0";
            payu.Test = payuTest == true ? "1" : "0";
            payu.ConfirmationUrl = "http://app.agropuli.com.co/Order/PayuConfirmation";
            payu.ResponseUrl = "http://app.agropuli.com.co/Order/PayuResponse";
            payu.Url = ConfigurationManager.AppSettings[string.Format("URL.{0}", env)];

            payu.CreateSignature();

            return payu;
        }

        private string GetPayuState(string value)
        {
            switch (value)
            {
                case "4": return "APROBADO";
                case "5": return "EXPIRADO";
                case "6": return "DECLINADO";
                case "7": return "PENDIENTE";
                case "104": return "ERROR";
            }

            return value;
        }

        [AllowAnonymous]
        public ActionResult PayuResponse()
        {
            if (Request["merchantId"] != null)
            {
                bool payuTest = bool.Parse(ConfigurationManager.AppSettings["PayuTest"]);
                string env = payuTest == true ? "Test" : "Production";

                string apiKey = ConfigurationManager.AppSettings[string.Format("ApiKey.{0}", env)];
                string merchantID = Request["merchantId"].ToString();
                string reference = Request["referenceCode"].ToString();
                string txValue = Request["TX_VALUE"].ToString();
                string currency = Request["currency"].ToString();
                string transactionState = Request["transactionState"].ToString();
                string signature = Request["signature"].ToString();

                txValue = txValue.Replace(',', '.');
                string newValue = Math.Round(decimal.Parse(txValue, CultureInfo.InvariantCulture), 1).ToString(CultureInfo.InvariantCulture);
                string confirmationSignature = Payu.GetConfirmationSignature(apiKey, merchantID, reference, newValue, currency, transactionState);

                if (signature == confirmationSignature)
                {
                    if (db.Order.Any(x => x.Reference == reference))
                    {
                        Order order = db.Order.FirstOrDefault(x => x.Reference == reference);

                        decimal total = order.Total.Value;
                        decimal value = decimal.Parse(newValue, CultureInfo.InvariantCulture);

                        if (value == total)
                        {
                            order.Customer = Request["extra1"].ToString();
                            order.Email = Request["buyerEmail"].ToString();
                            order.Phone = Request["extra2"].ToString();
                            order.Address = Request["merchant_address"].ToString();
                            order.City = Request["extra3"].ToString();

                            order.PayuReference = Request["reference_pol"].ToString();
                            order.PayuTransaction = Request["transactionId"].ToString();
                            order.PayuState = GetPayuState(Request["transactionState"].ToString());
                            order.PayuResponseCode = Payu.ResponseCodes[Request["lapResponseCode"]];
                            order.PayuPaymentMethod = Request["lapPaymentMethod"].ToString();
                            order.PayuPaymentType = Request["lapPaymentMethodType"].ToString();
                            order.PaymentDateTime = DateTime.UtcNow.AddHours(-5);

                            if (order.PayuState == "APROBADO")
                            {
                                TempData["Alert"] = new Alert("success", "La compra ha sido realizada con exito, el numero de tu pedido es " + order.Reference);
                            }
                            else if (order.PayuState == "PENDIENTE")
                            {
                                TempData["Alert"] = new Alert("warning", "El pago esta en espera de confirmacion por parte de tu entidad, el numero de tu pedido es " + order.Reference);
                            }
                            else
                            {
                                TempData["Alert"] = new Alert("danger", "El pago ha sido declinado, el motivo es <b>" + order.PayuResponseCode + "</b>, el numero de tu pedido es " + order.Reference);
                            }

                            db.Entry(order).State = EntityState.Modified;
                            db.SaveChanges();
                        }
                        else
                        {
                            TempData["Alert"] = new Alert("danger", "El pago registrado presenta un valor diferente del valor guardado en el pedido. Por favor comuniquese con nosotros para resolver este inconveniente, el numero de tu pedido es " + reference);
                        }
                    }
                    else
                    {
                        TempData["Alert"] = new Alert("danger", "El pago registrado presenta una referencia de pago invalida. Por favor comuniquese con nosotros para resolver este inconveniente, el numero de tu pedido es " + reference);
                    }
                }
                else
                {
                    TempData["Alert"] = new Alert("danger", "El pago registrado presenta inconsistencias con la informacion del pedido. Por favor comuniquese con nosotros para resolver este inconveniente, el numero de tu pedido es " + reference);
                }
            }

            Session["Order"] = null;
            Session["OrderProducts"] = null;

            return View();
        }

        [AllowAnonymous]
        public void PayuConfirmation()
        {
            if (Request["merchant_id"] != null)
            {
                bool payuTest = bool.Parse(ConfigurationManager.AppSettings["PayuTest"]);
                string env = payuTest == true ? "Test" : "Production";

                string apiKey = ConfigurationManager.AppSettings[string.Format("ApiKey.{0}", env)];
                string merchantID = Request["merchant_id"].ToString();
                string reference = Request["reference_sale"].ToString();
                string txValue = Request["value"].ToString();
                string currency = Request["currency"].ToString();
                string transactionState = Request["state_pol"].ToString();
                string signature = Request["sign"].ToString();

                txValue = txValue.Replace(',', '.');

                string newValue = txValue;

                if (txValue.EndsWith("0"))
                {
                    newValue = txValue.Substring(0, txValue.Length - 1);
                }

                string confirmationSignature = Payu.GetConfirmationSignature(apiKey, merchantID, reference, newValue, currency, transactionState);

                if (signature == confirmationSignature)
                {
                    if (db.Order.Any(x => x.Reference == reference))
                    {
                        Order order = db.Order.FirstOrDefault(x => x.Reference == reference);

                        decimal total = order.Total.Value;
                        decimal value = decimal.Parse(newValue, CultureInfo.InvariantCulture);

                        if (value == total)
                        {
                            order.Customer = Request["extra1"].ToString();
                            order.Email = Request["email_buyer"].ToString();
                            order.Phone = Request["extra2"].ToString();
                            order.Address = Request["shipping_address"].ToString();
                            order.City = Request["extra3"].ToString();

                            order.PayuReference = Request["reference_pol"].ToString();
                            order.PayuTransaction = Request["transaction_id"].ToString();
                            order.PayuState = GetPayuState(Request["state_pol"].ToString());
                            order.PayuResponseCode = Payu.ResponseCodes[Request["response_message_pol"]];
                            order.PayuPaymentMethod = Request["payment_method_name"].ToString();
                            order.PayuPaymentType = Request["payment_method_type"].ToString();
                            order.PaymentDateTime = DateTime.UtcNow.AddHours(-5);

                            db.Entry(order).State = EntityState.Modified;
                            db.SaveChanges();
                        }
                    }
                }
            }
        }

        [HttpPost]
        public ActionResult PostServiceCompras(decimal precio, string comentario, int servicioid)
        {
            ServiceCompras obj = new ServiceCompras();
            obj.Precio = precio;
            obj.ServicioId = servicioid;
            obj.UsuarioCreacion = User.Identity.Name;
            obj.FechaCreacion = DateTime.Now;
            obj.Estado = "Pendiente";

            db.ServiceCompras.Add(obj);
            db.SaveChanges();
            string codigo = obj.Id.ToString();

            Comentarios objCom = new Comentarios();
            objCom.Menu = "ServiceCompras";
            objCom.UsuarioCreacion = User.Identity.Name;
            objCom.Comentario = comentario;
            objCom.Codigo = codigo;
            objCom.FechaCreacion = DateTime.Now;


            db.Comentarios.Add(objCom);
            db.SaveChanges();

            return Json("Su solicitud será enviada al área encargada. Pronto le daremos respuesta!");
        }

        [HttpPost]
        public ActionResult PostComentarioResp(string comentario, string menu, string codigo)
        {
            Comentarios objCom = new Comentarios();
            objCom.Menu = menu;
            objCom.UsuarioCreacion = User.Identity.Name;
            objCom.Comentario = comentario;
            objCom.Codigo = codigo;
            objCom.FechaCreacion = DateTime.Now;


            db.Comentarios.Add(objCom);
            db.SaveChanges();

            return Json("Se grabó satisfactoriamente");
        }
        [HttpPost]
        public ActionResult GetEditarPrecio(int id, decimal precio)
        {
            ServiceCompras service = db.ServiceCompras.SingleOrDefault(x => x.Id == id);
            service.Precio = precio;


            db.ServiceCompras.Attach(service);
            db.Entry(service).State = EntityState.Modified;
            db.SaveChanges();

            return Json("Se modificó satisfactoriamente");
        }
        

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}