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
            int index = Keyword.Text.LastIndexOf('.');

            string keyword = Keyword.Text.Trim();
            if(index >= 0)
            {
                keyword = keyword.Remove(index, 1);
            }
            if(PrinceFrom.Text != string.Empty && PrinceTo.Text != string.Empty)
            Response.Redirect(GetRouteUrl("SearchResultRoute", new { keyword = keyword, princefrom = int.Parse(PrinceFrom.Text), princeto = int.Parse(PrinceTo.Text) }));
            else
            {
                Response.Redirect(GetRouteUrl("SearchResultRoute", new { keyword = keyword, princefrom = 0, princeto = 0 }));
            }
        }
    }
}