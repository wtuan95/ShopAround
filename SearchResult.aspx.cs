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
        public IQueryable<SanPham> GetSearchResult([RouteData] string keyword, [RouteData] int? princefrom, [RouteData]  int? princeto)
        {
            ShopAroundEntities db = new ShopAroundEntities();
            var result = db.SanPhams.Include("NhomSanPham").Where(m => m.TenSanPham.ToLower().Contains(keyword.ToLower()));
            if (princefrom.HasValue && princeto.HasValue && princefrom.Value != 0)
            {
                result = result.Where(m => m.DonGia >= princefrom && m.DonGia <= princeto);
            }
            countresult.InnerText = result.Count().ToString();
            return result.OrderBy(m=>m.TenSanPham) ;
        }
    }
}