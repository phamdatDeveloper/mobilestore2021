<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
prefix="decorator"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Danh sách sản phẩm</title>
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
									<li class="breadcrumb-item"><a href="#">Quản lý sản
											phẩm</a></li>
									<li class="breadcrumb-item active">Danh sách sản phẩm</li>
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
									<b>Danh sách sản phẩm</b>

								</h4>
								<a href="product-edit"><button class="btn btn-primary"
										title="Thêm sản phẩm">
										<i class="fas fa-plus-circle"></i>
									</button></a> <a href="product-edit"><button class="btn btn-danger"
										title="Xoá nhiều sản phẩm">
										<i class="fas fa-trash-alt"></i>
									</button></a>
								<table id="datatable-buttons"
									class="table table-striped table-bordered dt-responsive nowrap"
									style="border-collapse: collapse; border-spacing: 0; width: 100%;">

									<thead>
										<tr>
											<th><input type="checkbox" /></th>
											<th>Tên sản phẩm</th>
											<th>Hình ảnh</th>
											<th>Giá</th>
											<th>Loại sản phẩm</th>
											<th>Trạng thái</th>
											<th>Số lượng</th>
											<th>Tác vụ</th>
											<th>Người tạo</th>
											<th>Người chỉnh sửa</th>
										</tr>
									</thead>

									<tbody>
										<c:forEach items="${products}" var="product">
											<tr>
												<td><input type="checkbox" value="${product.id }"/></td>
												<td>${product.productName}</td>
												<td><img style="height: 100px; width: 100px;"
													src=" <c:url value="/${product.mainImage}"/>"></td>
												<td id="price">${product.price}</td>
												<td>Iphone</td>
												<td>Mới</td>
												<td>${product.quantity}</td>
												<td><a href="product-edit/${product.id}"><button
															class="btn btn-primary">
															<i class="fas fa-edit"></i>
														</button></a> <a href="product-edit"><button class="btn btn-danger">
															<i class="fas fa-trash-alt"></i>
														</button></a> <a href="product-edit"><button class="btn btn-dark">
															<i class="fas fa-lock"></i>
														</button></a></td>
												<td>Phạm Đạt</td>
												<td>Lê Duy</td>
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



		<!-- Footer Start -->
		<footer class="footer">
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-12">Mobile Store</div>
				</div>
			</div>
		</footer>
		<!-- end Footer -->

	</div>
	
</body>
</html>