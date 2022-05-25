using System.Collections.Generic;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Web.Mvc;

namespace AgropuliApp.Areas.Admin.Controllers
{
    [Authorize]
    public class AppController : BaseController
    {
        public ActionResult Menu()
        {
            return View();
        }

        [HttpGet]
        public ActionResult Accountant(string username)
        {
            List<string> photos = Directory.GetFiles(Server.MapPath("~/photos"), username + "*.*").OrderByDescending(x => x).ToList();

            return View(photos);
        }

        [HttpGet]
        public ActionResult Referrals(string username)
        {
            return View(db.Referral.Where(x => x.Username == username).OrderByDescending(x => x.Created).ToList());
        }

        [HttpGet]
        public ActionResult Favors()
        {
            return View(db.Favor.Include(x => x.User).OrderByDescending(x => x.Created).ToList());
        }

        [HttpGet]
        public ActionResult Logs()
        {
            return View(db.Log.OrderByDescending(x => x.LogDateTime).ToList());
        }

        [HttpGet]
        public ActionResult Error()
        {
            return View();
        }
    }
}