using AgropuliApp.Models;
using System;
using System.Linq;
using System.Web.Mvc;

namespace AgropuliApp.Controllers
{
    public class BaseController : Controller
    {
        public AgropuliEntities db = new AgropuliEntities();

        public User GetUser(string username)
        {
            return db.User.FirstOrDefault(x => x.Username == username);
        }

        protected override void OnException(ExceptionContext filterContext)
        {
            if (filterContext.ExceptionHandled)
            {
                return;
            }

            db.Log.Add(new Log() { LogDateTime = DateTime.Now, Message = filterContext.Exception.ToString() });
            db.SaveChanges();

            TempData["Error"] = filterContext.Exception;

            filterContext.Result = new ViewResult
            {
                ViewName = "~/Views/App/Error.cshtml",
            };

            filterContext.ExceptionHandled = true;
        }
    }
}