using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ShopAround.Models;
namespace ShopAround
{
    public partial class ShoppingCart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnXacNhan_Click(object sender, EventArgs e)
        {
            Page.Validate("validationOrder");
            if(Page.IsValid)
            {
                ShopAroundEntities db = new ShopAroundEntities();
                try
                {
                    DatHang datHangMoi = new DatHang()
                    {
                        HoDem = txtHoDem.Value,
                        Ten = txtTen.Value,
                        SDT = txtSDT.Value,
                        Email = txtEmail.Value,
                        DiaChi = txtDiaChi.Value,
                        NgayDatHang = DateTime.Today,
                        GioiTinh = rdoNam.Checked,
                        TongSoLuong = byte.Parse(((List<CartItem>)Session["shoppingcart"]).Sum(m => m.SoLuong).ToString()),
                        TongThanhTien = ((List<CartItem>)Session["shoppingcart"]).Sum(m => m.ThanhTien),
                        TrangThai = false

                    };
                    db.DatHangs.Add(datHangMoi);
                    db.SaveChanges();
                    foreach(CartItem cardItem in ((List<CartItem>)Session["shoppingcart"]))
                    {
                        ChiTietDatHang chiTietDH = new ChiTietDatHang()
                        {
                            DatHangID = datHangMoi.DatHangID,
                            MaSanPham = cardItem.MaSanPham,
                            DonGia = cardItem.DonGia,
                            SoLuong = cardItem.SoLuong,
                            ThanhTien = cardItem.ThanhTien
                        };
                        db.ChiTietDatHangs.Add(chiTietDH);
                    }
                    db.SaveChanges();
                    Response.Redirect("~/dathangthanhcong");
                }
                catch
                {
                    
                    Message.InnerText = "Xảy ra lỗi khi xử lý ở server.";

                }
            }
        }
    }
}