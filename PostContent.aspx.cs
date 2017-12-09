using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ShopAround.Models;
using System.Web.ModelBinding;

namespace ShopAround
{
    public partial class PostContent : System.Web.UI.Page
    {
        ShopAroundEntities db = new ShopAroundEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            string bidanh = RouteData.Values["bidanh"].ToString();
            TinTuc tin = db.TinTucs.SingleOrDefault(m => m.biDanh == bidanh);
            if(tin == null || tin.daDuyet == false)
            {
                Response.RedirectToRoute("PageNotFound");
            }
            else
            {
                tin.soLanDoc++;
                db.Entry(tin).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
                Page.Title = tin.tenBV;
            }
        }
        public TinTuc GetPost([RouteData] string bidanh)
        {
            TinTuc tin = db.TinTucs.Single(m => m.biDanh == bidanh);
            return tin;
        }
        
    }
}