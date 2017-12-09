using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ShopAround.Models;
namespace ShopAround
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Title = "Shop thời trang nam nữ cực cool";
        }
        public IList<SanPham> GetNewProducts()
        {
            ShopAroundEntities db = new ShopAroundEntities();
            return db.SanPhams.Include("NhomSanPham").OrderByDescending(m => m.MaSanPham).Take(9).ToList();
        }
    }
}