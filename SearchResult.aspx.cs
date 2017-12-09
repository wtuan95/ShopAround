using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ShopAround.Models;
using System.Web.ModelBinding;
namespace ShopAround
{
    public partial class SearchResult : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
   
        }
        public IQueryable<SanPham> GetSearchResult([QueryString] string keyword, [QueryString] int? princefrom, [QueryString]  int? princeto)
        {
            ShopAroundEntities db = new ShopAroundEntities();
            if (string.IsNullOrEmpty(keyword) == false)
            {
                var result = db.SanPhams.Include("NhomSanPham").Where(m => m.TenSanPham.ToLower().Contains(keyword.ToLower()));
                countresult.InnerText = result.Count().ToString();
                return result.OrderBy(m => m.TenSanPham);
            }
            else
            {
                var result = db.SanPhams.Include("NhomSanPham").Where(m => m.DonGia >= princefrom.Value && m.DonGia <= princeto.Value);
                countresult.InnerText = result.Count().ToString();
                return result.OrderBy(m => m.TenSanPham);
            }
           
        }
    }
}