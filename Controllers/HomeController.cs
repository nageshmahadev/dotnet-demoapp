using System;
using Microsoft.AspNetCore.Http.Features;
using Microsoft.AspNetCore.Mvc;
using DotnetDemoApp.ViewModels;

namespace DotnetDemoApp.Controllers
{
    public class HomeController : Controller
    {
        public IActionResult Index()
        {
            ViewBag.whereami = (System.IO.File.Exists("/.dockerenv")) ? "I am running in a Docker container!" : "I am not running in Docker :(";

            return View();
        }

        public IActionResult About()
        {
            ViewData["Message"] = "Demo App - description page.";
            HomeAboutViewModel model = new HomeAboutViewModel();

            model.container = (System.IO.File.Exists("/.dockerenv")) ? "Docker" : "Regular process";
            model.host = Environment.MachineName;
            model.os = System.Runtime.InteropServices.RuntimeInformation.OSDescription;
            model.procs = Environment.ProcessorCount.ToString();
            model.arch = System.Runtime.InteropServices.RuntimeInformation.ProcessArchitecture.ToString();
            model.framework = System.Runtime.InteropServices.RuntimeInformation.FrameworkDescription;

            var httpConnectionFeature = this.ControllerContext.HttpContext.Features.Get<IHttpConnectionFeature>();
            model.ip = httpConnectionFeature?.LocalIpAddress.ToString();

            return View(model);
        }

        public IActionResult Contact()
        {
            ViewData["Message"] = "Your contact page.";

            return View();
        }

        public IActionResult Error()
        {
            return View();
        }
    }
}
