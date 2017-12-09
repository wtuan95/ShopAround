<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Search.ascx.cs" Inherits="ShopAround.UControls.Search" %>
<div class="box search">
                        <h2>Tìm kiếm theo <span></span></h2>
                        <div class="box-content">
                                <label>Từ khóa</label>
                                <asp:TextBox ID="Keyword" runat="server" CssClass="field"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorKeyword" ForeColor="#ff0000" Text="*" runat="server" ErrorMessage="Bạn chưa nhập từ khóa." ControlToValidate="Keyword" Display="Dynamic" ValidationGroup="validationSearch"></asp:RequiredFieldValidator>
                            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" ValidationGroup="validationSearch" />
                                <div class="inline-field">
                                    <label>Đơn giá từ</label><br />
                                    <asp:TextBox  ID="PrinceFrom"  runat="server" ValidationGroup="validationSearch"></asp:TextBox> đồng
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorPrinceFrom" runat="server" ControlToValidate="PrinceFrom" Display="Dynamic" ErrorMessage="Bạn chưa nhập giá " ForeColor="Red" ValidationGroup="validationSearch">*</asp:RequiredFieldValidator>
                                    <asp:CompareValidator ID="CompareValidatorPrinceFrom" runat="server" ControlToValidate="PrinceFrom" Display="Dynamic" ErrorMessage="Đơn giá bắt đầu phải &gt;= 0" ForeColor="Red" Operator="GreaterThanEqual" Type="Integer" ValidationGroup="validationSearch" ValueToCompare="0">*</asp:CompareValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidatorPrinceFrom" runat="server" ControlToValidate="PrinceFrom" Display="Dynamic" ErrorMessage="Đơn giá không được phép chứa ký tự chữ cái!" ForeColor="Red" ValidationExpression="^[0-9]*$" ValidationGroup="validationSearch">*</asp:RegularExpressionValidator>
                                    <br /><label>đến:</label>
                                    <br />
                                     <asp:TextBox  ID="PrinceTo"  runat="server" ValidationGroup="validationSearch"></asp:TextBox> đồng
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorPrinceTo" runat="server" ControlToValidate="PrinceTo" Display="Dynamic" ErrorMessage="Bạn chưa nhập giá" ForeColor="Red" ValidationGroup="validationSearch">*</asp:RequiredFieldValidator>
                                    <asp:CompareValidator ID="CompareValidatorPrinceTo" runat="server" ControlToValidate="PrinceTo" Display="Dynamic" ErrorMessage="Đơn giá kết thúc phải &gt;= đơn giá bắt đầu" ForeColor="Red" Operator="GreaterThanEqual" Type="Integer" ValidationGroup="validationSearch" ControlToCompare="PrinceFrom">*</asp:CompareValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidatorPrinceTo" runat="server" ControlToValidate="PrinceTo" Display="Dynamic" ErrorMessage="Đơn giá không được phép chứa ký tự chữ cái!" ForeColor="Red" ValidationExpression="^[0-9]*$" ValidationGroup="validationSearch">*</asp:RegularExpressionValidator>
                                </div>
                                <asp:Button ID="btnSearch"  runat="server" CssClass="search-submit" Text="Search" OnClick="btnSearch_Click" ValidationGroup="validationSearch" />
                              
                              <%--  <p>
                                    <a href="#" class="bul">Tìm kiếm nâng cao</a><br />
                                    <a href="#" onclick="alert('Mọi thắc mắc về sản phẩm bạn gửi về email: nguyenaituan@yahoo.com')" class="bul">Liên hệ quản trị viên</a>
                                </p>--%>
                        </div>
                        
                    </div>