using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ShopAround.Models;
using System.Web.Script.Serialization;
namespace ShopAround
{
    /// <summary>
    /// Summary description for SearchHandler
    /// </summary>
    public class SearchHandler : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string term = context.Request["term"] ?? "";
            ShopAroundEntities db = new ShopAroundEntities();
            var lstTenSanPham = db.SanPhams.Where(m => m.TenSanPham.ToLower().Contains(term.Trim().ToLower())).Select(m=>m.TenSanPham);
            JavaScriptSerializer js = new JavaScriptSerializer();
            context.Response.Write(js.Serialize(lstTenSanPham.ToList()));
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