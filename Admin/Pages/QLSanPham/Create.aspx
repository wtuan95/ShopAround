﻿<%@ Page Title="Thêm sản phẩm" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Create.aspx.cs" Inherits="ShopAround.Admin.Pages.QLSanPham.Create" %>
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
                <asp:FormView ValidateRequestMode="Disabled" ID="frmCreateSanPham" DefaultMode="Insert" runat="server" RenderOuterTable="false" ItemType="ShopAround.Models.SanPham"  DataSourceID="objSourceSanPham" OnItemInserting="frmCreateSanPham_ItemInserting" OnItemInserted="frmCreateSanPham_ItemInserted"  >
                    <InsertItemTemplate>
                        <div id="collapse2" class="body">
                            <div class="form-horizontal" id="popup-validation">
                                <div class="form-group">
                                    <label class="control-label col-lg-4">Tên sản phẩm</label>
                                    <div class="col-lg-4">
                                        <asp:TextBox ID="TenSanPhamTextBox" CssClass="form-control" runat="server" Text='<%# Bind("TenSanPham") %>' />
                                        <asp:RequiredFieldValidator CssClass="text-danger" Display="Dynamic" ValidationGroup="suasp" ControlToValidate="TenSanPhamTextBox" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Tên sản phẩm không được bỏ trống!"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-lg-4">Nhóm sản phẩm</label>
                                    <div class="col-lg-4">
                                        <asp:DropDownList ID="lstNhomSanPham"  CssClass="form-control" DataSourceID="linqSourceNhomSanPham" DataValueField="NhomSanPhamID" DataTextField="TenNhom" SelectedValue='<%# Bind("NhomSanPhamID") %>' runat="server"></asp:DropDownList>
                                        <asp:RequiredFieldValidator ValidationGroup="themsp" CssClass="text-danger" Display="Dynamic" ControlToValidate="lstNhomSanPham" ID="RequiredFieldValidator5" runat="server" ErrorMessage="Bạn cần chọn nhóm sản phẩm của sản phẩm!"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-lg-4">Hình đại diện</label>
                                    <div class="col-lg-4">
                                        <asp:FileUpload ID="fileHinhDaiDien" CssClass="form-control" runat="server" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-lg-4">Đơn giá</label>
                                    <div class="col-lg-4">
                                        <asp:TextBox ID="DonGiaTextBox" TextMode="Number" CssClass="form-control" runat="server" Text='<%# Bind("DonGia") %>' />
                                        <asp:RequiredFieldValidator CssClass="text-danger" Display="Dynamic" ValidationGroup="themsp" ControlToValidate="DonGiaTextBox" ID="RequiredFieldValidator4" runat="server" ErrorMessage="Đơn giá không được bỏ trống!"></asp:RequiredFieldValidator>
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
                                        <asp:TextBox ID="BiDanhTextBox" CssClass="form-control" runat="server" Text='<%# Bind("BiDanh") %>' />
                                        <asp:RequiredFieldValidator CssClass="text-danger" Display="Dynamic" ValidationGroup="themsp" ControlToValidate="BiDanhTextBox" ID="RequiredFieldValidator2" runat="server" ErrorMessage="Bí danh không được bỏ trống!"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-lg-4">Nội dung</label>
                                    <div class="col-lg-8">
                                        <asp:TextBox TextMode="MultiLine" ClientIDMode="Static" ID="ndDayDuTextBox" CssClass="form-control" runat="server" Text='<%# Bind("ndDayDu") %>' />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-lg-4 col-lg-offset-4">
                                        <asp:LinkButton CssClass="btn btn-primary" ValidationGroup="themsp" ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Tạo mới" />
                                        &nbsp;<a href="Default.aspx" class="btn btn-default">Trở về</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </InsertItemTemplate>
                </asp:FormView>
        </div>
    </div>
    <asp:ObjectDataSource ID="objSourceSanPham" runat="server" SelectMethod="ViewDetail" TypeName="ShopAround.Admin.Pages.QLSanPham.Create" InsertMethod="CreateProduct">
            <SelectParameters>
                <asp:QueryStringParameter Name="id" QueryStringField="id" Type="Int32" />
            </SelectParameters>
            <InsertParameters>
                <asp:FormParameter DbType="String" FormField="TenSanPham" Name="TenSanPham" />
                <asp:FormParameter DbType="Int32" FormField="NhomSanPhamID" Name="NhomSanPhamID" />
                <asp:FormParameter DbType="Int32" FormField="DonGia" Name="DonGia" />
                <asp:FormParameter DbType="String" FormField="BiDanh" Name="BiDanh" />
                <asp:FormParameter DbType="String" FormField="ndTomTat" Name="ndTomTat" />
                <asp:FormParameter DbType="String" FormField="ndDayDu" Name="ndDayDu" />
                <asp:Parameter DbType="String" Name="Hinh"   />
                <asp:SessionParameter DbType="String" SessionField="tkThanhVien" Name="tkThanhVien" />
            </InsertParameters>
    </asp:ObjectDataSource>
            <asp:LinqDataSource ID="linqSourceNhomSanPham" runat="server" ContextTypeName="ShopAround.Models.ShopAroundEntities" EntityTypeName="" TableName="NhomSanPhams"></asp:LinqDataSource>

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
        var editor = CKEDITOR.replace('ndDayDuTextBox');
        CKFinder.setupCKEditor(editor, '/ckfinder/');
    </script>
</asp:Content>
