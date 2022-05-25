using AgropuliApp.Models;
using System;
using System.Data.Entity;
using System.Linq;
using System.Web.Mvc;

namespace AgropuliApp.Controllers
{
    public class UserController : BaseController
    {
        [AllowAnonymous]
        [HttpGet]
        public ActionResult Create()
        {
            var qtypeclient = db.TypeClient.Where(x => x.Estado == 1).ToList();
            var qproveedor = db.TypeProveedor.Where(x => x.Estado == 1).ToList();
            var qdepart = db.Departmento.Where(x => x.Estado == 1).ToList();

            ViewBag.TypeClientes = qtypeclient;
            ViewBag.Proveedor = qproveedor;
            ViewBag.Departamento = qdepart;

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
                model.RoleId = 2;
                db.User.Add(model);
                db.SaveChanges();

                if (model.ClientId == 2)
                {
                    var userRef = db.User.Where(x => x.NationalId == model.CedulaRef).First();

                    UsuNivelRef entRef = new UsuNivelRef();
                    entRef.UsuarioName = userRef.Username;
                    entRef.NivelId = 1;
                    entRef.UsuarioReg = model.Username;
                    entRef.Estado = 1;
                    entRef.FechaCreacion = DateTime.Now;

                    db.UsuNivelRef.Add(entRef);
                    db.SaveChanges();

                    var nivelUsuP = db.UsuNivelRef.Where(x => x.UsuarioReg == userRef.Username && x.NivelId == 1).FirstOrDefault();

                    if (nivelUsuP != null)
                    {
                        UsuNivelRef entRefN1 = new UsuNivelRef();
                        entRefN1.UsuarioName = nivelUsuP.UsuarioName;
                        entRefN1.NivelId = 2;
                        entRefN1.UsuarioReg = model.Username;
                        entRefN1.Estado = 1;
                        entRefN1.FechaCreacion = DateTime.Now;

                        db.UsuNivelRef.Add(entRefN1);
                        db.SaveChanges();

                        var nivelUsuNivel3 = db.UsuNivelRef.Where(x => x.UsuarioReg == nivelUsuP.UsuarioName && x.NivelId == 1).FirstOrDefault();

                        if (nivelUsuNivel3 != null)
                        {
                            UsuNivelRef entRefN2 = new UsuNivelRef();
                            entRefN2.UsuarioName = nivelUsuNivel3.UsuarioName;
                            entRefN2.NivelId = 3;
                            entRefN2.UsuarioReg = model.Username;
                            entRefN2.Estado = 1;
                            entRefN2.FechaCreacion = DateTime.Now;

                            db.UsuNivelRef.Add(entRefN2);
                            db.SaveChanges();
                        }
                    }

                }



                TempData["Alert"] = new Alert("success", "El usuario ha sido creado.");

                return RedirectToAction("Index", "App");
            }

            var qtypeclient = db.TypeClient.Where(x => x.Estado == 1).ToList();
            var qproveedor = db.TypeProveedor.Where(x => x.Estado == 1).ToList();
            var qdepart = db.Departmento.Where(x => x.Estado == 1).ToList();

            ViewBag.TypeClientes = qtypeclient;
            ViewBag.Proveedor = qproveedor;
            ViewBag.Departamento = qdepart;

            return View();
        }

        [HttpGet]
        public ActionResult GetSubProveedor(int id)
        {
            return Json(db.TypeSubProveedor.Where(x => x.Estado == 1 && x.IdProveedor == id).ToList(), JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public ActionResult GetCiudad(int id)
        {
            return Json(db.Ciudad.Where(x => x.Estado == 1 && x.IdDepartament == id).ToList(), JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public ActionResult Edit()
        {
            return View(GetUser(User.Identity.Name));
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
    }
}