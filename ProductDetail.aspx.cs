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
    public partial class ProductDetail : System.Web.UI.Page
    {
        ShopAroundEntities db = new ShopAroundEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            int id = int.Parse(RouteData.Values["id"].ToString());
            SanPham sp = db.SanPhams.Find(id);
            if(sp == null)
            {
                Response.RedirectToRoute("PageNotFound");
            }
            else
            {
                Page.Title = sp.TenSanPham;
            }
        }
        public SanPham GetProduct([RouteData("id")] int MaSanPham, [RouteData("alias")] string BiDanh)
        {
            
            SanPham sanPham = db.SanPhams.Include("NhomSanPham").SingleOrDefault(m=>m.MaSanPham == MaSanPham);
            return sanPham;
        }
        public IList<SanPham> GetRelatedProducts([RouteData("id")] int MaSanPham)
        {
            SanPham sanPham = db.SanPhams.Find(MaSanPham);
            if(sanPham != null)
            {
                int count = db.SanPhams.Count(m => m.NhomSanPhamID == sanPham.NhomSanPhamID);
                Random random = new Random();
                int skipNum = count > 3 ? random.Next(0, count - 3) : 0;
                return db.SanPhams.Where(m => m.NhomSanPhamID == sanPham.NhomSanPhamID && m.MaSanPham != MaSanPham).OrderBy(m=>m.MaSanPham).Skip(skipNum).Take(3).ToList();
            }
            return null;
        }
    }
}