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
        }
        void RegisterCustomRoute(RouteCollection routes)
        {
            routes.MapPageRoute("HomeRoute", "trangchu", "~/Default.aspx");
            routes.MapPageRoute("ContactRoute", "lienhe", "~/Contact.aspx");
            routes.MapPageRoute("AboutRoute", "gioithieu", "~/About.aspx");
            routes.MapPageRoute("NewsRoute", "tintuc", "~/Articles.aspx");
            routes.MapPageRoute("StoreRoute", "cuahang", "~/Store.aspx");
            routes.MapPageRoute("OrderSuccessRoute", "dathangthanhcong", "~/OrderSuccess.aspx");
            routes.MapPageRoute("AddProductToCartRoute", "themvaogio", "~/AddProductToCart.aspx");
            routes.MapPageRoute("EditCartItemRoute", "suasoluong", "~/EditCartItem.aspx");
            routes.MapPageRoute("DeleteCartItemRoute", "xoakhoigio", "~/DeleteCartItem.aspx");
            routes.MapPageRoute("SearchResultRoute", "ketquatim/{keyword}/{princefrom}-{princeto}", "~/SearchResult.aspx");
            routes.MapPageRoute("ShoppingCartRoute", "giohang", "~/ShoppingCart.aspx");
            routes.MapPageRoute("ProductDetailRoute", "chitiet/{alias}-{id}", "~/ProductDetail.aspx");
            routes.MapPageRoute("ProductByCategoryRoute", "theoloai/{aliasCategory}-{idCategory}", "~/Store.aspx");
            routes.MapPageRoute("ProductByGroupProductRoute", "theonhom/{aliasGroupProduct}-{idGroupProduct}", "~/Store.aspx");
        }
    }
}