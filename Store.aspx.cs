using ShopAround.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShopAround
{
    public partial class Store : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public IQueryable<SanPham> GetProducts([RouteData("idCategory")] int? phanloaiID, [RouteData("idGroupProduct")] int? nhomsanphamID )
        {
            ShopAroundEntities db = new ShopAroundEntities();
            var products = db.SanPhams.Include("NhomSanPham").OrderByDescending(m=>m.MaSanPham);
            message.Text = "Danh sách sản phẩm";
            
            if(phanloaiID.HasValue)
            {
                PhanLoai phanLoai = db.PhanLoais.Find(phanloaiID);
                if(phanLoai == null)
                {
                    Response.Redirect("~/PageNotFound.aspx");
                }
                products = products.Where(m => m.NhomSanPham.PhanLoaiID == phanloaiID).OrderByDescending(m=>m.MaSanPham);
               
                message.Text = "Danh sách sản phẩm theo phân loại " + phanLoai.TenPhanLoai;
            }
            if(nhomsanphamID.HasValue)
            {
                NhomSanPham nhomSanPham = db.NhomSanPhams.Find(nhomsanphamID);
                if(nhomSanPham == null)
                {
                    Response.Redirect("~/PageNotFound.aspx");
                }
                products = products.Where(m => m.NhomSanPhamID == nhomsanphamID).OrderByDescending(m => m.MaSanPham);
                message.Text = "Danh sách sản phẩm theo nhóm " + nhomSanPham.TenNhom;
            }
            Page.Title = message.Text;
            message.Text += "( " + products.Count().ToString() + " sản phẩm )";
            return products;
        }
    }
}