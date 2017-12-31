using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ShopAround.Models;
namespace ShopAround.Admin.Pages.QLDonHang
{
    /// <summary>
    /// Summary description for Edit
    /// </summary>
    public class Edit : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            ShopAroundEntities db = new ShopAroundEntities();
            int DatHangID = int.Parse(context.Request.QueryString["DatHangID"]);
            DatHang model = db.DatHangs.Find(DatHangID);
            if (model != null)
            {
                model.TrangThai = !model.TrangThai;
                db.Entry(model).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
            }
            context.Response.Redirect(context.Request.UrlReferrer.ToString(), false);
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}