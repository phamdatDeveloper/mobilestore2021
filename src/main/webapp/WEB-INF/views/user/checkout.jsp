<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đặt hàng</title>
</head>
<body>
	<!-- Begin Li's Breadcrumb Area -->
	<div class="breadcrumb-area">
		<div class="container">
			<div class="breadcrumb-content">
				<ul>
					<li><a href="/">Trang chủ</a></li>
					<li class="active">Đặt hàng</li>
				</ul>
			</div>
		</div>
	</div>
	<!-- Li's Breadcrumb Area End Here -->
	<!--Checkout Area Strat-->
	<div class="checkout-area pt-60 pb-30">
		<div class="container">
			<form:form action="/checkout" modelAttribute="formCheckout"
				id="checkout-form" method="post">
				<div class="row">
					<div class="col-lg-6 col-12">

						<div class="checkbox-form">
							<h3>Chi tiết hóa đơn</h3>
							<div class="row">
								<div class="col-md-12">
									<div class="checkout-form-list">
										<label>Họ tên <span class="required">*</span></label>
										<form:input path="userName" type="hidden"
											value="${pageContext.request.userPrincipal.name}" />
										<form:input type="text" path="name" id="name" tabindex="1"
											class="form-control" placeholder="" />
										<form:errors path="name" class="error" />
									</div>
								</div>
								<div class="col-md-12">
									<div class="checkout-form-list">
										<label>Địa chỉ <span class="required">*</span></label>

										<form:input type="text" path="shipAddress" id="shipAddress"
											tabindex="1" class="form-control" placeholder="" />
									</div>
									<form:errors path="shipAddress" class="error" />
								</div>

								<div class="col-md-12">
									<div class="checkout-form-list">
										<label>SĐT <span class="required">*</span></label>

										<form:input type="text" path="orderPhone" id="orderPhone"
											tabindex="1" class="form-control" placeholder="" />
										<form:errors path="orderPhone" class="error" />
									</div>
								</div>
								<div class="col-md-12">
									<div class="checkout-form-list">

										<label>Phương thức thanh toán <span class="required">*</span></label>
										<form:errors path="methodPay" class="error" />
										<div class="row">
											<div class="col-6">
												<button id="btn-shipcod" onclick="setShipStatus('COD')"
													type="button" class="btn">Thanh toán khi nhận hàng</button>
											</div>
											<div class="col-6">
												<button id="btn-paypal" onclick="setShipStatus('PAYPAL')"
													type="button" class="btn">Thanh toán bằng VN-PAY</button>
											</div>
										</div>

										<form:input type="hidden" path="methodPay" id="status"
											tabindex="1" class="form-control" placeholder="" />

										<form:input type="hidden" path="totalPrice" value="${totalPrice}" />
									</div>
								</div>
							</div>
						</div>



					</div>
					<div class="col-lg-6 col-12">
						<div class="your-order">
							<h3>Đơn hàng của bạn</h3>
							<div class="your-order-table table-responsive">
								<table class="table">
									<thead>
										<tr>
											<th class="cart-product-name">Tên sản phẩm</th>
											<th class="cart-product-total">Tổng tiền</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${carts }" var="cart">
											<tr class="cart_item">
												<td class="cart-product-name">
													<div class="row">
														<div class="col-3">
															<img width="50px" height="50px"
																src="<c:url value="${cart.value.product.mainImage}"/>"
																alt="cart products">
														</div>
														<div class="col-9">
															${cart.value.product.productName}<strong
																class="product-quantity"> ×
																${cart.value.quantity}</strong>
														</div>
													</div>


												</td>
												<td class="cart-product-total"><span class="amount"><fmt:formatNumber
															type="number" maxFractionDigits="3"
															value="${cart.value.totalPrice}" /></span></td>
											</tr>

										</c:forEach>
									</tbody>
									<tfoot>

										<tr class="order-total">
											<th>Tổng tiền cần thanh toán</th>
											<td><strong><span class="amount"><fmt:formatNumber
															type="number" maxFractionDigits="3" value="${totalPrice}" />
														đ</span></strong></td>
										</tr>
									</tfoot>
								</table>
							</div>
							<div class="payment-method">
								<div class="payment-accordion">
									<div id="accordion">
										<div class="card">
											<div class="card-header" id="#payment-1">
												<h5 class="panel-title">
													<a class="" data-toggle="collapse"
														data-target="#collapseOne" aria-expanded="true"
														aria-controls="collapseOne"> Phương thức thanh toán: </a>
												</h5>
											</div>
											<div id="collapseOne" class="collapse show"
												data-parent="#accordion">
												<div class="card-body">
													<p id="show-method-pay"></p>
												</div>
											</div>
										</div>
										<div class="order-button-payment">
											<input value="Đặt hàng" type="submit">

										</div>

									</div>
								</div>
							</div>
						</div>
					</div>
			</form:form>

			
		</div>
	</div>
	<!--Checkout Area End-->

	<c:if test="${alertCart.equals('paymentSuccess')}">
		<script type="text/javascript">
	         swal({
				  title: "Đặt hàng thành công.",
				  text: "Cám ơn bạn đã ủng hộ shop",
				  buttons: false,
				  confirm: true,
				  icon:"success",
				  timer: 1000,
				})
				.then((willDelete) => {
				  if (willDelete) {
					  window.location.href = '/';
				   
				  }
				});
			</script>
	</c:if>
	
	<script type="text/javascript">
function setShipStatus(status){
	$('#status').val(status);
	if(status == "COD"){
		$('#btn-shipcod').addClass( "method-payment" );
		$('#btn-paypal').removeClass( "method-payment" );		
		$('#btn-paypal').addClass( "btn" );
		$('#show-method-pay').html('Thanh toán khi nhận hàng.')
		
	}else if(status == 'PAYPAL'){
		$('#btn-paypal').addClass( "method-payment" );
		$('#btn-shipcod').removeClass( "method-payment" );
		$('#btn-shipcod').addClass( "btn" );
		$('#show-method-pay').html('Thanh toán bằng VN-PAY.')
	}
}

</script>
</body>
</html>