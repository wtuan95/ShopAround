<%@ Page  Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductDetail.aspx.cs" Inherits="ShopAround.ProductDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="StylesContent" runat="server">
    <style>
        .popupSocial {
            z-index: 999;
            text-align: center;
            background: #2c4584;
            position: fixed;
            top: 45%;
            left: 10px;
            padding: 20px 10px;
            border: 1px solid #333;
            border-radius: 10px;
        }

        @media screen and (max-width:768px) {
            .popupSocial {
                display: none;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <div id="fb-root"></div>
<script>(function(d, s, id) {
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
    <asp:FormView ID="frmChitietsanpham" RenderOuterTable="false" runat="server" ItemType="ShopAround.Models.SanPham" SelectMethod="GetProduct">
        <ItemTemplate>
         
            <!-- Product detail -->
            <div class="products">
                <div class="cl">&nbsp;</div>
                <div class="product-detail-image">
                    <img width="230" height="300" src="/Photos/Products/<%#: Item.Hinh %>" alt="" />
                </div>
                <div class="product-detail">
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
    <div class="fb-comments" data-href="<%: Request.Url.ToString() %>" data-width="100%" data-numposts="5"></div>
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
