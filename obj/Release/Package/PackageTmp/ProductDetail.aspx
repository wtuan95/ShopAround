<%@ Page Title="Chi tiết sản phẩm" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductDetail.aspx.cs" Inherits="ShopAround.ProductDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="StylesContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:FormView ID="frmChitietsanpham" runat="server" ItemType="ShopAround.Models.SanPham" SelectMethod="GetProduct">
        <ItemTemplate>
            <!-- Product detail -->
            <div class="products">
                <div class="cl">&nbsp;</div>
                <div class="product-detail-image">
                    <img width="230" height="300" src="/Photos/Products/<%#: Item.Hinh %>" alt="" />
                </div>
                <div class="product-detail">
                    <h1>Chi tiết sản phẩm</h1>
                    <br />
                    <h1 class="product-detail-name"><%#: Item.TenSanPham %></h1>
                    <br />
                    <h4>Mã số: <%#: Item.MaSanPham %></h4>
                    <br />
                    <strong class="price"><%#: Item.DonGia.ToString("#,##0") %> đ</strong>
                    <br />
                    <h3>Ngày cập nhật: <%#: Item.NgayCapNhat %></h3>
                    <br />
                    <div>
                            <a class="btn btn-default" style="text-decoration:none;" title="Đặt vào giỏ hàng" href="/themvaogio?id=<%#: Item.MaSanPham %>">
                              <span class="fa fa-shopping-cart"></span>  Đặt vào giỏ
                            </a>
                      |
                        <a class="btn btn-default" style="text-decoration:none;background:#8b0000;color:#fff"  href="/themvaogio?id=<%#: Item.MaSanPham %>&buynow=true">
                           <span class="fa fa-check"></span> Mua ngay
                        </a>
                    </div>
                </div>


            </div>
            <!-- End Product detail -->
        </ItemTemplate>
    </asp:FormView>
    <div style="clear: both">&nbsp;</div>
    <div class="box">
        <h2>Sản phẩm cùng nhóm <span></span></h2>
    </div>
    <div class="products">
        <div class="cl">&nbsp;</div>
        <asp:ListView ID="lstRelatedProducts"  runat="server" ItemType="ShopAround.Models.SanPham" SelectMethod="GetRelatedProducts" DataKeyNames="MaSanPham" GroupItemCount="3">
            <ItemTemplate>
                    <li runat="server"><a href="<%#: GetRouteUrl("ProductDetailRoute", new {alias=Item.BiDanh, id = Item.MaSanPham}) %>">
                        <div >
                            <img width="230" height="300" src="/Photos/Products/<%#: Item.Hinh %>" alt="" /></a>
                        </div>
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
                  <ul id="itemPlaceholderContainer" runat="server">
                        <li id="itemPlaceholder" runat="server"></li>
                  </ul>
            </GroupTemplate>
            <EmptyDataTemplate>
                <h3>Không có sản phẩm liên quan.</h3>
            </EmptyDataTemplate>
            <LayoutTemplate>
                <ul class="lstProduct" runat="server" id="groupPlaceholderContainer">
                  <li runat="server" id="groupPlaceholder"></li>
                </ul>
            </LayoutTemplate>
            
        </asp:ListView>
        <div class="cl">&nbsp;</div>
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptsContent">

</asp:Content>
