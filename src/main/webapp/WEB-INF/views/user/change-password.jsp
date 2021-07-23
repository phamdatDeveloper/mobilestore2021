<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thay đổi mật khẩu</title>
</head>
<body>
	<!-- Begin Li's Breadcrumb Area -->
	<div class="breadcrumb-area">
		<div class="container">
			<div class="breadcrumb-content">
				<ul>
					<li><a href="index.html">Home</a></li>
					<li class="active">Register</li>
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
					<form action="#">
						<div class="login-form">
							<h4 class="login-title text-center">THAY ĐỔI MẬT KHẨU</h4>
							<div class="row">
								<div class="col-md-6 mb-20">
									<label>Mật khẩu mới</label> <input class="mb-0" id="password" name="password" type="password"
										placeholder="Điền mật khẩu">
								</div>
								<div class="col-md-6 mb-20">
									<label>Xác nhận mật khẩu</label> <input class="mb-0"
										name="confirmpassword" id="confirmpassword" type="password" placeholder="Xác nhận mật khẩu">
								</div>
								<div class="col-12 d-flex justify-content-center">
									<button class="register-button mt-0">XÁC NHẬN</button>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- Login Content Area End Here -->
</body>
</html>