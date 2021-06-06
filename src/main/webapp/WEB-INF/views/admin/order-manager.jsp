<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quản lý đơn hàng</title>
</head>
<body>
       <div class="content-page">
            <div class="content">

                <!-- Start Content-->
                <div class="container-fluid">
                    <!-- start page title -->
                    <div class="row">
                        <div class="col-12">
                            <div class="page-title-box">
                                <h4 class="page-title">Xin chào !</h4>
                                <div class="page-title-right">
                                    <ol class="breadcrumb p-0 m-0">
                                        <li class="breadcrumb-item"><a href="#">LIMUPA</a></li>
                                        <li class="breadcrumb-item"><a href="#">Quản lý đơn hàng</a></li>
                                        <li class="breadcrumb-item active">Danh sách đơn hàng</li>
                                    </ol>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                    </div>
                    <!-- end page title -->
                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-body table-responsive">
                                    <h4 class="m-t-0 header-title mb-4"><b>Danh sách đơn hàng</b></h4>

                                    <table id="datatable-buttons"
                                        class="table table-striped table-bordered dt-responsive nowrap"
                                        style="border-collapse: collapse; border-spacing: 0; width: 100%;">

                                        <thead>
                                            <tr>
                                                <th>Tên khách hàng</th>
                                                
                                               
                                                <th>Tổng tiền</th>
                                                <th>Ngày tạo đơn</th>

                                                <th>Trạng thái</th>
                                                <th>Tác vụ</th>
                                            </tr>
                                        </thead>

                                        <tbody>
                                        <c:forEach items="${listOrder}" var="order">
                                       
                                            <tr>
                                                <td>${order.name}</td>
                                                <td> <fmt:formatNumber type="number" maxFractionDigits="3" value="${order.totalPrice}" /> đ</td>
                                                <td> <fmt:formatDate pattern="dd/MM/yyyy" value="${order.createDate }" /></td>
												
                                                <td>${order.statusOrder}</td>
                                                <td>
                                                    <button type="button" class="btn btn-primary" data-toggle="modal"
                                                        data-target="#edit-category-Modal">
                                                        Sửa
                                                    </button>
                                                    <button type="button" class="btn btn-primary" data-toggle="modal"
                                                        data-target="#view-category-Modal">
                                                        Xem chi tiết
                                                    </button>
                                                </td>
                                            </tr>
                                            </c:forEach>

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- end row -->

                </div>
                <!-- end container-fluid -->

            </div>
            <!-- end content -->
            <!-- The Modal -->
            <div class="modal" id="edit-category-Modal">
                <div class="modal-dialog">
                    <div class="modal-content">

                        <!-- Modal Header -->
                        <div class="modal-header">
                            <h4 class="modal-title">Chỉnh sửa trạng thái đơn hàng</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>

                        <!-- Modal body -->
                        <div class="modal-body">
                            <table class="table " style="border-collapse: collapse; border-spacing: 0; width: 100%;">

                                <thead>
                                    <tr>
                                        <th>Tên </th>
                                        <th>Tác vụ</th>

                                    </tr>
                                </thead>

                                <tbody>
                                    <tr>
                                        <td>Trạng thái</td>
                                        <td>
                                            <select name="role" id="" class="custom-select">
                                                <option value="volvo">Mới</option>
                                                <option value="saab">Đang chuẩn bị</option>
                                                <option value="saab">Đang giao</option>
                                                <option value="saab">Đã giao</option>
                                                <option value="saab">Hủy</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Trạng thái</td>
                                        <td>
                                            <div class="custom-control custom-switch">
                                                <input type="checkbox" class="custom-control-input" id="switch1">
                                                <label class="custom-control-label" for="switch1">Khóa</label>
                                            </div>
                                        </td>
                                    </tr>

                                </tbody>
                            </table>
                        </div>

                        <!-- Modal footer -->
                        <div class="modal-footer">
                            <button type="button" class="btn btn-danger" data-dismiss="modal">Lưu</button>
                        </div>

                    </div>
                </div>
            </div>


            <!-- Footer Start -->
            <footer class="footer">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-12">
                            Mobile Store
                        </div>
                    </div>
                </div>
            </footer>
            <!-- end Footer -->

        </div>

</body>
</html>