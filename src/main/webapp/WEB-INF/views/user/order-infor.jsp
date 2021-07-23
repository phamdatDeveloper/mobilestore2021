<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thông tin đơn hàng</title>
</head>
<body>
	<!-- Begin Li's Breadcrumb Area -->
	<div class="breadcrumb-area">
		<div class="container">
			<div class="breadcrumb-content">
				<ul>
					<li><a href="index.html">Trang chủ</a></li>
					<li class="active">Thông tin đơn hàng</li>
				</ul>
			</div>
		</div>
	</div>
	<!-- Li's Breadcrumb Area End Here -->
	<!-- Begin Login Content Area -->
	<div class="page-section mb-60">
		<div class="container">
			<div class="row">
				<div class="col-sm-4 col-md-4 col-xs-4 col-lg-4 mb-30">
					<!-- Login Form s-->
					<div class="login-form">
						<ul>
							<li><a href="/user">Thông tin tài khoản</a></li>
							<li><a href="/changepassword">Đổi mật khẩu</a></li>
							<li><a href="/orderInfor">Thông tin đơn hàng</a></li>
						</ul>
					</div>
				</div>
				<div
					class="col-sm-8 col-md-8 col-lg-8 col-xs-8 d-flex justify-content-center">
					<table id="datatable"
						class="table table-striped table-bordered dt-responsive nowrap"
						style="border-collapse: collapse; border-spacing: 0; width: 100%;">

						<thead>
							<tr>
								<th>Tên khách hàng</th>
								<th>Địa chỉ</th>

								<th>Tổng tiền</th>
								<th>Trạng thái</th>
								<th>Tác vụ</th>
							</tr>
						</thead>

						<tbody>
							<c:forEach items="${listOrder }" var="item">
								<tr>
									<td>${item.name}</td>
									<td>${item.shipAddress}</td>

									<td><fmt:formatNumber type="number" maxFractionDigits="3"
											value="${item.totalPrice}" /> đ</td>
									<td id="display-status-${item.id}"><c:choose>
											<c:when test="${item.statusOrder.equals('SUCCESS')}">
												<span class="badge badge-success">Đã thanh toán</span>

											</c:when>
											<c:when test="${item.statusOrder.equals('DELIVERED')}">
												<span class="badge badge-secondary">Đã giao hàng</span>

											</c:when>
											<c:when test="${item.statusOrder.equals('DELIVERING')}">
												<span class="badge badge-info">Đang giao hàng</span>

											</c:when>
											<c:otherwise>
												<span class="badge badge-danger">Hủy</span>

											</c:otherwise>
										</c:choose></td>
									<td><button type="button" class="btn btn-info"
											onclick="showOrderDetail(${item.id})" data-toggle="modal"
											data-target="#order-detail-modal">
											<i class="fa fa-info-circle"></i>
										</button></td>
								</tr>
							</c:forEach>


						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>


	<div id="order-detail-modal" class="modal fade bd-example-modal-lg"
		tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
		aria-hidden="true">
		<div class="modal-dialog modal-lg">

			<div class="modal-content">
				<div style="padding: 30px">
					<table id="data-table-detail"
						class="table table-striped table-bordered dt-responsive nowrap"
						style="border-collapse: collapse; border-spacing: 0; width: 100%;">

						<thead>
							<tr>
								<th>Tên sản phẩm</th>
								<th>Giá</th>

								<th>Số lượng</th>
								<th>Tổng tiền</th>
								
							</tr>
						</thead>

						<tbody id="body-table-detail">
							<tr>
								<td>abc</td>
								<td>abc</td>
								<td>abc</td>
								<td>abc</td>
								
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>

	<!-- Login Content Area End Here -->
	<script type="text/javascript">
		$(document).ready(function() {
			$('#datatable').DataTable();
			
		});
		
		
	//function show order detail
		function showOrderDetail(id){
			$.ajax({
		        type: 'get',
		        url: '/api/orderdetail/'+id,
		        success: function (data) {
		        	$('#data-table-detail').DataTable();
		        	console.log(data);
		        	var html ="";
		        	for(var i=0;i< data.length;i++){
		        		 console.log(data[i].productName);
						html += '<tr>';
						html +='<td>'+data[i].productName+'</td>';
						if(data[i].priceSale != 0){
							var priceSale = data[i].priceSale;
							html +='<td>'+priceSale.toString().replace(/(.)(?=(\d{3})+$)/g,"$1,")+'</td>';
						}else{
							var price = data[i].price;
							html +='<td>'+price.toString().replace(/(.)(?=(\d{3})+$)/g,"$1,")+'</td>';
						}
						html +='<td>'+data[i].quatity+'</td>';
						var totalPrice = data[i].totalPrice;
						html +='<td>'+totalPrice.toString().replace(/(.)(?=(\d{3})+$)/g,"$1,")+'</td>';
						html += '</tr>';
					 }
		        	 $('#body-table-detail').html(html);
		        }
		    });
		}
		
		
	</script>

</body>
</html>