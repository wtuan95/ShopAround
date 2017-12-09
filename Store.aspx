<%@ Page  Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Store.aspx.cs" Inherits="ShopAround.Store" %>
<asp:Content ID="Content1" ContentPlaceHolderID="StylesContent" runat="server">
    <link href="/Content/pager.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="box"><h2><asp:Literal runat="server" ID="message"></asp:Literal></h2></div>
     <!-- Products -->
      <div class="products">
        <div class="cl">&nbsp;</div>
          <asp:ListView ID="lstProducts" runat="server" SelectMethod="GetProducts" DataKeyNames="MaSanPham" ItemType="ShopAround.Models.SanPham" GroupItemCount="3">
              <EmptyDataTemplate>
                  <table runat="server" style="">
                      <h3>Không có dữ liệu.</h3>
                  </table>
              </EmptyDataTemplate>
              <EmptyItemTemplate>
                    <li></li>
              </EmptyItemTemplate>
              <GroupTemplate>
                    <ul class="lstProduct" id="itemPlaceholderContainer" runat="server">
                        <li id="itemPlaceholder" runat="server"></li>
                    </ul>
              </GroupTemplate>
              <ItemTemplate>
                    <li runat="server"><a href="<%#: GetRouteUrl("ProductDetailRoute", new { id = Item.MaSanPham, alias = Item.BiDanh})%>">
                        <img width="230" height="300" src="/Photos/Products/<%#: Item.Hinh %>" alt="" /></a>
                        <div class="product-info">
                            <h3><%#:Item.TenSanPham %></h3>
                            <div class="product-desc">
                                <h4><%#: Item.NhomSanPham.TenNhom %></h4>
                                <strong class="price"><%#: Item.DonGia.ToString("#,##0") %> đ</strong>
                            </div>
                        </div>
                    </li>
              </ItemTemplate>
              <LayoutTemplate>
                      <li id="groupPlaceholder"  runat="server">
                          
                      </li>                      
                  <div style="clear:both" runat="server" class="pagination">
                              <asp:DataPager ID="DataPager1" runat="server" PageSize="6">
                                  <Fields>
                                      <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" ButtonCssClass="page" />
                                      <asp:NumericPagerField CurrentPageLabelCssClass="page active" NumericButtonCssClass="page"/>
                                      <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" ButtonCssClass="page" />
                                  </Fields>
                              </asp:DataPager>
                  </div>
              </LayoutTemplate>

          </asp:ListView>
        <div class="cl">&nbsp;</div>
      </div>
</asp:Content>
