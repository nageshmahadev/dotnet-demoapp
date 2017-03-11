using System;
using Microsoft.AspNetCore.Http.Features;
using Microsoft.AspNetCore.Mvc;

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
            ViewData["Message"] = "Your application description page.";
            
            ViewBag.container = (System.IO.File.Exists("/.dockerenv")) ? "Docker" : "Regular process";
            ViewBag.host = Environment.MachineName;
            ViewBag.os = System.Runtime.InteropServices.RuntimeInformation.OSDescription;
            ViewBag.procs = Environment.ProcessorCount;
            ViewBag.arch = System.Runtime.InteropServices.RuntimeInformation.ProcessArchitecture;
            ViewBag.frame = System.Runtime.InteropServices.RuntimeInformation.FrameworkDescription;

            var httpConnectionFeature = this.ControllerContext.HttpContext.Features.Get<IHttpConnectionFeature>();
            ViewBag.ip = httpConnectionFeature?.LocalIpAddress;

            return View();
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
