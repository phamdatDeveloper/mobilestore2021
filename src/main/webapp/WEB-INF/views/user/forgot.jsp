<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quên mật khẩu</title>
</head>
<body>
 <!-- Begin Li's Breadcrumb Area -->
            <div class="breadcrumb-area">
                <div class="container">
                    <div class="breadcrumb-content">
                        <ul>
                            <li><a href="/">Trang chủ</a></li>
                            <li class="active">Quên mật khẩu</li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- Li's Breadcrumb Area End Here -->
            <!-- Begin Login Content Area -->
            <div class="page-section mb-60">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-12 col-md-12 col-lg-12 col-xs-12 d-flex justify-content-center">
                        
                            <form:form  action="/forgot" method="post">
                                <div class="login-form" style="text-align: center;">
                                    <h4 class="login-title">Quên mật khẩu</h4>
                                    <p>Vui lòng điền email đã đăng ký để lấy lại mật khẩu</p>
                                   
                                    <div class="row">
                                        <div class="col-md-12 mb-20">
                                            <label></label>
                                            <input class="mb-0" name="email" type="email" placeholder="">
                                            <p style="color:red ;">${message }</p>
                                        </div>
                                        <div class="col-12 d-flex justify-content-center">
                                            <button class="register-button mt-0">Gửi</button>
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