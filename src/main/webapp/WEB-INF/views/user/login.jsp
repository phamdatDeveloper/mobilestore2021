<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Đăng nhập</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
	<div class="breadcrumb-area">
		<div class="container">
			<div class="breadcrumb-content">
				<ul>
					<li><a href="/">Trang chủ</a></li>
					<li class="active">Đăng nhập</li>
				</ul>
			</div>
		</div>
	</div>
	<!-- Li's Breadcrumb Area End Here -->
	<!-- Begin Login Content Area -->
	<div class="page-section mb-60 d-flex justify-content-center">
		<div class="container">
			<div class="row d-flex justify-content-center">
				<div class="col-sm-8 col-md-8 col-xs-8 col-lg-8 mb-30">
					<!-- Login Form s-->
					<form name="loginForm"
						action="<c:url value='j_spring_security_login' />" id="formLogin"
						method="post">
						<div class="login-form">
							<h4 class="login-title">Đăng nhập</h4>
							<p style="    color: red; font-weight: bold;">${message}</p>
							
							<div class="row">
								<div class="col-md-12 col-12 mb-20">
									<label>Tên tài khoản</label> <input class="mb-0" type="text"
										id="username" name="username" placeholder="Tên tài khoản">
								</div>
								<div class="col-12 mb-20">
									<label>Mật khẩu</label> <input class="mb-0" type="password"
										id="password" name="password" placeholder="Mật khẩu">
								</div>
								<div class="col-md-8">
									
								</div>
								<div class="col-md-4 mt-10 mb-20 text-left text-md-right">
									<a href="/forgot"> Quên mật khẩu?</a>
								</div>
								<div class="col-md-12 d-flex justify-content-center">
									<button type="submit" class="register-button mt-0">Đăng
										nhập</button>
								</div>
							</div>
						</div>
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					</form>
				</div>
				<div
					class="col-sm-4 col-md-4 col-xs-4 col-lg-4 mb-30 d-flex align-items-center">
					<!-- Login Form s-->
					<div class="login-form">
						<h4 class="login-title">CHƯA CÓ TÀI KHOẢN ?</h4>
						<div class="row">
							<div class="col-md-12 mt-10 mb-20">
								<p>Bạn chưa có tài khoản ?</p>
								<a class="text-danger" href="/register">
									Click vào đây để đăng ký</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Login Content Area End Here -->
	<c:if test="${waitSendMail.equals('send-mail')}">
<script type="text/javascript">
	swal({
	 	title: "Một email đã gửi đến bạn !",
	  	text: "Vui lòng xác nhận email để hoàn tất quá trình đăng ký",
		buttons: false,
		timer: 2000,
 	 icon: "success",
	});


</script>
</c:if>
</body>
</html>