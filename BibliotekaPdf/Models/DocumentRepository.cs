using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BibliotekaPdf.Models
{
    public class DocumentRepository
    {
        private DocumentsDBEntities _context = new DocumentsDBEntities();

        public void Add(Document d)
        {
            _context.Document.AddObject(d);
        }

        public bool Delete(int id)
        {
            Document d = GetById(id);
            if (d != null)
            {
                _context.DeleteObject(d);
                //_context.SaveChanges();
                return true;
            }

            return false;
        }

        public bool Delete(Document d)
        {
            if (d != null)
            {
                //_context.ObjectStateManager.ChangeObjectState(d, System.Data.EntityState.Deleted);
                _context.DeleteObject(GetById(d.Id));
                //_context.SaveChanges();
                return true;
            }

            return false;
        }

        public IEnumerable<Document> GetAll()
        {
            return _context.Document;
        }

        public Document GetById(int id)
        {
            
            foreach (Document d in _context.Document)
            {
                if (d.Id == id)
                    return d;
            }
            return null;
        }

        public void Update(Document d)
        {
            Document doc = GetById(d.Id);

            doc.Title = d.Title;
            doc.Authors = d.Authors;
            doc.Description = d.Description;
            doc.Rating = d.Rating;
        }

        public void Commit()
        {
            try
            {
                _context.SaveChanges();
            }
            catch (Exception e) { }
        }
    }
}