using AgropuliApp.Models;
using System;
using System.Data.Entity;
using System.Linq;
using System.Web.Mvc;

namespace AgropuliApp.Controllers
{
    public class ReferralsController : BaseController
    {
        // GET: Referrals
        public ActionResult Index()
        {
            var referral = db.Referral.Include(r => r.User);
            var ususession = db.User.Where(x => x.Username == User.Identity.Name).FirstOrDefault();
            ViewBag.UsuarioS = ususession.FullName;

            decimal? Dinerofavor = 0;
            decimal? Porcentajedescuento = 0;

            var queryProdPagados = (from a in db.Order 
                                    join b in db.UsuNivelRef on a.Username equals b.UsuarioReg
                                    where (a.PayuState == "APPROVED" || a.PayuState == "APROBADO")
                                    && b.UsuarioName == User.Identity.Name
                                    select new
                                    {
                                        Total = a.Total,
                                        Nivel = b.NivelId
                                    }
                                   ).ToList();
            if (queryProdPagados.Count > 0)
            {
                foreach (var item in queryProdPagados)
                {
                    var nivel = db.NivelRef.Where(x => x.Id == item.Nivel).FirstOrDefault();

                    Dinerofavor = (item.Total * nivel.PorcentajeDinero) / 100;
                    Porcentajedescuento = (item.Total * nivel.PorcentajePuntos) / 100;
                }
            }

            ViewBag.Porcentajedescuento = Porcentajedescuento;
            ViewBag.DineroFavor = Dinerofavor;

            var query = from a in db.UsuNivelRef
                        join b in db.User on a.UsuarioReg equals b.Username
                        where a.UsuarioName == User.Identity.Name
                        select new ReferidosList
                        {
                            FechaCreacion = a.FechaCreacion,
                            Cedula = b.NationalId,
                            NombreCompleto = b.FullName,
                            Nivel = a.NivelId
                        };

            //return View(referral.Where(x => x.Username == User.Identity.Name).OrderByDescending(x => x.Created).ToList());
            return View(query.ToList().OrderBy(x => x.Nivel));
        }

        // GET: Referrals/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Referrals/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Username,NationalId,FullName,Phone")] Referral referral)
        {
            if (ModelState.IsValid)
            {
                if (db.Referral.Any(x => x.NationalId == referral.NationalId) == true)
                {
                    TempData["Alert"] = new Alert("danger", "El referido ya existe.");
                }
                else
                {
                    referral.Created = DateTime.Now;
                    referral.Username = User.Identity.Name;
                    db.Referral.Add(referral);
                    db.SaveChanges();
                }

                return RedirectToAction("Index");
            }

            ViewBag.Username = new SelectList(db.User, "Username", "Password", referral.Username);
            return View(referral);
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
