using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ShopAround.Models;
namespace ShopAround
{
    public partial class Contact : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        
        protected void btnGui_Click(object sender, EventArgs e)
        {
            Page.Validate("validationContact");
            if (Page.IsValid)
            {
                ShopAroundEntities db = new ShopAroundEntities();
                HopThu hopThuMoi = new HopThu()
                {
                    HoTen = txtHoTen.Value,
                    DiaChi = txtDiaChi.Value,
                    Email = txtEmail.Value,
                    NgayGui = DateTime.Today,
                    NoiDung = txtNoiDung.Value
                };
                db.HopThus.Add(hopThuMoi);
                db.SaveChanges();
                string message = "Gửi thành công. Cảm ơn bạn.";
                lblMessage.Visible = true;
                lblMessage.Text = message;
                
            }
        }
    }
}