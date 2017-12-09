<%@ Page Title="Giới thiệu về website" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="ShopAround.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <article>
    <h3><%: Title %>.</h3>
    <p>- Mình là <b>Tuấn Nguyễn</b>, admin của nhóm Lập Trình C C++,C#, Java, Database.
         Hôm nay mình xin thiệu website bán hàng thời trang ShopAround được viết trên công nghệ ASP.NET Web Forms 4.5. Đây là một website
         vừa đủ chức năng cho các bạn tham khảo về cách thức xây dựng 1 website dựa trên nền ASP.NET 4.5.
    </p>
    <h3>Thông tin thêm:</h3>
        <ol>
            <li>Ngôn ngữ lập trình: C#</li>
            <li>Hệ quản trị CSDL: SQL Server 2012</li>
            <li>Kết nối CSDL theo công nghệ Entity framework database first.</li>
            <li>Sử dụng LINQ để truy vấn dữ liệu.</li>
            <li>Website chưa hỗ trợ responsive nên chỉ phù hợp với màn hình desktop (các bạn có thể xây dựng riêng các trang dành cho những loại màn hình kích cỡ khác nhau).</li>
        </ol>
    <h3>ShopAround có các chức năng sau:</h3>
    <ol>
        <li>Xem danh sách 9 sản phẩm mới nhất.</li>
        <li>Xem toàn bộ sản phẩm.</li>
        <li>Xem sản phẩm theo phân loại, nhóm sản phẩm.</li>
        <li>Tìm sản phẩm theo từ khóa và đơn giá.</li>
        <li>Quản lý giỏ hàng online.</li>
        <li>Đặt hàng trực tuyến.</li>
        <li>Trang liên hệ giúp khách hàng liên hệ với ban quản trị.</li>
    </ol>
        <h3>
            Nếu có thắc mắc bạn hãy hiên hệ với tôi:
        </h3>
        <ul>
            <li>
                <span class="fa fa-envelope"></span> Email: <i>nguyenaituan@yahoo.com</i>
            </li>
            <li>
                <span class="fa fa-phone"></span> Facebook: https://www.facebook.com/aituan.nguyen
            </li>
        </ul>
        </article>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="StylesContent" >
    <style>
        article
        {
            font-size:14px;
            padding:0px 20px;
            font-family: Verdana, Geneva, Tahoma, sans-serif;
        }
        article h3, article p
        {
           margin: 10px 0;
        }
        article ol li
        {
           list-style-position:inside;
        }
        article ul li
        {
            list-style-type:none;
        }
        article img 
        {
            margin: 0 auto;
        }
    </style>
</asp:Content>

