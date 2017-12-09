<%@ Page Title="Giỏ hàng của bạn" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ShoppingCart.aspx.cs" Inherits="ShopAround.ShoppingCart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="StylesContent" runat="server">
    <link href="Content/table.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
                    <div class="box">
                        <h2>Giỏ hàng của bạn<span></span></h2> 
                    </div>
                   
                    <% if(Session["shoppingcart"] == null || ((List<ShopAround.Models.CartItem>)Session["shoppingcart"]).Count == 0) { %>
                        <div style="text-align:center">
                            <img runat="server" src="~/Images/empty_cart.png" />
                            <h3>Giỏ hàng của bạn rỗng. Hãy chọn sản phẩm và đặt vào giỏ ngay.
                                </h3>
                        </div>
                    <% } %>
                    <% if(Session["shoppingcart"] != null && ((List<ShopAround.Models.CartItem>)Session["shoppingcart"]).Count > 0 ) { %>
                    <div class="pull-left">
                        <img runat="server" src="~/Images/cart.png" />
                    </div>
                    <div class="shoppingcart-info" >
                          <h2>Tổng số lượng: <%= ((List<ShopAround.Models.CartItem>)Session["shoppingcart"]).Sum(m=>m.SoLuong) %> sản phẩm</h2>
                          <h2>Tổng đơn giá: <%= ((List<ShopAround.Models.CartItem>)Session["shoppingcart"]).Sum(m=>m.ThanhTien).ToString("#,##0") %>đồng</h2>
                    </div>
                    <div class="wrapper">
                        <div class="table">  
                            <div class="row header">
                                <div class="cell">
                                    
                                </div>
                                <div class="cell">
                                    Tên sản phẩm
                                </div>
                                <div class="cell">
                                    Đơn giá
                                </div>
                                <div class="cell">
                                    Số lượng
                                </div>
                                <div class="cell">
                                    Thành tiền
                                </div>
                                <div class="cell">
                                    
                                </div>
                                <div class="cell">
                                    
                                </div>
                                <div class="cell">
                                    
                                </div>
                            </div>
                            <% foreach(var cardItem in Session["shoppingcart"] as List<ShopAround.Models.CartItem>) {%>
                            <div class="row">
                                <div class="cell">
                                    <img src="/Photos/Products/<%= cardItem.Hinh %>" width="70" height="70" />
                                </div>
                                <div class="cell" >
                                    <%= cardItem.TenSanPham %>
                                </div>
                                <div class="cell">
                                    <%= cardItem.DonGia.ToString("#,##0") %> đ
                                </div>
                                <div class="cell">
                                    <%= cardItem.SoLuong %>
                                     
                                </div>
                                <div class="cell">
                                     <%= cardItem.ThanhTien.ToString("#,##0") %> đ
                                </div>
                                <div class="cell">
                                   <a title="Tăng số lượng" href="/suasoluong?id=<%= cardItem.MaSanPham %>&change=plus" style="text-decoration:none" class="btn btn-default" ><span class="fa fa-plus"></span></a>
                                    
                                   
                                </div>
                                 <div class="cell">
                                   <a title="Giảm số lượng" href="/suasoluong?id=<%= cardItem.MaSanPham %>&change=minus" style="text-decoration:none" class="btn btn-default" ><span class="fa fa-minus"></span></a>
                                    
                                   
                                </div>
                                 <div class="cell">
                                     <a onclick="return confirm('Bạn có chắc muốn bỏ sản phẩm này khỏi giỏ hàng?');" href="xoakhoigio?id=<%= cardItem.MaSanPham %>" style="text-decoration:none" class="btn btn-default" ><span class="fa fa-trash-o"></span> Xóa</a>
                                    
                                </div>
                            </div>
                            <% } %>
                        </div>
                        
                    </div>
                    <a runat="server" href="~/cuahang">Mua tiếp</a>
                    <div>&nbsp;</div>
                    <div id="order" >
                        <div class="box">
                            <h2>Đặt hàng online<span></span></h2>
                        </div>
                        <p>Nhập các thông tin bên dưới để thực hiện đặt hàng online. Chúng tôi sẽ liên lạc với bạn qua SĐT hoặc Email mà
                            bạn cung cấp khi nhận được đơn hàng để thực hiện xác nhận việc đặt hàng.</p>
                            <table class="table-order">
                                <tr>
                                    <td>Họ đệm: </td>
                                    <td><input type="text" name="hodem" runat="server" id="txtHoDem" /><asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtHoDem" Display="Dynamic" ErrorMessage="Họ đêm phải nhỏ hơn 100 ký tự," ForeColor="#FF3300" ValidationExpression="^[\s\S]{0,100}$" ValidationGroup="validationOrder">*</asp:RegularExpressionValidator>
                                    </td>
                                    <td>Tên: </td>
                                    <td><input type="text" name="ten" runat="server" id="txtTen" /><asp:RequiredFieldValidator ID="RequiredFieldtxtTen" runat="server" ErrorMessage="Bạn chưa nhập tên" ForeColor="#FF3300" ControlToValidate="txtTen" Display="Dynamic" SetFocusOnError="True" ValidationGroup="validationOrder">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Email: </td>
                                    <td><input type="text" name="email" runat="server" id="txtEmail" /><asp:RequiredFieldValidator ID="RequiredFieldtxtEmail" runat="server" ErrorMessage="Bạn chưa nhập địa chỉ email" ForeColor="#FF3300" ControlToValidate="txtEmail" Display="Dynamic" SetFocusOnError="True" ValidationGroup="validationOrder">*</asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidatorEmail" runat="server" Display="Dynamic" ErrorMessage="Địa chỉ email không hợp lệ." ForeColor="#FF3300" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtEmail" ValidationGroup="validationOrder">*</asp:RegularExpressionValidator>
                                    </td>
                                    <td>SĐT: </td>
                                    <td><input type="text" name="sdt" runat="server" id="txtSDT" /><asp:RequiredFieldValidator ID="RequiredFieldtxtSDT" runat="server" ErrorMessage="Bạn cần cung cấp SĐT để chúng tôi có thể liên lạc." ForeColor="#FF3300" ControlToValidate="txtSDT" Display="Dynamic" SetFocusOnError="True" ValidationGroup="validationOrder">*</asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidatorSDT" runat="server" ControlToValidate="txtSDT" Display="Dynamic" ErrorMessage="Số điện thoại không hợp lệ. Số điện thoại tối thiểu 10 ký tự số và tối đa 12 ký tự số." ForeColor="#FF3300" SetFocusOnError="True" ValidationExpression="^(0\d{9,12})$" ValidationGroup="validationOrder">*</asp:RegularExpressionValidator>
                                    </td>
                                </tr>
                                 <tr>
                                    <td>Địa chỉ: </td>
                                    <td colspan="3"><input style="width:100%" type="text" name="diachi" runat="server" id="txtDiaChi" /><asp:RequiredFieldValidator ID="RequiredFieldtxtDiachi" runat="server" ErrorMessage="Bạn cần cung cấp địa chỉ của bạn để chúng tôi có thể giao hàng." ForeColor="#FF3300" ControlToValidate="txtDiaChi" Display="Dynamic" SetFocusOnError="True" ValidationGroup="validationOrder">*</asp:RequiredFieldValidator>
                                     </td>
                                </tr>
                                <tr>
                                    <td>Giới tính: </td>
                                    <td>
                                        <input type="checkbox" name="gioitinh" value="name" id="rdoNam" runat="server" checked="checked" /> Nam
                                        <input type="checkbox" name="gioitinh" value="name" id="rdoNu" runat="server" /> Nữ
                                    </td>
                                </tr>
                                <tr>
                                    <td> </td>
                                    <td colspan="3">
                                        <asp:Button  runat="server"  BackColor="#8b0000" CssClass="buy-submit" Text="Xác nhận" ValidationGroup="validationOrder" ID="btnXacNhan" OnClick="btnXacNhan_Click" />
                                        <%--<input type="submit" name="submit" style="background:#8b0000" class="buy-submit" value="Xác nhận" />--%>
                                        <p class="redcolor" runat="server" id="Message">
                                            
                                        </p>

                                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="#FF3300" HeaderText="Danh sách lỗi:" ValidationGroup="validationOrder" />
                                    </td>
                                </tr>
                            </table>
                        
                     </div>
                    <% } %>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
</asp:Content>