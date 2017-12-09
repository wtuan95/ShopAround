<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ShopAround._Default" %>

<asp:Content runat="server" ContentPlaceHolderID="StylesContent" >
    <link href="Content/jquery.bxslider.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <!-- Content Slider -->
    <div id="slider" class="box">
        <div id="slider-holder">
            <ul>
                <li><a href="#">
                    <img runat="server" src="~/Images/slide1.jpg" alt="" /></a></li>
                <li><a href="#">
                    <img runat="server" src="~/Images/slide1.jpg" alt="" /></a></li>
                <li><a href="#">
                    <img runat="server" src="~/Images/slide1.jpg" alt="" /></a></li>
                <li><a href="#">
                    <img runat="server" src="~/Images/slide1.jpg" alt="" /></a></li>
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
