using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ShopAround.Models;
using System.Web.ModelBinding;

namespace ShopAround.Admin.Pages.QLBaiViet
{
    public partial class Info : System.Web.UI.Page
    {
        ShopAroundEntities db = new ShopAroundEntities();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public TinTuc ViewDetail(int maBV)
        {
            return db.TinTucs.Find(maBV);
        }

        public void Edit(int maBV, string tenBV, string hinhDD, string biDanh, string ndTomTat, string noiDungBV, bool daDuyet, string tkThanhVien)
        {
            TinTuc model = db.TinTucs.Find(maBV);
            if(model != null)
            {
                model.tenBV = tenBV;
                if (!string.IsNullOrEmpty(hinhDD))
                {
                    model.hinhDD = hinhDD;
                }
                model.biDanh = biDanh;
                model.ndTomTat = ndTomTat;
                model.noiDungBV = noiDungBV;
                model.tkThanhVien = tkThanhVien;
                model.daDuyet = daDuyet;
                db.Entry(model).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
            }
        }

        protected void frmViewBaiViet_ItemUpdating(object sender, FormViewUpdateEventArgs e)
        {
            if (Page.IsValid)
            {
                FileUpload f = frmViewBaiViet.FindControl("fileHinhDaiDien") as FileUpload;
                if (f.HasFile && f.FileContent.Length > 0)
                {
                    FileInfo fInfole = new FileInfo(f.FileName);
                    string extend = fInfole.Extension;
                    if (extend == ".jpg" || extend == ".jpeg" || extend == ".png")
                    {
                        string hinhDaiDienMoi = e.NewValues["biDanh"] + DateTime.Now.Ticks.ToString() + extend;
                        objSourceBaiViet.UpdateParameters["hinhDD"].DefaultValue = hinhDaiDienMoi;
                        f.SaveAs(Server.MapPath("~/Photos/Posts/" + hinhDaiDienMoi));
                    }
                }
                else
                {
                    objSourceBaiViet.UpdateParameters["hinhDD"].DefaultValue = null;
                }
            }
        }
    }
}