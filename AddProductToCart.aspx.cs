using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ShopAround.Models;
namespace ShopAround
{
    public partial class AddProductToCart : System.Web.UI.Page
    {
        public List<CartItem> MyShoppingCart
        {
            get
            {
                return Session["shoppingcart"] as List<CartItem>;
            }
            set
            {
                Session["shoppingcart"] = value;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] == null)
            {
                return;
            }
            if(HttpContext.Current.Session["shoppingcart"] == null)
            {
                Session.Add("shoppingcart",new List<CartItem>());
            }
            int maSanPham = int.Parse(Request.QueryString["id"]);
            CartItem newItem = MyShoppingCart.FirstOrDefault(m => m.MaSanPham == maSanPham);
            if(newItem != null)
            {
                newItem.SoLuong++;
            }
            else
            {
                ShopAroundEntities db = new ShopAroundEntities();
                SanPham sanPham = db.SanPhams.Find(maSanPham);
                newItem = new CartItem()
                {
                    MaSanPham = maSanPham,
                    TenSanPham = sanPham.TenSanPham,
                    DonGia = sanPham.DonGia,
                    Hinh = sanPham.Hinh,
                    SoLuong = 1
                };
                MyShoppingCart.Add(newItem);
            }
            if(Request.QueryString["buynow"] == null)
            Response.Redirect(Request.UrlReferrer.ToString());
            else
            {
                Response.Redirect("giohang");
            }
        }
    }
}