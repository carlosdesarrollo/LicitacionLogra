using AgropuliApp.Models;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.Mvc;

namespace AgropuliApp.Areas.Admin.Controllers
{
    public class ServicesController : BaseController
    {
        // GET: Admin/Services
        public ActionResult Index()
        {
            var service = db.Service.Include(s => s.ServiceCategory);
            return View(service.ToList());
        }

        // GET: Admin/Services/Create
        public ActionResult Create()
        {
            ViewBag.CategoryId = new SelectList(db.ServiceCategory, "Id", "Name");
            return View();
        }

        // POST: Admin/Services/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Name,CategoryId,Price,IsActive,Imagen")] Service service, HttpPostedFileBase image)
        {
            if (ModelState.IsValid)
            {
                if (image != null)
                {
                    service.ImageMimeType = image.ContentType;
                    int length = image.ContentLength;
                    byte[] buffer = new byte[length];
                    image.InputStream.Read(buffer, 0, length);
                    string str = Encoding.Default.GetString(buffer);
                    service.Imagen = str;

                }
                db.Service.Add(service);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.CategoryId = new SelectList(db.ServiceCategory, "Id", "Name", service.CategoryId);
            return View(service);
        }

        // GET: Admin/Services/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Service service = db.Service.Find(id);
            if (service == null)
            {
                return HttpNotFound();
            }
            ViewBag.CategoryId = new SelectList(db.ServiceCategory, "Id", "Name", service.CategoryId);
            return View(service);
        }

        // POST: Admin/Services/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Name,CategoryId,Price,IsActive,Imagen")] Service service, HttpPostedFileBase image)
        {
            if (ModelState.IsValid)
            {
                if (image != null)
                {
                    service.ImageMimeType = image.ContentType;
                    int length = image.ContentLength;
                    byte[] buffer = new byte[length];
                    image.InputStream.Read(buffer, 0, length);
                    string str = Encoding.Default.GetString(buffer);
                    service.Imagen = str;

                }

                db.Entry(service).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.CategoryId = new SelectList(db.ServiceCategory, "Id", "Name", service.CategoryId);
            return View(service);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        public FileContentResult GetImageService(int ServiceID)
        {
            Service service = db.Service.FirstOrDefault(c => c.Id == ServiceID);
            if (service != null)
            {

                string type = string.Empty;
                if (!string.IsNullOrEmpty(service.ImageMimeType))
                {
                    type = service.ImageMimeType;
                }
                else
                {
                    type = "image/jpeg";
                }

                byte[] bytes = Encoding.Default.GetBytes(service.Imagen);

                return File(bytes, type);
            }
            else
            {
                return null;
            }
        }
    }
}
