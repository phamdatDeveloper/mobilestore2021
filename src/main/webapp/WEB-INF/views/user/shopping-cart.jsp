<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/taglib.jsp" %>
<!doctype html>
<html class="no-js" lang="zxx">
    
<!-- shopping-cart31:32-->
<head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Shopping Cart</title>
    </head>
    <body>

            <!-- Begin Li's Breadcrumb Area -->
            <div class="breadcrumb-area">
                <div class="container">
                    <div class="breadcrumb-content">
                        <ul>
                            <li><a href="index.html">Trang chủ</a></li>
                            <li class="active">Giỏ hàng</li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- Li's Breadcrumb Area End Here -->
            <!--Shopping Cart Area Strat-->
            <div class="Shopping-cart-area pt-60 pb-60">
                <div class="container">
                    <div class="row">
                        <div class="col-12">
                            <form action="#">
                                <div class="table-content table-responsive">
                                    <table class="table" id="table-cart">
                                        <thead>
                                            <tr>
                                                <th class="li-product-remove">Xoá</th>
                                                <th class="li-product-thumbnail">Hình ảnh</th>
                                                <th class="cart-product-name">Tên sản phẩm</th>
                                                <th class="li-product-price">Giá</th>
                                                <th class="li-product-quantity">Số lượng</th>
                                                <th class="li-product-subtotal">Tổng giá</th>
                                            </tr>
                                        </thead>
                                        <tbody id="body-table-cart">
                                        <c:forEach items ="${carts }" var="cart">
                                        	
                                       
                                            <tr>
                                            	<input hidden id="idProductCart" value ="${cart.value.product.id }" >
                                                <td class="li-product-remove"><i class="fa fa-times" onclick="confirmDeleteCart(${cart.value.product.id})"></i></td>
                                                <td class="li-product-thumbnail"><a href="#"><img src="<c:url value="${cart.value.product.mainImage}"/>" with="150px" height="150px" alt="Li's Product Image"></a></td>
                                                <td class="li-product-name"><a href="#">${cart.value.product.productName}</a></td>
                                                <c:choose>
                                                	<c:when test="${cart.value.product.isSale != true }">
                                                	<td class="li-product-price">
                                                		<input hidden id="price-${cart.value.product.id}" value ="${cart.value.product.price }" ><span class="amount" ><fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${cart.value.product.price}" />đ</span>
                                                		
                                                		</td>
                                                	</c:when>
                                                	<c:otherwise>
													   <td class="li-product-price"><input hidden id="price-${cart.value.product.id}" value ="${cart.value.product.priceSale}" ><span class="amount" ><fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${cart.value.product.priceSale}" />đ</span>
													   <p class="old-price" style="text-decoration: line-through;color: red;"><fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${cart.value.product.price}" /> đ</p>
													   </td>
													 </c:otherwise>
                                                </c:choose>
                                               
                                               <td>
                                               
                                               		<div class="input-group">
                                               		
														  <input type="button" value="-" class="button-minus" data-field="quantity" onclick ="decreaseQuantity(${cart.value.product.id})">
														  <input type="number" step="1" max="" value="${cart.value.quantity }" name="quantity" class="quantity-field" id="quantity-product-${cart.value.product.id}">
														  <input type="button" value="+" class="button-plus" data-field="quantity" onclick ="increaseQuantity(${cart.value.product.id})">
													</div>
													
												</td>
                                                
                                                <td class="product-subtotal"><span class="amount" id="product-subtotal-${cart.value.product.id}"><fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${cart.value.totalPrice}" />đ</span></td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                
                                <div class="row">
                                    <div class="col-md-5 ml-auto">
                                        <div class="cart-page-total">
                                            <h2>Tổng tiền</h2>
                                            <ul>
                                                
                                                <li>Tổng thanh toán <span id="total-pay"><fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${totalPrice}" /></span></li>
                                            </ul>
                                            <a href="/checkout">Thanh toán</a>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <!--Shopping Cart Area End-->
            <!-- Begin Footer Area -->           
             <c:choose>
	         <c:when test = "${alertCart.equals('loginnull')}">
	         <script type="text/javascript">
	         swal({
				  title: "Bạn chưa đăng nhập.",
				  text: "Vui lòng đăng nhập !",
				  buttons: true,
				  confirm: "Ok",
				  
				})
				.then((willDelete) => {
				  if (willDelete) {
					  window.location.href = '/login';
				   
				  }
				});
			</script>
			</c:when>        
			<c:when test="${alertCart.equals('cartnull')}">
			<script type="text/javascript">
	           swal({
				  title: "Giỏ hàng của bạn đang trống",
				  text: "Vui lòng thêm sản phẩm vào giỏ hàng để tiến hành thanh toán.",
				  buttons: true,
				  confirm: "Ok",
				  
				})
				.then((willDelete) => {
				  if (willDelete) {
					  window.location.href = '/';
				   
				  }
				});
	           </script>
			</c:when>
	         <c:otherwise>
	         
	         </c:otherwise>
	         
	      </c:choose>
			
            <script type="text/javascript">
            
            function increaseQuantity(id) {
            	var idInput = "#quantity-product-"+id;

            	var quantityProduct = $(idInput).val();
            	var idPrice ="#price-"+id;
            	var price = $(idPrice).val();
            	var subPrice ="#product-subtotal-"+id;
            	var total = (parseInt(quantityProduct)+1)*price;
            	editCart(id,parseInt(quantityProduct)+1);
      
            	$(idInput).val(parseInt(quantityProduct)+1);
            	$(subPrice).html(total.toString().replace(/(.)(?=(\d{3})+$)/g,'$1,'));
            };
            function decreaseQuantity(id) {
            	var idInput = "#quantity-product-"+id;
 
            	var quantityProduct = $(idInput).val();
            	console.log(quantityProduct);
            	if (quantityProduct < 1 || (quantityProduct-1) == 0) {
            		confirmDeleteCart(id);
            		
            	}else{
            		var idInput = "#quantity-product-"+id;
            	var quantityProduct = $(idInput).val();
            	var idPrice ="#price-"+id;
            	var price = $(idPrice).val();
            	var subPrice ="#product-subtotal-"+id;
            	var total = (parseInt(quantityProduct)-1)*price;
            	editCart(id,parseInt(quantityProduct)-1);

          
            		$(idInput).val(parseInt(quantityProduct)-1);
            	
            	$(subPrice).html(total.toString().replace(/(.)(?=(\d{3})+$)/g,'$1,'));
            		
            	};

            };
            
            </script>
    </body>

</html>
