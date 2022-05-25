using Microsoft.AspNetCore.Mvc;

namespace agropuli.Controllers
{
    public class AppController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }

        public IActionResult Menu()
        {
            return View();
        }

        public IActionResult Products()
        {
            return View();
        }
    }
}