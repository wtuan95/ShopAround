<%@ Page Title="Danh sách bài viết" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ShopAround.Admin.Pages.QLBaiViet.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/datatables/1.10.12/css/dataTables.bootstrap.min.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <!--Begin Datatables--><div class="row">
        <div class="col-lg-12">
            <div class="box">
                <header>
                    <div class="icons"><i class="fa fa-table"></i></div>
                    <h5><%: Page.Title %></h5>
                </header>
                <div id="collapse4" class="body">
                    <table id="dataTable" class="table table-bordered table-hover">
                        <thead>
                            <tr>
                                <th>Mã bài viết</th>
                                <th>Tên bài viết</th>
                                <th>Số lần đọc</th>
                                <th>Bí danh</th>
                                <th>Thành viên đăng</th>
                                <th>Ngày đăng</th>
                                <th>Trạng thái</th>
                                <th class="text-center sorting_asc_disabled sorting_desc_disabled"></th>
                                <th class="text-center sorting_asc_disabled sorting_desc_disabled"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="repeaterBaiViet" runat="server" ItemType="ShopAround.Models.TinTuc" DataSourceID="LinqDataSource1" >
                                <ItemTemplate>
                                    <tr>
                                        <td><%# Eval("maBV") %></td>
                                        <td>
                                            <a href="<%# GetRouteUrl("PostContentRoute",new { bidanh = Eval("biDanh") }) %>" target="_blank"><%# Eval("tenBV") %></a>
                                        </td>
                                         <td>
                                             <%# Eval("soLanDoc") %> 
                                        </td>
                                        <td>
                                            <%# Eval("biDanh") %> 
                                        </td>
                                        <td>
                                            <%# Eval("tkThanhVien") %> 
                                        </td>
                                        <td>
                                            <%# Eval("ngayDang","{0:dd/MM/yyyy}") %>
                                        </td>
                                        <td>
                                            <%# (bool)Eval("daDuyet") == true ? "<span class='label label-success'>Đã duyệt</span>": "<span class='label label-warning'>Chưa duyệt</span>" %>
                                        </td>
                                        <td class="text-center">
                                            <a href="Info.aspx?maBV=<%# Eval("maBV") %>" class="btn btn-danger btn-sm">Thông tin</a>
                                        </td>
                                          <td class="text-center">
                                            <a onclick="return confirm('Xác nhận xóa <%# Eval("tenBV") %> ?');" href="Delete.aspx?maBV=<%# Eval("maBV") %>" class="btn btn-default btn-sm">Xóa</a>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>

                        </tbody>
                    </table>
                </div>
            </div>
                                <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="ShopAround.Models.ShopAroundEntities" EntityTypeName="" TableName="TinTucs"></asp:LinqDataSource>

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
