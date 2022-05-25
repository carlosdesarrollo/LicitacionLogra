using AgropuliApp.Models;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web.Mvc;

namespace AgropuliApp.Areas.Admin.Controllers
{
    [Authorize]
    public class UsersController : BaseController
    {
        // GET: Admin/Users
        public ActionResult Index()
        {
            var usuariosession = User.Identity.Name;
            var query = db.User.FirstOrDefault(x => x.Username == usuariosession);
            var rolid = query.RoleId;
            Session["rolid"] = rolid;
            if (rolid.ToString() == "1")
            {
                var user = db.User.Include(u => u.Role);
                return View(user.ToList());
            }
            else
            {
                var user = db.User.Include(u => u.Role).Where(x => x.Username == usuariosession);
                return View(user.ToList());
            }


        }


        [HttpGet]
        public ActionResult Edit(string username)
        {
            if (username == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            User user = db.User.Find(username);
            if (user == null)
            {
                return HttpNotFound();
            }
            return View(user);
        }

        [AllowAnonymous]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(User model)
        {
            db.Entry(model).State = EntityState.Modified;
            db.SaveChanges();

            TempData["Alert"] = new Alert("success", "La cuenta ha sido actualizada.");

            return View(model);
        }

        [AllowAnonymous]
        [HttpGet]
        public ActionResult Create()
        {
            ViewBag.RoleId = new SelectList(db.Role, "Id", "Name");
            return View();
        }

        [AllowAnonymous]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(User model)
        {
            if (db.User.Any(x => x.Username == model.Username))
            {
                TempData["Alert"] = new Alert("danger", "Usuario ya existe.");
            }
            else if (db.User.Any(x => x.NationalId == model.NationalId))
            {
                TempData["Alert"] = new Alert("danger", "Cedula ya existe.");
            }
            else
            {
                db.User.Add(model);
                db.SaveChanges();

                TempData["Alert"] = new Alert("success", "El usuario ha sido creado.");

                return RedirectToAction("Index", "App");
            }

            ViewBag.RoleId = new SelectList(db.Role, "Id", "Name", model.RoleId);
            return View();
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
