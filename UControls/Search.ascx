<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Search.ascx.cs" Inherits="ShopAround.UControls.Search" %>
<div class="box search">
    <h2>Tìm kiếm theo tên sản phẩm<span></span></h2>
    <div class="box-content">
        <label>Tên sản phẩm</label>
        <asp:TextBox ID="Keyword" runat="server" CssClass="field"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidatorKeyword" ForeColor="#ff0000" runat="server" ErrorMessage="Bạn chưa nhập từ khóa." ControlToValidate="Keyword" Display="Dynamic" ValidationGroup="timtheoten"></asp:RequiredFieldValidator>

        <asp:Button ID="btnSearch" runat="server" CssClass="search-submit" Text="Search" OnClick="btnSearch_Click" ValidationGroup="timtheoten" />

        <%--  <p>
                                    <a href="#" class="bul">Tìm kiếm nâng cao</a><br />
                                    <a href="#" onclick="alert('Mọi thắc mắc về sản phẩm bạn gửi về email: nguyenaituan@yahoo.com')" class="bul">Liên hệ quản trị viên</a>
                                </p>--%>
    </div>
    <h2>Thống kê<span></span></h2>
    <div class="box-content">
        <br />
        <p style="color: #8b0000">
            User đang online: <%: Application["useronline"] %> user
        </p>
        <br />
        <p style="color: #8b0000">
            Lượt truy cập hôm nay: <%: (Application["truycaphomnay"] as Dictionary<DateTime, int>)[new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day)] %> lượt
        </p>
        <br />
        <p style="color: #8b0000">
            Tổng lượt truy cập: <%: Application["tongtruycap"] %> lượt
        </p>

    </div>
</div>
