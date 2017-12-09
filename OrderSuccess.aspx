<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OrderSuccess.aspx.cs" Inherits="ShopAround.OrderSuccess" %>

<asp:Content ID="Content1" ContentPlaceHolderID="StylesContent" runat="server">
    <style type="text/css">
        .auto-style2 {
            width: 128px;
            height: 128px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div style="text-align: center;">
        <p>
            <img alt="success" class="auto-style2" src="Images/success.png" />
        </p>
        <h1  style="color:#3c763d">Đặt hàng thành công.</h1>
        <div>&nbsp;</div>
        <h1 style="line-height:normal">Chúng tôi sẽ liên hệ với bạn qua số điện thoại<br /> hoặc email của bạn để xác nhận đặt hàng.</h1>
        <div>&nbsp;</div>
        <img src="Images/ordersuccess.jpg" width="410" height="200" />
    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
</asp:Content>
