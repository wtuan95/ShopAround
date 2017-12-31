using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ShopAround.Models;
namespace ShopAround.Admin.Pages.QLBaiViet
{
    public partial class Delete : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int maBV = int.Parse(Request.QueryString["maBV"].ToString());
            ShopAroundEntities db = new ShopAroundEntities();
            TinTuc model = db.TinTucs.Find(maBV);
            if (model != null)
            {
                db.TinTucs.Remove(model);
                db.SaveChanges();
            }
            Response.Redirect("Default.aspx", false);

        }
    }
}