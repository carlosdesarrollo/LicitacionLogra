using AgropuliApp.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace AgropuliApp.Controllers
{
    [Authorize]
    public class AppController : BaseController
    {
        [AllowAnonymous]
        [HttpGet]
        public ActionResult Index()
        {           
            if (User.Identity.IsAuthenticated == true)
            {
                if (GetUser(User.Identity.Name).RoleId == 1)
                {
                    return RedirectToAction("Menu", "App", new { Area = "Admin" });
                }

                return RedirectToAction("Menu");
            }

            return View();
        }

        [AllowAnonymous]
        [HttpPost]
        public ActionResult Index(User model)
        {
            Session["usuario"] = "";
            if (db.User.Any(x => x.Username.ToUpper() == model.Username.ToUpper() && x.Password == model.Password))
            {
                var user = db.User.First(x => x.Username.ToUpper() == model.Username.ToUpper() && x.Password == model.Password);

                FormsAuthentication.SetAuthCookie(user.Username, true);

                Session["usuario"] = user.Username;
                Session["rolid"] = user.RoleId;
                if (user.RoleId == 1)
                {
                    return RedirectToAction("Menu", "App", new { Area = "Admin" });
                }

                return RedirectToAction("Menu");
            }

            TempData["Alert"] = new Alert("danger", "Usuario y/o contraseña incorrectos.");

            return View();
        }

        public ActionResult Logout()
        {
            FormsAuthentication.SignOut();

            Session["OrderProducts"] = null;
            Session["Order"] = null;

            return RedirectToAction("Index");
        }

        public ActionResult Menu()
        {
            return View(db.User.First(x => x.Username == User.Identity.Name));
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
        public ActionResult Services()
        {
            var category = db.ServiceCategory.Select(x => new { id = x.Id, name = x.Name, image = x.Imagen, type = x.ImageMimeType });
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

        [HttpGet]
        public ActionResult GetServicesByCategory(int id)
        {
            return Json(db.Service.Where(x => x.CategoryId == id && x.IsActive == true).Select(x => new { id = x.Id, name = x.Name }), JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public ActionResult Accountant()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Accountant(HttpPostedFileBase[] uploadedFiles)
        {
            int i = 0;

            foreach (var file in uploadedFiles)
            {
                if (file != null)
                {
                    string fileName = string.Format("{0}_{1}_{2}", User.Identity.Name, DateTime.Now.ToString("yyyyMMdd_HHmm"), i);
                    string filePath = Server.MapPath("~/photos/" + fileName);

                    file.SaveAs(filePath);

                    i++;
                }
            }

            return View();
        }

        [HttpGet]
        public ActionResult WorkWithUs()
        {
            WorkWithUs workWithUs = db.WorkWithUs.FirstOrDefault(x => x.Username == User.Identity.Name);

            if (workWithUs == null)
            {
                ViewBag.JobId = new SelectList(db.Job, "Id", "Name");
                ViewBag.Username = new SelectList(db.User, "Username", "Password");
                ViewBag.VehicleId = new SelectList(db.Vehicle, "Id", "Name");

                return View(new WorkWithUs());
            }

            ViewBag.JobId = new SelectList(db.Job, "Id", "Name", workWithUs.JobId);
            ViewBag.Username = new SelectList(db.User, "Username", "Password", workWithUs.Username);
            ViewBag.VehicleId = new SelectList(db.Vehicle, "Id", "Name", workWithUs.VehicleId);

            ViewBag.Resume = Directory.GetFiles(Server.MapPath("~/resumes"), workWithUs.Username + "*.*").FirstOrDefault();

            return View(workWithUs);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult WorkWithUs([Bind(Include = "Id,Created,Username,Description,JobId,VehicleId,IsTechnician")] WorkWithUs workWithUs, HttpPostedFileBase uploadedFile)
        {
            if (ModelState.IsValid)
            {
                if (workWithUs.Id <= 0)
                {
                    workWithUs.Created = DateTime.Now;
                    workWithUs.Username = User.Identity.Name;
                    db.WorkWithUs.Add(workWithUs);
                }
                else
                {
                    db.Entry(workWithUs).State = EntityState.Modified;
                }

                if (uploadedFile != null)
                {
                    string resumeName = User.Identity.Name;
                    string resumePath = Server.MapPath("~/resumes");

                    uploadedFile.SaveAs(string.Format("{0}/{1}.{2}", resumePath, resumeName, Path.GetExtension(uploadedFile.FileName)));
                }

                db.SaveChanges();
            }

            return RedirectToAction("Index");
        }

        [HttpGet]
        public ActionResult Error()
        {
            return View();
        }
    }
}