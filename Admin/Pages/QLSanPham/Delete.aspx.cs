using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ShopAround.Models;
namespace ShopAround.Admin.Pages.QLSanPham
{
    public partial class Delete : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int MaSanPham = int.Parse(Request.QueryString["MaSanPham"].ToString());
            ShopAroundEntities db = new ShopAroundEntities();
            SanPham spXoa = db.SanPhams.Find(MaSanPham);
            if (spXoa != null)
            {
                db.SanPhams.Remove(spXoa);
                db.SaveChanges();
            }
            Response.Redirect("Default.aspx", false);

        }
    }
}