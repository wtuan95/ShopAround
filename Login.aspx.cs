using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ShopAround.Models;
namespace ShopAround
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            ShopAroundEntities db = new ShopAroundEntities();
            QuanTri userCurrent = db.QuanTris.SingleOrDefault(m => m.tkThanhVien == txtTaiKhoan.Value && m.matKhau == txtMatKhau.Value);
            if (userCurrent != null)
            {
                Session["tk"] = userCurrent;
                Session["tkThanhVien"] = userCurrent.tkThanhVien;
                if(Request.QueryString["returnUrl"] != null)
                {
                    Response.Redirect(Request.QueryString["returnUrl"], false);
                }
                else 
                Response.Redirect("/Admin", false);
            }
            else
            {
                lblLoi.InnerText = "Sai tài khoản hoặc mật khẩu!";
            }
        }
    }
}