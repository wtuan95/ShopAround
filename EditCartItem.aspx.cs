using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ShopAround.Models;
namespace ShopAround
{
    public partial class EditCartItem : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["shoppingcart"] != null && Request.QueryString["id"] != null && Request.QueryString["change"] != null)
            {
                int maSanPham;
                if(int.TryParse(Request.QueryString["id"].ToString(), out maSanPham))
                {
                    List<CartItem> shopppingCart = Session["shoppingcart"] as List<CartItem>;
                    CartItem cardItemEdit = shopppingCart.Single(m => m.MaSanPham == maSanPham);
                    if(Request.QueryString["change"] == "plus")
                    {
                        cardItemEdit.SoLuong++;
                    }
                    else
                    {
                        if(cardItemEdit.SoLuong > 1)
                        {
                            cardItemEdit.SoLuong--;
                        }
                        
                    }
                } 
            }
                Response.Redirect("giohang");
        }
    }
}