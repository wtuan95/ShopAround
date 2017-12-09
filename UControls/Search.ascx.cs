using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShopAround.UControls
{
    public partial class Search : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {

            string keyword = Keyword.Text;
            Response.Redirect(GetRouteUrl("SearchResultRoute", new { keyword = keyword}));
        }

     
    }
}