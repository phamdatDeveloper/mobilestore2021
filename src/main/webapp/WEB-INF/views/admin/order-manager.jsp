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
									<li class="breadcrumb-item"><a href="#">Quản lý đơn
											hàng</a></li>
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
								<h4 class="m-t-0 header-title mb-4">
									<b>Danh sách đơn hàng</b>
								</h4>

								<table id="datatable-buttons"
									class="table table-striped table-bordered dt-responsive nowrap"
									style="border-collapse: collapse; border-spacing: 0; width: 100%;">

									<thead>
										<tr>
											<th>ID đơn hàng</th>
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
											<td>${order.id}</td>
												<td>${order.name}</td>
												<td><fmt:formatNumber type="number"
														maxFractionDigits="3" value="${order.totalPrice}" /> đ</td>
												<td><fmt:formatDate pattern="dd/MM/yyyy"
														value="${order.createDate }" /></td>
												<td id="display-status-${order.id}">
												<c:choose>
														<c:when test="${order.statusOrder.equals('SUCCESS')}">
															<span class="badge badge-success">Đã thanh toán</span>
															
														</c:when>
														<c:when test="${order.statusOrder.equals('DELIVERED')}">
															<span class="badge badge-secondary">Đã giao hàng</span>
															
														</c:when>
														<c:when test="${order.statusOrder.equals('DELIVERING')}">
															<span class="badge badge-info">Đang giao hàng</span>
															
														</c:when>
														<c:otherwise>
															<span class="badge badge-danger">Khóa</span>

														</c:otherwise>
													</c:choose>
													</td>
												
												<td>
													<button type="button" class="btn btn-primary"
														onclick="showEditOrder(${order.id})" data-toggle="modal"
														data-target="#edit-category-Modal">Sửa</button>
													
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
					<form action="" id="edit-order-status">
						<!-- Modal body -->
						<div class="modal-body">
							<table class="table "
								style="border-collapse: collapse; border-spacing: 0; width: 100%;">

								<thead>
									<tr>
										<th>Tên</th>
										<th>Tác vụ</th>

									</tr>
								</thead>

								<tbody>
									<tr>
										<td>Trạng thái</td>
										<td><input type="hidden" name="id" id="input-id">
											<select name="statusOrder" id="editOrderStatus"
											class="custom-select">
												<option value="DELIVERING">Đang giao</option>
												<option value="DELIVERED">Đã giao</option>
												<option value="SUCCESS">Đã thanh toán</option>
												<option value="FAIL">Hủy</option>
										</select></td>
									</tr>


								</tbody>
							</table>
						</div>

						<!-- Modal footer -->
						<div class="modal-footer">
							<button type="button" onclick="saveOrder()"
								class="btn btn-danger" data-dismiss="modal">Lưu</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
function showEditOrder(id){
	$.ajax({
        type: 'get',
        url: '/api/order/'+id,
        success: function (data) {
        	$('#editOrderStatus').val(data.statusOrder);
        	$('#input-id').val(data.id);
        }
    });
}

function saveOrder(){
	
	ajaxForm();
		
}

function ajaxForm(){
	var data =  $('#edit-order-status').serialize();
	console.log(JSON.stringify(data));
	$.ajax({
		type : "put",
		data : data,
		url : "/api/orders?"+data,
		dataType : 'JSON',
		 success: function (value) {
			 var status = value.statusOrder;
			 var html ='';
			 if(status === 'SUCCESS'){
				 html+= '<span class="badge badge-success">Đã thanh toán</span>'
			 }else if(status === 'DELIVERED'){
				 html+= '<span class="badge badge-secondary">Đã giao hàng</span>'
			 }else if(status === 'DELIVERING'){
				 html+= '<span class="badge badge-info">Đang giao hàng</span>'
			 }else{
				 html+= '<span class="badge badge-danger">Hủy</span>'
			 }
			 
			 
			 $('#display-status-'+value.id).html(html);
			
			 swal("Chỉnh sửa thành công !", {
			    	buttons: false,
			  		timer: 1000,
			      icon: "success",
			    });
		 }
	});
}
</script>
</body>
</html>