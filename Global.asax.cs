using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;

namespace ShopAround
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
            RegisterCustomRoute(RouteTable.Routes);
            Application["useronline"] = 0;
            Application["tongtruycap"] = 0;
            Application["truycaphomnay"] = new Dictionary<DateTime, int>();
            (Application["truycaphomnay"] as Dictionary<DateTime, int>)[new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day)] = 0;
        }
        void RegisterCustomRoute(RouteCollection routes)
        {
            routes.MapPageRoute("HomeRoute", "trangchu", "~/Default.aspx");
            routes.MapPageRoute("ContactRoute", "lienhe", "~/Contact.aspx");
            routes.MapPageRoute("AboutRoute", "gioithieu", "~/About.aspx");
            routes.MapPageRoute("NewsRoute", "tintuc", "~/Articles.aspx");
            routes.MapPageRoute("PostContentRoute", "tintuc/{bidanh}", "~/PostContent.aspx");
            routes.MapPageRoute("StoreRoute", "cuahang", "~/Store.aspx");
            routes.MapPageRoute("OrderSuccessRoute", "dathangthanhcong", "~/OrderSuccess.aspx");
            routes.MapPageRoute("AddProductToCartRoute", "themvaogio", "~/AddProductToCart.aspx");
            routes.MapPageRoute("EditCartItemRoute", "suasoluong", "~/EditCartItem.aspx");
            routes.MapPageRoute("DeleteCartItemRoute", "xoakhoigio", "~/DeleteCartItem.aspx");
            routes.MapPageRoute("SearchResultRoute", "ketquatim", "~/SearchResult.aspx");
            routes.MapPageRoute("ShoppingCartRoute", "giohang", "~/ShoppingCart.aspx");
            routes.MapPageRoute("ProductDetailRoute", "chitiet/{alias}-{id}", "~/ProductDetail.aspx");
            routes.MapPageRoute("ProductByCategoryRoute", "theoloai/{aliasCategory}-{idCategory}", "~/Store.aspx");
            routes.MapPageRoute("ProductByGroupProductRoute", "theonhom/{aliasGroupProduct}-{idGroupProduct}", "~/Store.aspx");
            routes.MapPageRoute("PageNotFound", "pagenotfound", "~/PageNotFound.aspx");
        }
        void Session_Start(object sender, EventArgs e)
        {
            Application.Lock();
            Application["useronline"] = (int)Application["useronline"] + 1;
            Application["tongtruycap"] = (int)Application["tongtruycap"] + 1;
            if((Application["truycaphomnay"] as Dictionary<DateTime, int>).ContainsKey(new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day)) == false)
            {
                (Application["truycaphomnay"] as Dictionary<DateTime, int>)[new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day)] = 0;

            }
            (Application["truycaphomnay"] as Dictionary<DateTime, int>)[new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day)] = (int)(Application["truycaphomnay"] as Dictionary<DateTime, int>)[new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day)] + 1;
            Application.UnLock();
        }
        void Session_End(object sender, EventArgs e)
        {
            Application.Lock();
            Application["useronline"] = (int)Application["useronline"] - 1;
            Application.UnLock();
        }
        void Application_End(object sender, EventArgs e)
        {
            // Code that runs on application startup
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
            RegisterCustomRoute(RouteTable.Routes);
        }
    }
}