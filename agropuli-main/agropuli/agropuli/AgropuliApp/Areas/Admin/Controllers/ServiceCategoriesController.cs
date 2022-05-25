using AgropuliApp.Models;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.Mvc;

namespace AgropuliApp.Areas.Admin.Controllers
{
    public class ServiceCategoriesController : BaseController
    {
        // GET: Admin/ServiceCategories
        public ActionResult Index()
        {
            return View(db.ServiceCategory.ToList());
        }

        // GET: Admin/ServiceCategories/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/ServiceCategories/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Name,Imagen,ImageMimeType")] ServiceCategory serviceCategory, HttpPostedFileBase image)
        {
            if (ModelState.IsValid)
            {
                if (image != null)
                {
                    serviceCategory.ImageMimeType = image.ContentType;
                    int length = image.ContentLength;
                    byte[] buffer = new byte[length];
                    image.InputStream.Read(buffer, 0, length);
                    string str = Encoding.Default.GetString(buffer);
                    serviceCategory.Imagen = str;

                }

                db.ServiceCategory.Add(serviceCategory);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(serviceCategory);
        }

        // GET: Admin/ServiceCategories/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ServiceCategory serviceCategory = db.ServiceCategory.Find(id);
            if (serviceCategory == null)
            {
                return HttpNotFound();
            }
            return View(serviceCategory);
        }

        // POST: Admin/ServiceCategories/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Name,Imagen,ImageMimeType")] ServiceCategory serviceCategory, HttpPostedFileBase image)
        {
            if (ModelState.IsValid)
            {
                if (image != null)
                {
                    serviceCategory.ImageMimeType = image.ContentType;
                    int length = image.ContentLength;
                    byte[] buffer = new byte[length];
                    image.InputStream.Read(buffer, 0, length);
                    string str = Encoding.Default.GetString(buffer);
                    serviceCategory.Imagen = str;

                }

                db.Entry(serviceCategory).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(serviceCategory);
        }

        public FileContentResult GetImageServices(int ServiceID)
        {
            ServiceCategory servicecat = db.ServiceCategory.FirstOrDefault(c => c.Id == ServiceID);
            if (servicecat != null)
            {

                string type = string.Empty;
                if (!string.IsNullOrEmpty(servicecat.ImageMimeType))
                {
                    type = servicecat.ImageMimeType;
                }
                else
                {
                    type = "image/jpeg";
                }

                byte[] bytes = Encoding.Default.GetBytes(servicecat.Imagen);

                return File(bytes, type);
            }
            else
            {
                return null;
            }
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
