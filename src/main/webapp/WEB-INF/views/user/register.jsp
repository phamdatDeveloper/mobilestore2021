<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
<title>Đăng ký</title>

</head>
<body>
	<!-- Begin Li's Breadcrumb Area -->
	<div class="breadcrumb-area">
		<div class="container">
			<div class="breadcrumb-content">
				<ul>
					<li><a href="/">Trang chủ</a></li>
					<li class="active">Đăng ký</li>
				</ul>
			</div>
		</div>
	</div>
	<!-- Li's Breadcrumb Area End Here -->
	<!-- Begin Login Content Area -->
	<div class="page-section mb-60">
		<div class="container">
			<div class="row">
				<div
					class="col-sm-4 col-md-4 col-xs-4 col-lg-4 mb-30 d-flex align-items-center">
					<!-- Login Form s-->
					<div class="login-form">
						<h4 class="login-title">ĐÃ CÓ TÀI KHOẢN ???</h4>
						<div class="row">
							<div class="col-md-12 mt-10 mb-20">
								<p>Bạn đã có tài khoản ???</p>
								<a class="text-danger" href="/login"> Click vào đây để đăng
									nhập</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col-sm-8 col-md-8 col-lg-8 col-xs-8">

					<form:form action="/register" id="register-form"
						modelAttribute="registerForm" method="post">
						<div class="login-form">
							<h4 class="login-title">ĐĂNG KÝ</h4>
							
							<p style='color: red; font-weight: bold;'>${alreadyRegistered}</p>
							<div class="row">
							
								<div class="col-md-12 mb-20">
									<label>Tên tài khoản*</label>
									<form:errors path="username" class="error" />
									<form:input type="text" path="username" id="username"
										tabindex="1" class="form-control" placeholder="Tên tài khoản" />
								</div>
								<div class="col-md-12 mb-20">
									<label>Họ & tên*</label>
									<form:errors path="fullName" class="error" />
									<form:input type="text" path="fullName" id="fullName"
										tabindex="1" class="form-control" placeholder="Tên đầy đủ" />
								</div>
								<div class="col-md-12 mb-20">
									<label>Số điện thoại*</label>
									<form:errors path="numberPhone" class="error" />
									<form:input type="text" path="numberPhone" id="numberPhone"
										tabindex="1" class="form-control" placeholder="Số điện thoại" />
								</div>
								<div class="col-md-12 mb-20">
									<label>Email*</label>
									<form:errors path="email" class="error" />
									<form:input type="email" path="email" id="email" tabindex="1"
										class="form-control" placeholder="Địa chỉ email" />
								</div>
								<div class="col-md-12 mb-20">
									<label>Địa chỉ*</label>
									<form:errors path="address" class="error" />
									<form:input type="text" path="address" id="address"
										tabindex="1" class="form-control" placeholder="Địa chỉ" />
								</div>
								<div class="col-md-12 mb-20 ">
									<label>Mật khẩu*</label>
									
									<form:errors path="password" class="error" />
									<form:input type="password" path="password" id="password"
										tabindex="2" class="form-control" placeholder="Password" />
								</div>
								<div class="col-md-12 mb-20">
									<label>Xác nhận mật khẩu*</label>
									<form:errors path="passwordConfirm" class="error" />
									<form:input type="password" path="passwordConfirm"
										id="passwordConfirm" tabindex="2" class="form-control"
										placeholder="Confirm Password" />
								</div>
								<div class="col-12">
									<button type="submit" class="register-button mt-0">ĐĂNG
										KÝ</button>
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