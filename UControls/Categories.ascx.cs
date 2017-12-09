using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ShopAround.Models;
namespace ShopAround.UControls
{

    
    public partial class Categories : System.Web.UI.UserControl
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
            ShopAroundEntities db = new ShopAroundEntities();
            var dsPhanLoai = db.PhanLoais.Include("NhomSanPhams").ToList();
            string s = "";
            foreach(PhanLoai phanLoai in dsPhanLoai)
            {
                s += string.Format("<li><a href='{0}'>{1}</a>", GetRouteUrl("ProductByCategoryRoute", new { idCategory = phanLoai.PhanLoaiID, aliasCategory = phanLoai.BiDanh}), phanLoai.TenPhanLoai);
                s += "<ul class='nhomsp'>";
                foreach(NhomSanPham nhomSanPham in phanLoai.NhomSanPhams.ToList())
                {
                    s += string.Format("<li><a href='{0}'>{1}</a></li>", GetRouteUrl("ProductByGroupProductRoute", new { idGroupProduct = nhomSanPham.NhomSanPhamID, aliasGroupProduct=nhomSanPham.BiDanh}), nhomSanPham.TenNhom);
                }
                s += "</ul></li>";
            }
            dsPhanLoai_NhomSP.Text = s;
        }
        
    }
}