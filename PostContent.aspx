<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PostContent.aspx.cs" Inherits="ShopAround.PostContent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="StylesContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div id="fb-root"></div>
    <script>(function (d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = 'https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v2.11&appId=1128251490551907';
    fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>
    <div class="popupSocial">
        <div class="fb-like" data-href="UrlTrangweb" data-layout="box_count" data-action="like" data-size="small" data-show-faces="true" data-share="true"></div>
        <br />
        <br />
        <div style="width: 60px">
            <script src="https://apis.google.com/js/platform.js" async defer></script>
            <g:plusone></g:plusone>
        </div>
    </div>
    <div style="clear: both" class="post">
        <asp:FormView ID="frmViewPost" runat="server" RenderOuterTable="false" SelectMethod="GetPost" ItemType="ShopAround.Models.TinTuc">
            <ItemTemplate>
                <h1><%# Eval("tenBV") %></h1>
                <p>Tác giả: <%# Eval("tkThanhVien") %> | Ngày đăng: <%# Eval("ngayDang","{0:dd/MM/yyyy}") %> | Lượt đọc: <%# Eval("soLanDoc") %> lượt</p>
                <h2><%# Eval("ndTomTat") %></h2>
                <article class="article">
                    <%# Eval("noiDungBV") %>
                </article>
            </ItemTemplate>
        </asp:FormView>
       
        <div style="clear: both">&nbsp;</div>
        <div class="fb-comments" data-href="<%: Request.Url.ToString() %>" data-width="100%" data-numposts="5"></div>
        <div style="clear: both">&nbsp;</div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
    <style>
        .popupSocial {
            z-index: 999;
            text-align: center;
            background: #2c4584;
            position: fixed;
            top: 45%;
            left: 10px;
            padding: 20px 10px;
            border: 1px solid #333;
            border-radius: 10px;
        }

        @media screen and (max-width:768px) {
            .popupSocial {
                display: none;
            }
        }
        .post p, .post h2{
            margin:10px 0px;
        }
        article {
            text-align: justify;
            font-size: 14px;
            padding: 0px 20px;
            font-family: Verdana, Geneva, Tahoma, sans-serif;
            clear: both;
        }

            article h3, article p {
                margin: 10px 0;
            }

            article ol li {
                list-style-position: inside;
            }

            article ul li {
                list-style-type: none;
            }
            article img{
                margin:10px auto;
                width:100%;
                height:auto;
            }
    </style>
</asp:Content>
