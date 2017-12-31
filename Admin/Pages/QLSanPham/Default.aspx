<%@ Page Title="Danh sách sản phẩm" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ShopAround.Admin.Pages.QLSanPham.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/datatables/1.10.12/css/dataTables.bootstrap.min.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    h<!--Begin Datatables--><div class="row">
        <div class="col-lg-12">
            <div class="box">
                <header>
                    <div class="icons"><i class="fa fa-table"></i></div>
                    <h5><%: Page.Title %></h5>
                </header>
                <div id="collapse4" class="body">
                    <table id="dataTable" class="table table-bordered table-condensed table-hover">
                        <thead>
                            <tr>
                                <th>Hình</th>
                                <th>Mã sản phẩm</th>
                                <th>Tên sản phẩm</th>
                                <th>Giá bán</th>
                                <th>Thuộc nhóm</th>
                                <th>Cập nhật lần cuối</th>
                                <th>Thành viên đăng</th>
                                <th class="text-center sorting_asc_disabled sorting_desc_disabled"></th>
                                <th class="text-center sorting_asc_disabled sorting_desc_disabled"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="repeaterSanPham" runat="server" ItemType="ShopAround.Models.SanPham" DataSourceID="LinqDataSource1" >
                                <ItemTemplate>
                                    <tr>
                                        <td>
                                            <img src="/Photos/Products/<%# Eval("Hinh") %>" class="img-responsive" />
                                        </td>
                                        <td>
                                           <%# Eval("MaSanPham") %>
                                        </td>
                                        <td>
                                            <a href="<%# GetRouteUrl("ProductDetailRoute",new { alias = Eval("BiDanh"),id = Eval("MaSanPham") }) %>" target="_blank"><%# Eval("TenSanPham") %></a>
                                        </td>
                                         <td>
                                             <%# Eval("DonGia","{0:#,##0}").Replace(',','.') %> đ
                                        </td>
                                        <td>
                                            <%# Eval("NhomSanPham.TenNhom") %> 
                                        </td>
                                        <td>
                                            <%# Eval("NgayCapNhat","{0:dd/MM/yyyy}") %> 
                                        </td>
                                        <td>
                                            <%# Eval("tkThanhVien") %> 
                                        </td>
                                        <td class="text-center">
                                            <a href="Info.aspx?MaSanPham=<%# Eval("MaSanPham") %>" class="btn btn-primary btn-sm">Thông tin</a>
                                        </td>
                                          <td class="text-center">
                                            <a onclick="return confirm('Xác nhận xóa <%# Eval("TenSanPham") %> ?');" href="Delete.aspx?MaSanPham=<%# Eval("MaSanPham") %>" class="btn btn-default btn-sm">Xóa</a>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>

                        </tbody>
                    </table>
                </div>
            </div>
                                <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="ShopAround.Models.ShopAroundEntities" EntityTypeName="" TableName="SanPhams"></asp:LinqDataSource>

        </div>
    </div>
    <!-- /.row -->
    <!--End Datatables-->
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Scripts" runat="server">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.0/jquery-ui.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/datatables/1.10.12/js/jquery.dataTables.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/datatables/1.10.12/js/dataTables.bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.tablesorter/2.26.6/js/jquery.tablesorter.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jqueryui-touch-punch/0.2.3/jquery.ui.touch-punch.min.js"></script>
    <script>
        $(function () {
            Metis.MetisTable();
            Metis.metisSortable();
        });
    </script>
</asp:Content>
