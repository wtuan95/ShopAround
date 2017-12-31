using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Routing;
using Microsoft.AspNet.FriendlyUrls;
using ShopAround.Models;
namespace ShopAround
{
    public class SiteMobileMasterFriendlyUrlResolver : Microsoft.AspNet.FriendlyUrls.Resolvers.WebFormsFriendlyUrlResolver
    {
        protected override bool TrySetMobileMasterPage(HttpContextBase httpContext, System.Web.UI.Page page, string mobileSuffix)
        {
            return false;
            //return base.TrySetMobileMasterPage(httpContext, page, mobileSuffix);
        }
    }
    public static class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            var settings = new FriendlyUrlSettings();
            settings.AutoRedirectMode = RedirectMode.Off;
            routes.EnableFriendlyUrls(settings, new SiteMobileMasterFriendlyUrlResolver());
            
        }
    }
}
