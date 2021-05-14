<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Lỗi</title>
</head>
<body>
	<!-- Error 404 Area Start -->
	<div class="error404-area pt-30 pb-60">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="error-wrapper text-center ptb-50 pt-xs-20">
						<div class="error-text">
							
							<h2>Opps! Không tìm thấy trang</h2>
							<p>Xin lỗi nhưng trang bạn đang tìm kiếm không tồn tại.</p>
						</div>
						<div class="search-error">
							<form id="search-form" action="#">
								<input type="text" placeholder="Tìm kiếm">
								<button>
									<i class="zmdi zmdi-search"></i>
								</button>
							</form>
						</div>
						<div class="error-button">
							<a href="/">Trở về trang chủ</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Error 404 Area End -->
</body>
</html>