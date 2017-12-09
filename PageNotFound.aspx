<%@ Page Title="Không tìm thấy trang" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PageNotFound.aspx.cs" Inherits="ShopAround.PageNotFound" %>
<asp:Content ID="Content1" ContentPlaceHolderID="StylesContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div style="text-align:center;margin:100px 0">
        <p style="font-size:48px;line-height:normal">Không tìm thấy trang</p>
        <p style="font-size:16px;line-height:normal">Trang bạn nhập không tồn tại hoặc đã bị xóa.</p>
        <br/><img src="/Images/404.png" />
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
</asp:Content>
