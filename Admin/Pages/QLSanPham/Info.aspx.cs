using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ShopAround.Models;
using System.Web.ModelBinding;

namespace ShopAround.Admin.Pages.QLSanPham
{
    public partial class Info : System.Web.UI.Page
    {
        ShopAroundEntities db = new ShopAroundEntities();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public SanPham ViewDetail(int MaSanPham)
        {
            return db.SanPhams.Find(MaSanPham);
        }

        public void Edit(int MaSanPham, string TenSanPham, int NhomSanPhamID, int DonGia, string Hinh, string BiDanh, string ndTomTat, string ndDayDu, string tkThanhVien)
        {
            SanPham model = db.SanPhams.Find(MaSanPham);
            if(model != null)
            {
                model.TenSanPham = TenSanPham;
                model.NhomSanPhamID = NhomSanPhamID;
                model.DonGia = DonGia;
                if (!string.IsNullOrEmpty(Hinh))
                {
                    model.Hinh = Hinh;
                }
                model.BiDanh = BiDanh;
                model.ndTomTat = ndTomTat;
                model.ndDayDu = ndDayDu;
                model.tkThanhVien = tkThanhVien;
                model.NgayCapNhat = DateTime.Now;
                db.Entry(model).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
            }
        }

        protected void frmViewSanPham_ItemUpdating(object sender, FormViewUpdateEventArgs e)
        {
            FileUpload f = frmViewSanPham.FindControl("fileHinhDaiDien") as FileUpload;
            if(f.HasFile && f.FileContent.Length > 0)
            {
                FileInfo fInfole = new FileInfo(f.FileName);
                string extend = fInfole.Extension;
                if (extend == ".jpg" || extend == ".jpeg" || extend == ".png")
                {
                    string hinhDaiDienMoi = e.NewValues["BiDanh"] + DateTime.Now.Ticks.ToString() + extend;
                    objSourceSanPham.UpdateParameters["Hinh"].DefaultValue = hinhDaiDienMoi;
                    f.SaveAs(Server.MapPath("~/Photos/Products/"+ hinhDaiDienMoi));
                }
            }
            else
            {
                objSourceSanPham.UpdateParameters["Hinh"].DefaultValue = null;
            }
        }
    }
}