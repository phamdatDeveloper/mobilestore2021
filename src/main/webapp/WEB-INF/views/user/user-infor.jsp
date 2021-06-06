<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thông tin tài khoản</title>

</head>
<body>

	<div class="breadcrumb-area">
		<div class="container">
			<div class="breadcrumb-content">
				<ul>
					<li><a href="index.html">Home</a></li>
					<li class="active">Thông tin tài khoản</li>
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
				<div class="col-sm-8 col-md-8 col-lg-8 col-xs-8">
					<form:form action="/user" id="register-form"
						modelAttribute="formEditUser" method="get">
						<div class="login-form">
							<h4 class="login-title">THÔNG TIN TÀI KHOẢN</h4>
							<div class="row">
								<div class="col-md-6 col-12 mb-20">
									<label>Họ tên</label>

									<form:input type="text" path="fullName" id="fullName"
										tabindex="1" class="mb-0" placeholder="Tên đầy đủ" />

								</div>
								<div class="col-md-6 col-12 mb-20">
									<label>SĐT</label>

									<form:errors path="numberPhone" class="error" />
									<form:input type="text" path="numberPhone" id="numberPhone"
										tabindex="1" class="mb-0" placeholder="Số điện thoại" />
								</div>
								<div class="col-md-12 mb-20">
									<label>Email (Email là mặc định bạn không thể sửa)</label>
									<form:input type="text" path="email" id="email" tabindex="1"
										class="mb-0" placeholder="Email" disabled="true" />
								</div>
								<div class="col-md-12 mb-20">
									<label>Địa chỉ*</label>

									<form:errors path="address" class="error" />
									<form:input type="text" path="address" id="address"
										tabindex="1" class="mb-0" placeholder="Địa chỉ" />
								</div>
								<div class="col-3">
									<button class="register-button mt-0">Lưu</button>
								</div>

							</div>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
	<!-- Login Content Area End Here -->
</body>
</html>