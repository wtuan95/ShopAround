using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ShopAround.Models;
namespace ShopAround
{
    public partial class Articles : System.Web.UI.Page
    {
        ShopAroundEntities db = new ShopAroundEntities();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public IQueryable<TinTuc> GetPosts()
        {
            return db.TinTucs.Where(m=>m.daDuyet == true).OrderByDescending(m => m.maBV);
        }
    }
}