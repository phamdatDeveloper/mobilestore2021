<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		 <div class="page-section mb-60">
            <div class="container">
                <div class="row">
                    <div class="col-sm-9 col-md-9 col-lg-9 col-xs-9 d-flex justify-content-center" style="margin: auto">
                        <form action="http://localhost:8080/vnpay" id="frmCreateOrder" method="post">
                            <div class="login-form">
                                <h4 class="login-title text-center">Số tiền bạn phải thanh toán là</h4>
                                <div class="row">
                                    <div class="col-md-12 mb-20" style="text-align: center;color: red;">
                                        <h1><fmt:formatNumber type="number" maxFractionDigits="3" value="${totalPrice}" /> đ</h1>
                                        <input type="hidden" value="${totalPrice}" id="totalPrice">
                                    </div>
                               
                                    
                                    <div class="col-12 d-flex justify-content-center">
                                        <button type="submit" class="register-button mt-0" id="btn-payment">Thanh toán</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
		<div class="table-responsive">
			<form  method="post" style="display: none;">
				<div class="form-group">
					<label for="language">Loại hàng hóa </label> <select
						name="ordertype" id="ordertype" class="form-control">
						<option value="topup">Nạp tiền điện thoại</option>
						<option value="billpayment">Thanh toán hóa đơn</option>
						<option value="fashion">Thời trang</option>
					</select>
				</div>
				<div class="form-group">
					<label for="amount">Số tiền</label> 
						 <input id="amount"  name="amount"  value="${totalPrice }" />
				</div>
				<div class="form-group">
					<label for="OrderDescription">Nội dung thanh toán</label>
					<textarea class="form-control" cols="20" id="vnp_OrderInfo"
						name="vnp_OrderInfo" rows="2">Thanh toan don hang test</textarea>
				</div>
				<div class="form-group">
					<label for="bankcode">Ngân hàng</label> <select name="bankcode"
						id="bankcode" class="form-control">
						<option value="">Không chọn</option>
						<option value="NCB">Ngan hang NCB</option>
						<option value="SACOMBANK">Ngan hang SacomBank</option>
						<option value="EXIMBANK">Ngan hang EximBank</option>
						<option value="MSBANK">Ngan hang MSBANK</option>
						<option value="NAMABANK">Ngan hang NamABank</option>
						<option value="VISA">Thanh toan qua VISA/MASTER</option>
						<option value="VNMART">Vi dien tu VnMart</option>
						<option value="VIETINBANK">Ngan hang Vietinbank</option>
						<option value="VIETCOMBANK">Ngan hang VCB</option>
						<option value="HDBANK">Ngan hang HDBank</option>
						<option value="DONGABANK">Ngan hang Dong A</option>
						<option value="TPBANK">Ngân hàng TPBank</option>
						<option value="OJB">Ngân hàng OceanBank</option>
						<option value="BIDV">Ngân hàng BIDV</option>
						<option value="TECHCOMBANK">Ngân hàng Techcombank</option>
						<option value="VPBANK">Ngan hang VPBank</option>
						<option value="AGRIBANK">Ngan hang Agribank</option>
						<option value="MBBANK">Ngan hang MBBank</option>
						<option value="ACB">Ngan hang ACB</option>
						<option value="OCB">Ngan hang OCB</option>
					</select>
				</div>
				<div class="form-group">
					<label for="language">Ngôn ngữ</label> <select name="language"
						id="language" class="form-control">
						<option value="vn">Tiếng Việt</option>
						<option value="en">English</option>
					</select>
				</div>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				<button type="submit" class="btn btn-default">Thanh toán</button>
			</form>
		</div>
		
	</div>
	<link href="https://pay.vnpay.vn/lib/vnpay/vnpay.css" rel="stylesheet" />
	<script src="https://pay.vnpay.vn/lib/vnpay/vnpay.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
		 // executes when HTML-Document is loaded and DOM is ready
		
		 $('#amount').val($('#totalPrice').val());
		});
		
		$("#frmCreateOrder").submit(function() {
			var amoutint =  parseInt(${totalPrice });
			var postData = 'topup&amount='+amoutint+'&vnp_OrderInfo=Thanh%20toan%20don%20hang%20test&bankcode=&language=vn&_csrf=${_csrf.token}';
			var submitUrl = $("#frmCreateOrder").attr("action");
			$.ajax({
				type : "POST",
				url : submitUrl,
				data : postData,
				dataType : 'JSON',
				success : function(x) {
					if (x.code === '00') {
						if (window.vnpay) {
							vnpay.open({
								width : 768,
								height : 600,
								url : x.data
							});
						} else {
							location.href = x.data;
						}
						return false;
					} else {
						alert(x.Message);
					}
				}
			});
			return false;
		});
	</script>
</body>
</html>