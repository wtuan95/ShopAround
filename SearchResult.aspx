
<%@ Page Title="Kết quả tìm kiếm" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SearchResult.aspx.cs" Inherits="ShopAround.SearchResult" %>
<asp:Content ID="Content1" ContentPlaceHolderID="StylesContent" runat="server">
    <link href="/Content/pager.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="box">
        <h2>Tìm kiếm</h2>
    </div>
    <div class="search-result">
        
        <h1 style="line-height:normal">Tìm thấy <span runat="server" id="countresult"></span> sản phẩm 
        </h1>
      
        
        <br />
        <asp:ListView  ID="lstResult" runat="server" SelectMethod="GetSearchResult" ItemType="ShopAround.Models.SanPham" >
            <EmptyDataTemplate>
               Không có dữ liệu trả về
            </EmptyDataTemplate>
          
            <ItemSeparatorTemplate>
<br />
            </ItemSeparatorTemplate>
            <ItemTemplate>
                <li style="background-color: #DCDCDC;color: #000000; width:720px;overflow:auto">
                    <div style="width:200px;float:left">
                       <a href="<%# GetRouteUrl("ProductDetailRoute", new { id =  Item.MaSanPham, alias = Item.BiDanh })%>"> 
                           <img src="/Photos/Products/<%# Item.Hinh %>" width="170" height="200" />
                       </a>
                    </div>
                    <div style="width:500px;float:right; font-size:1.2em; line-height:2;">
                    Mã sản phẩm:
                    <asp:Label  ID="MaSanPhamLabel" runat="server" Text='<%# Item.MaSanPham%>' />
                    <br />
                    Tên sản phẩm:
                        <a style="text-decoration:none;color:#000" href="ProductDetail.aspx?id=<%# Item.MaSanPham %>"> 
                    <asp:Label Font-Bold="true" ID="TenSanPhamLabel" runat="server" Text='<%# Item.TenSanPham %>' /></a>
                    <br />
                    Nhóm sản phẩm:
                    <asp:Label ID="NhomSanPhamIDLabel" runat="server" Text='<%# Item.NhomSanPham.TenNhom%>' />
                    <br />
                   
                    Đơn giá:
                    <asp:Label ForeColor="#ff3300" Font-Bold="true" Font-Italic="true" ID="DonGiaLabel" runat="server" Text='<%# string.Format("{0:#,##0} đồng",Item.DonGia) %>' />
                    <br />
                    Ngày cập nhật:
                    <asp:Label ID="NgayCapNhatLabel" runat="server" Text='<%# string.Format("{0:dd/MM/yyyy}",Item.NgayCapNhat) %>' />
                    <br />
                    </div>
                   
                </li>
            </ItemTemplate>
            <LayoutTemplate>
                <ul id="itemPlaceholderContainer" runat="server" style="font-family: Verdana, Arial, Helvetica, sans-serif; list-style-type:none">
                    <li runat="server" id="itemPlaceholder" />
                </ul>
              <div style="clear:both" runat="server" class="pagination">
                              <asp:DataPager ID="DataPager1" runat="server" PageSize="10">
                                  <Fields>
                                      <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" ButtonCssClass="page" />
                                      <asp:NumericPagerField CurrentPageLabelCssClass="page active" NumericButtonCssClass="page"/>
                                      <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" ButtonCssClass="page" />
                                  </Fields>
                              </asp:DataPager>
                  </div>
            </LayoutTemplate>
            </asp:ListView>
        
 <%--       <asp:ObjectDataSource  ID="SearchObjectSource" runat="server" SelectMethod="GetSearchResult" TypeName="ShopAround.App_Code.ProductBL">
            <SelectParameters>
                <asp:RouteParameter RouteKey="keyword" Name="keyword" Type="String" />
                <asp:RouteParameter RouteKey="princefrom" Name="princeFrom" Type="Int32" />
                <asp:RouteParameter RouteKey="princeto" Name="princeTo" Type="Int32"  />
            </SelectParameters>
        </asp:ObjectDataSource>--%>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
</asp:Content>
