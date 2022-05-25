using AgropuliApp.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace AgropuliApp.Areas.Admin.Controllers
{
    public class BaseController : Controller
    {
        public AgropuliEntities db = new AgropuliEntities();

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