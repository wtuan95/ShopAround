<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Cart.ascx.cs" Inherits="ShopAround.UControls.Cart" %>
<!-- Cart -->
<div id="cart">
    <a runat="server" href="~/giohang" class="cart-link">Giỏ hàng</a>
    <div class="cl">&nbsp;</div>
     <% if (Session["shoppingcart"] != null){  %>
    <span>Tổng số lượng: <strong><%= ((List<ShopAround.Models.CartItem>)Session["shoppingcart"]).Sum(m=>m.SoLuong)  %></strong></span> &nbsp;&nbsp; <span>Tổng đơn giá: <strong><%= ((List<ShopAround.Models.CartItem>)Session["shoppingcart"]).Sum(m=>m.ThanhTien) %> đ</strong></span>
    <% }  %>
    <% if (Session["shoppingcart"] == null) { %>
    <span>Tổng số lượng: <strong>0</strong></span> &nbsp;&nbsp; <span>Tổng đơn giá: <strong>0 đ</strong></span>
    <% } %>
</div>
<!-- End Cart -->
