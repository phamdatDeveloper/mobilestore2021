<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <!-- Begin Li's Breadcrumb Area -->
            <div class="breadcrumb-area">
                <div class="container">
                    <div class="breadcrumb-content">
                        <ul>
                            <li><a href="/">Trang chủ</a></li>
                            <li class="active">Đặt lại mật khẩu</li>
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
                            <form:form action="/reset" method="post">
                     
                                <div class="login-form">
                                    <h4 class="login-title">THAY ĐỔI MẬT KHẨU</h4>
                                    <div class="row">
                                        
                                        <div class="col-md-12 mb-20">
                                            
                                            <input class="mb-0" name="password" type="password" placeholder="Mật khẩu mới">
                                        </div>
                                        <div class="col-md-6 mb-20">
                                            <input  type="hidden" id="confirmtoken" name = "confirmtoken" class="form-control" value="${confirmtoken }"/>
                                        </div>
                                        <div class="col-12 d-flex justify-content-center">
                                            <button class="register-button mt-0 ">XÁC NHẬN</button>
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