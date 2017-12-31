<%@ Page Title="Thêm bài viết" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Create.aspx.cs" Inherits="ShopAround.Admin.Pages.QLBaiViet.Create" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.css">
        <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/jqueryui/1.11.2/jquery-ui.theme.min.css">
        <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/jQuery-Validation-Engine/2.6.4/validationEngine.jquery.min.css">
    <style>
        .form-control.col-lg-6 {
            width: 50% !important;
        }
        .labelInfo{
            padding-top:7px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div class="row">
    <div class="col-lg-12">
        <div class="box">
            <header class="dark">
                <div class="icons"><i class="fa fa-info"></i></div>
                <h5><%: Page.Title %></h5>
                <!-- .toolbar -->
            <div class="toolbar">
              <nav style="padding: 8px;">
                  <a href="javascript:;" class="btn btn-default btn-xs collapse-box">
                      <i class="fa fa-minus"></i>
                  </a>
                  <a href="javascript:;" class="btn btn-default btn-xs full-box">
                      <i class="fa fa-expand"></i>
                  </a>
                  <a href="javascript:;" class="btn btn-danger btn-xs close-box">
                      <i class="fa fa-times"></i>
                  </a>
              </nav>
            </div>            <!-- /.toolbar -->

            </header>
                <asp:FormView ValidateRequestMode="Disabled" ID="frmCreateBaiViet" DefaultMode="Insert" runat="server" RenderOuterTable="false" ItemType="ShopAround.Models.TinTuc"  DataSourceID="objSourceBaiViet" OnItemInserting="frmCreateBaiViet_ItemInserting" OnItemInserted="frmCreateBaiViet_ItemInserted"  >
                    <InsertItemTemplate>
                        <div id="collapse2" class="body">
                            <div class="form-horizontal" id="popup-validation">
                                <div class="form-group">
                                    <label class="control-label col-lg-4">Tên bài viết</label>
                                    <div class="col-lg-4">
                                        <asp:TextBox ID="tenBVTextBox" CssClass="form-control" runat="server" Text='<%# Bind("tenBV") %>' />
                                        <asp:RequiredFieldValidator CssClass="text-danger" Display="Dynamic" ValidationGroup="thembv" ControlToValidate="tenBVTextBox" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Tên bài viết không được bỏ trống!"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-lg-4">Sửa hình đại diện</label>
                                    <div class="col-lg-4">
                                        <asp:FileUpload ID="fileHinhDaiDien" CssClass="form-control" runat="server" />
                                    </div>
                                </div>



                                <div class="form-group">
                                    <label class="control-label col-lg-4">Nội dung tóm tắt</label>
                                    <div class="col-lg-4">
                                        <asp:TextBox ID="ndTomTatTextBox" CssClass="form-control" runat="server" Text='<%# Bind("ndTomTat") %>' />
                                    </div>
                                </div>

                              
                                <div class="form-group">
                                    <label class="control-label col-lg-4">Bí danh</label>
                                    <div class="col-lg-4">
                                        <asp:TextBox ID="biDanhTextBox" CssClass="form-control" runat="server" Text='<%# Bind("biDanh") %>' />
                                        <asp:RequiredFieldValidator CssClass="text-danger" Display="Dynamic" ValidationGroup="thembv" ControlToValidate="biDanhTextBox" ID="RequiredFieldValidator2" runat="server" ErrorMessage="Bí danh không được bỏ trống!"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-lg-4">Trạng thái</label>
                                    <div class="col-lg-4">
                                        <asp:CheckBox ID="daDuyetCheckBox" runat="server" Checked='<%# Bind("daDuyet") %>' />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-lg-4">Nội dung</label>
                                    <div class="col-lg-8">
                                        <asp:TextBox TextMode="MultiLine" ClientIDMode="Static" ID="noiDungBVTextBox" CssClass="form-control" runat="server" Text='<%# Bind("noiDungBV") %>' />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-lg-4 col-lg-offset-4">
                                        <asp:LinkButton CssClass="btn btn-danger" ValidationGroup="thembv" ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Tạo mới" />
                                        &nbsp;<a href="Default.aspx" class="btn btn-default">Trở về</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </InsertItemTemplate>
                </asp:FormView>
        </div>
    </div>
    <asp:ObjectDataSource ID="objSourceBaiViet" runat="server" SelectMethod="ViewDetail" TypeName="ShopAround.Admin.Pages.QLBaiViet.Create" InsertMethod="CreateBaiViet">
            <SelectParameters>
                <asp:QueryStringParameter Name="maBV" QueryStringField="maBV" Type="Int32" />
            </SelectParameters>
            <InsertParameters>
                <asp:FormParameter DbType="String" FormField="tenBV" Name="tenBV" />
                <asp:FormParameter DbType="Boolean" FormField="daDuyet" Name="daDuyet" />
                <asp:FormParameter DbType="String" FormField="BiDanh" Name="BiDanh" />
                <asp:FormParameter DbType="String" FormField="ndTomTat" Name="ndTomTat" />
                <asp:FormParameter DbType="String" FormField="noiDungBV" Name="noiDungBV" />
                <asp:Parameter DbType="String" Name="hinhDD"   />
                <asp:SessionParameter DbType="String" SessionField="tkThanhVien" Name="tkThanhVien" />
            </InsertParameters>
    </asp:ObjectDataSource>

    <!-- /.col-lg-12 -->
</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Scripts" runat="server">
    <script src="//cdnjs.cloudflare.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jQuery-Validation-Engine/2.6.4/jquery.validationEngine.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jQuery-Validation-Engine/2.6.4/languages/jquery.validationEngine-en.min.js"></script>
    <script src="/Admin/assets/lib/jquery-validation/jquery.validate.js"></script>
    <script>
        $(function ()
        {
           Metis.formValidation();
        });
    </script>
    <script src="/ckeditor/ckeditor.js"></script>
    <script src="/ckeditor/config.js"></script>
    <script src="/ckfinder/ckfinder.js"></script>
    <script>
        var editor = CKEDITOR.replace('noiDungBVTextBox');
        CKFinder.setupCKEditor(editor, '/ckfinder/');
    </script>
</asp:Content>
