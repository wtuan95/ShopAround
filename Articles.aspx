<%@ Page Title="Tin tức thời trang mới nhất, hot nhất được cập nhật thường xuyên" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Articles.aspx.cs" Inherits="ShopAround.Articles" %>
<asp:Content ID="Content1" ContentPlaceHolderID="StylesContent" runat="server">
  <link href="/Content/pager.css" rel="stylesheet" />
           <style>
    
.tintucContainer > div {
  margin: 20px;
}

.tintucContainer ul {
  list-style-type: none;
}

.tintucContainer li h3 {
  font: bold 16px/1.5 Helvetica, Verdana, sans-serif;
  text-transform: capitalize;
}

.tintucContainer li img {
  float: left;
  margin: 0 15px 0 0;
}

.tintucContainer li p {
  font-size:14px;
  font-family: 'Times New Roman', Times, serif;
}

.tintucContainer li {
  padding: 10px 0px;
  overflow: auto;
}

.tintucContainer li:hover {
  background: #eee;
  cursor: pointer;
}
                    .popupSocial{
z-index:999; text-align:center;
background:#2c4584; position:fixed; 
top:45%; left:10px; padding:20px 10px; 
border:1px solid #333; border-radius:10px;
  } 
@media screen and (max-width:768px){
 .popupSocial{
display:none;
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
       <div id="fb-root"></div>
    <script>(function (d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = 'https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v2.11&appId=1128251490551907';
    fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>
    <div class="popupSocial">
        <div class="fb-like" data-href="UrlTrangweb" data-layout="box_count" data-action="like" data-size="small" data-show-faces="true" data-share="true"></div>
        <br />
        <br />
        <div style="width: 60px">
            <script src="https://apis.google.com/js/platform.js" async defer></script>
            <g:plusone></g:plusone>
        </div>
    </div>
    <div class="box"><h2>Tin tức</h2></div>
    <div class="tintucContainer container">
        <div class="row">
            <div class="col-md-12" style="padding-left: 0px">
                <asp:ListView ID="lvBaiVietMoi" runat="server" SelectMethod="GetPosts"   DataKeyNames="maBV">

                    <EmptyDataTemplate>
                        Chưa có bài viết nào.
                    </EmptyDataTemplate>

                    <ItemTemplate>
                        <li>
                            <a href="<%# GetRouteUrl("PostContentRoute",new { bidanh = Eval("biDanh") }) %>"><img width="180" height="108" src="/Photos/Posts/<%# Eval("hinhDD") %>" alt="<%# Eval("hinhDD") %>" /></a>
                            <a  style="color:#000;text-decoration:none" href="<%# GetRouteUrl("PostContentRoute",new { bidanh = Eval("biDanh") }) %>"><h3><%# Eval("tenBV") %></h3></a>
                            <p><%# Eval("ndTomTat") %></p>
                        </li>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <ul id="itemPlaceholderContainer" runat="server" style="">
                            <li runat="server" id="itemPlaceholder" />
                        </ul>
                        <div style="clear:both;text-align:center;margin:10px 0px" >
                            <asp:DataPager ID="DataPager1" PageSize="5" QueryStringField="page" runat="server">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonCssClass="page" ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                    <asp:NumericPagerField CurrentPageLabelCssClass="page active" NumericButtonCssClass="page" ButtonType="Button"  />
                                    <asp:NextPreviousPagerField ButtonCssClass="page" ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                </Fields>
                            </asp:DataPager>
                        </div>
                    </LayoutTemplate>


                </asp:ListView>

                
            </div>

        </div>

    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
</asp:Content>
