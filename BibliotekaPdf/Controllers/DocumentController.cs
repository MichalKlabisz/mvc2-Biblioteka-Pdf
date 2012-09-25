using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BibliotekaPdf.Models;

namespace BibliotekaPdf.Controllers
{
    public class DocumentController : Controller
    {

        private DocumentRepository _db = new DocumentRepository();

        //
        // GET: /Document/

        public ActionResult Index()
        {
            return PartialView(_db.GetAll());
        }

        public ActionResult ListAll()
        {
            return PartialView(_db.GetAll());
        }

        //
        // GET: /Document/Details/5

        public ActionResult Details(int id)
        {
            return PartialView(_db.GetById(id));
        }

        //
        // GET: /Document/Create

        public ActionResult Create()
        {
            return PartialView();
        } 

        //
        // POST: /Document/Create

        [HttpPost]
        public ActionResult Create(Document d)
        {
            if (!ModelState.IsValid)
            {
                ViewData["errors"] = ModelState.Values.SelectMany(v => v.Errors);
                return PartialView(d);
            }

            foreach (string f in Request.Files)
             {
                 HttpPostedFileBase file = Request.Files[f];
                 if (file.ContentLength > 0)
                 {
                     string filePath = Path.Combine(HttpContext.Server.MapPath("/Content/Uploads")
                             , Path.GetFileName(file.FileName));
                     file.SaveAs(filePath);
                     d.FilePath = "/Pdf/" + Path.GetFileNameWithoutExtension(file.FileName);
                 }
             }

            _db.Add(d);
            _db.Commit();

            return PartialView("ListAll", _db.GetAll());
        }
        
        //
        // GET: /Document/Edit/5
 
        public ActionResult Edit(int id)
        {
            return PartialView(_db.GetById(id));
        }

        //
        // POST: /Document/Edit/5

        [HttpPost]
        public ActionResult Edit(Document d)
        {
            if (!ModelState.IsValid)
            {
                return PartialView("Edit", d);
            }

            _db.Update(d);
            _db.Commit();

            return PartialView("Details", d);
        }
  
        //
        // POST: /Document/Delete/5

        [HttpPost]
        public ActionResult Delete(Document d)
        {
            //var f = GetFile(_db.GetById(d.Id).FilePath);
            _db.Delete(d);
            _db.Commit();
            return PartialView("ListAll", _db.GetAll());
        }


        public ActionResult GetFile(String name)
        {
            var dir = Server.MapPath("/Content/Uploads");
            var path = Path.Combine(dir, name + ".pdf");
            return base.File(path, "application/pdf");
        }
    }
}
