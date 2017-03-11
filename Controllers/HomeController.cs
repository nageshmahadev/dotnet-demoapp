using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http.Features;
using Microsoft.AspNetCore.Mvc;

namespace DotnetDemoApp.Controllers
{
    public class HomeController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }

        public IActionResult About()
        {
            ViewData["Message"] = "Your application description page.";
            
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
