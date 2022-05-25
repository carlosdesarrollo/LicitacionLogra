using Microsoft.AspNetCore.Mvc;

namespace agropuli.Controllers
{
    public class HomeController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
