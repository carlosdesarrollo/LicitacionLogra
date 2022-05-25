using AgropuliApp.Models;
using System;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web.Mvc;

namespace AgropuliApp.Controllers
{
    public class FavorsController : BaseController
    {
        // GET: Favors
        public ActionResult Index()
        {
            var favor = db.Favor.Include(f => f.User);
            return View(favor.ToList());
        }

        // GET: Favors/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Favor favor = db.Favor.Find(id);
            if (favor == null)
            {
                return HttpNotFound();
            }
            return View(favor);
        }

        // GET: Favors/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Favors/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Created,Username,Description")] Favor favor)
        {
            if (ModelState.IsValid)
            {
                favor.Created = DateTime.Now;
                favor.Username = User.Identity.Name;
                db.Favor.Add(favor);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.Username = new SelectList(db.User, "Username", "Password", favor.Username);
            return View(favor);
        }

        // GET: Favors/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Favor favor = db.Favor.Find(id);
            if (favor == null)
            {
                return HttpNotFound();
            }
            ViewBag.Username = new SelectList(db.User, "Username", "Password", favor.Username);
            return View(favor);
        }

        // POST: Favors/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Created,Username,Description")] Favor favor)
        {
            if (ModelState.IsValid)
            {
                db.Entry(favor).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Username = new SelectList(db.User, "Username", "Password", favor.Username);
            return View(favor);
        }

        // GET: Favors/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Favor favor = db.Favor.Find(id);
            if (favor == null)
            {
                return HttpNotFound();
            }
            return View(favor);
        }

        // POST: Favors/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Favor favor = db.Favor.Find(id);
            db.Favor.Remove(favor);
            db.SaveChanges();
            return RedirectToAction("Index");
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
