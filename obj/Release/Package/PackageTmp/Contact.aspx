<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="ShopAround.Contact" %>

<asp:Content ID="StyleContent" runat="server" ContentPlaceHolderID="StylesContent" >
    <style type="text/css">
    #wrapper {
        width:720px;
        margin:0 auto;
    }
    #wrapper legend {
        color: #222;
        font-size:16px;
        padding:0 10px;
        background:#fff;
        -moz-border-radius:4px;
        box-shadow: 0 1px 5px #222;
        padding:5px 10px;
        text-transform:uppercase;
        font-family:Helvetica, sans-serif;
        font-weight:bold;
    }
    #wrapper fieldset {
        border-radius:4px;
        background: #fff; 
        
        padding:20px;
        border-color: #999898;
    }
    #wrapper input,
    #wrapper textarea {
        color: #373737;
        background: #fff;
        border: 1px solid #CCCCCC;
        color: #aaa;
        font-size: 14px;
        line-height: 1.2em;
        margin-bottom:15px;

        -moz-border-radius:4px;
        -webkit-border-radius:4px;
        border-radius:4px;
        box-shadow: 0 1px 2px rgba(0, 0, 0, 0.1) inset, 0 1px 0 rgba(255, 255, 255, 0.2);
    }
    #wrapper input[type="text"],
    #wrapper input[type="password"]{
        padding: 8px 6px;
        height: 22px;
        width:380px;
    }
    #wrapper input[type="text"]:focus,
    #wrapper input[type="password"]:focus {
        background:#f5fcfe;
        text-indent: 0;
        z-index: 1;
        color: #373737;
        -webkit-transition-duration: 400ms;
        -webkit-transition-property: width, background;
        -webkit-transition-timing-function: ease;
        -moz-transition-duration: 400ms;
        -moz-transition-property: width, background;
        -moz-transition-timing-function: ease;
        -o-transition-duration: 400ms;
        -o-transition-property: width, background;
        -o-transition-timing-function: ease;
        width: 420px;
        
        border-color:#ccc;
/*        box-shadow:0 0 5px rgba(4, 129, 177, 0.5);*/
        opacity:0.6;
    }
    #wrapper input[type="submit"]{
        background: #8b0000;
        border: none;
        text-shadow: 0 -1px 0 rgba(0,0,0,0.3);
        text-transform:uppercase;
        color: #eee;
        cursor: pointer;
        font-size: 15px;
        margin: 5px 0;
        padding: 5px 22px;
        -moz-border-radius: 4px;
        border-radius: 4px;
        -webkit-border-radius:4px;
        -webkit-box-shadow: 0px 1px 2px rgba(0,0,0,0.3);
        -moz-box-shadow: 0px 1px 2px rgba(0,0,0,0.3);
        box-shadow: 0px 1px 2px rgba(0,0,0,0.3);
    }
    #wrapper textarea {
        padding:3px;
        width:96%;
        height:100px;
    }
    #wrapper textarea:focus {
        background:#ebf8fd;
        text-indent: 0;
        z-index: 1;
        color: #373737;
        opacity:0.6;
        box-shadow:0 0 5px rgba(4, 129, 177, 0.5);
        border-color:#ccc;
    }
    #wrapper .small {
        line-height:14px;
        font-size:12px;
        color:#999898;
        margin-bottom:3px;
    }
</style>

</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
      <div class="box">
            <h2>Liên hệ <span></span></h2>
        </div>
        <div id="wrapper" >
                <fieldset>
                    <legend>Form liên hệ</legend>
                    <div>
                        
                        <br />
                        <input type="text" runat="server" id="txtHoTen" name="hoten" placeholder="Họ tên"/>
                        <asp:RequiredFieldValidator ValidationGroup="validationContact" ID="RequiredFieldtxtHoTen" runat="server" CssClass="redcolor" Display="Dynamic" ErrorMessage="Bạn chưa nhập họ tên" ControlToValidate="txtHoTen">Bạn chưa nhập họ tên</asp:RequiredFieldValidator>
                    </div>
                    <div>
                        <input type="text" runat="server" id="txtDiaChi" name="diachi" placeholder="Địa chỉ"/>
                        <asp:RequiredFieldValidator ValidationGroup="validationContact" ID="RequiredFieldtxtDiaChi" runat="server" ErrorMessage="Bạn chưa nhập địa chỉ" ControlToValidate="txtDiaChi" CssClass="redcolor" Display="Dynamic">Bạn chưa nhập địa chỉ</asp:RequiredFieldValidator>
                    </div>
                    <div>
                        <input type="text" runat="server"  id="txtEmail" name="email" placeholder="Email"/>
                        <asp:RequiredFieldValidator ValidationGroup="validationContact"  ID="RequiredFieldtxtEmail" runat="server" ErrorMessage="Bạn chưa nhập địa chỉ email" ControlToValidate="txtEmail" CssClass="redcolor" Display="Dynamic">Bạn chưa nhập địa chỉ email </asp:RequiredFieldValidator>
                        <br />
                        <asp:RegularExpressionValidator ValidationGroup="validationContact" ID="RegularExpressiontxtEmail" runat="server" ErrorMessage="Địa chỉ email không hợp lệ." ControlToValidate="txtEmail" CssClass="redcolor" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">Địa chỉ email không hợp lệ.</asp:RegularExpressionValidator>
                    </div>
                    <div>
                        <div class="small">Nhập lời góp ý, khiếu nại, báo lỗi,... mọi thứ mà bạn muốn gửi đến chúng tôi tại đây.</div>
                        <textarea name="message" runat="server" id="txtNoiDung" placeholder="Nhập nội dung"></textarea>
                        <br />
                        <asp:RequiredFieldValidator ValidationGroup="validationContact" ID="RequiredFieldtxtNoiDung" runat="server" ErrorMessage="Bạn chưa nhập nội dung" ControlToValidate="txtNoiDung" CssClass="redcolor" Display="Dynamic">Bạn chưa nhập nội dung</asp:RequiredFieldValidator>
                        <br />
                    </div>   
                    <div>
                        <asp:Label runat="server" ForeColor="#00cc00" ID="lblMessage" Visible="false"></asp:Label>
                        <br />
                    </div>
                    
                    <asp:Button  runat="server" name="submit" ValidationGroup="validationContact" Text="Gửi" OnClick="btnGui_Click" ID="btnGui"  /> 
                </fieldset>    
		</div>
</asp:Content>
