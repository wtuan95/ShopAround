using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ShopAround.Models;
namespace ShopAround.Admin.Pages.QLSanPham
{
    public partial class Create : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void frmCreateSanPham_ItemInserting(object sender, FormViewInsertEventArgs e)
        {
            if (Page.IsValid)
            {
                FileUpload f = frmCreateSanPham.FindControl("fileHinhDaiDien") as FileUpload;
                if (f.HasFile && f.FileContent.Length > 0)
                {
                    FileInfo fInfole = new FileInfo(f.FileName);
                    string extend = fInfole.Extension;
                    if (extend == ".jpg" || extend == ".jpeg" || extend == ".png")
                    {
                        string hinhDaiDienMoi = e.Values["BiDanh"] + DateTime.Now.Ticks.ToString() + extend;
                        objSourceSanPham.InsertParameters["Hinh"].DefaultValue = hinhDaiDienMoi;
                        f.SaveAs(Server.MapPath("~/Photos/Products/" + hinhDaiDienMoi));
                    }
                }
                else
                {
                    objSourceSanPham.InsertParameters["Hinh"].DefaultValue = null;
                }
            }
            
        }

        public void CreateProduct(string TenSanPham, int NhomSanPhamID, int DonGia, string Hinh, string BiDanh, string ndTomTat, string ndDayDu, string tkThanhVien)
        {
            SanPham model = new SanPham()
            {
                TenSanPham = TenSanPham,
                NhomSanPhamID = NhomSanPhamID,
                DonGia = DonGia,
                Hinh = Hinh,
                BiDanh = BiDanh,
                ndTomTat = ndTomTat,
                ndDayDu = ndDayDu,
                NgayCapNhat = DateTime.Now,
                tkThanhVien = tkThanhVien
            };
            ShopAroundEntities db = new ShopAroundEntities();
            db.SanPhams.Add(model);
            db.SaveChanges();
            
        }

        protected void frmCreateSanPham_ItemInserted(object sender, FormViewInsertedEventArgs e)
        {
            Response.Redirect("Default");
        }
    }
}