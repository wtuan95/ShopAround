<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ShopAround._Default" %>

<asp:Content runat="server" ContentPlaceHolderID="StylesContent" >
    <link href="Content/jquery.bxslider.css" rel="stylesheet" />
    <style>
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

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
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
    <!-- Content Slider -->
    <div id="slider" class="box">
        <div id="slider-holder">
            <ul>
                <li><a href="#">
                    <img runat="server" src="~/Images/slide1.jpg" alt="" /></a></li>
                <li><a href="#">
                    <img runat="server" src="~/Images/slide2.jpg" alt="" /></a></li>
                <li><a href="#">
                    <img runat="server" src="~/Images/slide3.jpg" alt="" /></a></li>
                <li><a href="#">
                    <img runat="server" src="~/Images/slide4.jpg" alt="" /></a></li>
            </ul>
        </div>
        <div id="slider-nav"><a href="#" class="active">1</a> <a href="#">2</a> <a href="#">3</a> <a href="#">4</a> </div>
    </div>
    <!-- End Content Slider -->
    <div class="box"><h2>Mới cập nhật</h2></div>
    <!-- Products -->
    <div class="products">
        <div class="cl">&nbsp;</div>
        <asp:ListView ID="lstProducts" runat="server" ItemType="ShopAround.Models.SanPham" SelectMethod="GetNewProducts" DataKeyNames="MaSanPham" GroupItemCount="9">
            <ItemTemplate>
                <li class="slide" runat="server"><a href="<%#: GetRouteUrl("ProductDetailRoute", new {alias=Item.BiDanh, id = Item.MaSanPham}) %>">
                    <img width="230" height="300" src="/Photos/Products/<%#: Item.Hinh %>" alt="" /></a>
                    <div class="product-info">
                        <h3><%#: Item.TenSanPham %></h3>
                        <div class="product-desc">
                            <h4><%#: Item.NhomSanPham.TenNhom %></h4>
                            <strong class="price"><%#: Item.DonGia.ToString("#,##0") %> đ</strong>
                        </div>
                    </div>
                </li>

            </ItemTemplate>
            <GroupTemplate>
                <ul class="slider2" id="itemPlaceholderContainer" runat="server">
                    <li id="itemPlaceholder" runat="server"></li>
                </ul>
            </GroupTemplate>
            <EmptyDataTemplate>
                <h3>Không có dữ liệu.</h3>
            </EmptyDataTemplate>
            <LayoutTemplate>
                <ul class="lstProduct" runat="server" id="groupPlaceholderContainer">
                    <li runat="server" id="groupPlaceholder"></li>
                </ul>
            </LayoutTemplate>

        </asp:ListView>
        <div class="cl">&nbsp;</div>
    </div>
    <!-- End Products -->
</asp:Content>
<asp:Content ContentPlaceHolderID="ScriptsContent" runat="server">
    <script src="Scripts/jquery.bxslider.min.js"></script>
    
    <script>
        $(function () {

            $('.slider2').bxSlider({
                slideWidth: 230,
                minSlides: 3,
                maxSlides: 6,
                slideMargin: 25
            });
        });
    </script>
</asp:Content>
