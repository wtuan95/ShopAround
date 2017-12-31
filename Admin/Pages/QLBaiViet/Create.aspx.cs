using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ShopAround.Models;
namespace ShopAround.Admin.Pages.QLBaiViet
{
    public partial class Create : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void frmCreateBaiViet_ItemInserting(object sender, FormViewInsertEventArgs e)
        {
            if (Page.IsValid)
            {
                FileUpload f = frmCreateBaiViet.FindControl("fileHinhDaiDien") as FileUpload;
                if (f.HasFile && f.FileContent.Length > 0)
                {
                    FileInfo fInfole = new FileInfo(f.FileName);
                    string extend = fInfole.Extension;
                    if (extend == ".jpg" || extend == ".jpeg" || extend == ".png")
                    {
                        string hinhDaiDienMoi = e.Values["biDanh"] + DateTime.Now.Ticks.ToString() + extend;
                        objSourceBaiViet.InsertParameters["hinhDD"].DefaultValue = hinhDaiDienMoi;
                        f.SaveAs(Server.MapPath("~/Photos/Posts/" + hinhDaiDienMoi));
                    }
                }
                else
                {
                    objSourceBaiViet.InsertParameters["hinhDD"].DefaultValue = null;
                }
            }
            
        }

        public void CreateBaiViet(string tenBV, string hinhDD, string biDanh, string ndTomTat, string noiDungBV, bool daDuyet, string tkThanhVien)
        {
            TinTuc model = new TinTuc();
            model.tenBV = tenBV;
            model.hinhDD = hinhDD;
            model.biDanh = biDanh;
            model.ndTomTat = ndTomTat;
            model.noiDungBV = noiDungBV;
            model.tkThanhVien = tkThanhVien;
            model.daDuyet = daDuyet;
            model.soLanDoc = 0;
            model.ngayDang = DateTime.Now;
            ShopAroundEntities db = new ShopAroundEntities();
            db.TinTucs.Add(model);
            db.SaveChanges();
            
        }

        protected void frmCreateBaiViet_ItemInserted(object sender, FormViewInsertedEventArgs e)
        {
            Response.Redirect("Default");
        }
    }
}