<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/taglib.jsp" %>
  <!-- Begin Header Area -->
            <header>
                <!-- Begin Header Middle Area -->
                <div class="header-middle pl-sm-0 pr-sm-0 pl-xs-0 pr-xs-0">
                    <div class="container">
                        <div class="row">
                            <!-- Begin Header Logo Area -->
                            <div class="col-lg-3">
                                <div class="logo pb-sm-30 pb-xs-30">
                                    <a href="<c:url value="/"/>">
                                        <img src="<c:url value ="template/user/images/menu/logo/1.jpg"/>" alt="">
                                    </a>
                                </div>
                            </div>
                            <!-- Header Logo Area End Here -->
                            <!-- Begin Header Middle Right Area -->
                            <div class="col-lg-9 pl-0 ml-sm-15 ml-xs-15">
                                <!-- Begin Header Middle Searchbox Area -->
                                <form action="#" class="hm-searchbox">
                                    <input type="text" placeholder="Tìm kiếm ...">
                                    <button class="li-btn" type="submit"><i class="fa fa-search"></i></button>
                                </form>
                                <!-- Header Middle Searchbox Area End Here -->
                                <!-- Begin Header Middle Right Area -->
                                <div class="header-middle-right">
                                    <ul class="hm-menu">
                                        <!-- Begin Header Middle Wishlist Area -->
                                        <li class="hm-wishlist">
                                            <a href="#" class="ht-setting-trigger">
                                                <i class="fa fa-user"></i>
                                            </a>
                                            <div class="setting ht-setting">
                                            <c:if test="${pageContext.request.userPrincipal.name != null }">
                                                    <div class="mb-5" style="text-align: center; color:#a5a5a5;"><i class="fa fa-user" ></i> Xin chào <span style="font-weight: bold;">${pageContext.request.userPrincipal.name}</span> </div>
                                                   </c:if>
                                            
                                                <ul class="ht-setting-list">
                                                	
                                                    <li><a href="/admin/home">Thông tin tài khoản</a></li>
                                                    
                                                    <c:if test="${pageContext.request.userPrincipal.name == null }">
                                                    <li><a href="/login">Đăng nhập</a></li>
                                                    <li><a href="/register">Đăng ký</a></li>
                                                    </c:if>
                                                    
                                                    <li><a href="checkout.html">Đơn hàng của tôi</a></li>
                                                    <li>
                                                    <form  id="logout" action="<c:url value="/j_spring_security_logout" />" method="post" >
   														
   														<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
   														 </form>
   														<a  href="javascript:$('#logout').submit();" >Đăng xuất</a>
													
                                                    	
                                                    </li>
                                                </ul>
                                            </div>
                                        </li>
                                        <!-- Header Middle Wishlist Area End Here -->
                                        <!-- Begin Header Mini Cart Area -->
                                        <li class="hm-minicart">
                                            <div class="hm-minicart-trigger">
                                                <span class="item-icon"></span>
                                                
                                                <span class="item-text" id="show-total-quantity">
                                                    
                                                </span>
                                            </div>
                                            <span></span>
                                            <div class="minicart" id="mini-cart">
                                                <ul class="minicart-product-list" id="minicart-product-list">
                                                	<c:forEach items ="${carts }" var ="cart">
	                                                	 <li>
	                                                        <a href="single-product-normal.html" class="minicart-product-image">
	                                                            <img src="<c:url value="${cart.value.product.mainImage}"/>" alt="cart products">
	                                                        </a>
	                                                        <div class="minicart-product-details">
	                                                            <h6><a href="single-product-normal.html">${cart.value.product.productName}</a></h6>
	                                                            <span><fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${cart.value.product.price}" />đ x ${cart.value.quantity}</span>
	                                                        </div>
	                                                        <button class="close" onclick="deleteCart(${cart.value.product.id})">
	                                                            <i class="fa fa-close"></i>
	                                                        </button>
	                                                    </li>
                                                	</c:forEach>
                                                  
                                                </ul>
                                                <p class="minicart-total" id="totalPrice"> Tổng tiền: <span><fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${totalPrice}" /></span></p>
                                                <div class="minicart-button">
                                                    <a href="<c:url value="/cart"/>" class="li-button li-button-dark li-button-fullwidth li-button-sm">
                                                        <span>Xem giỏ hàng</span>
                                                    </a>
                                                    <a href="checkout.html" class="li-button li-button-fullwidth li-button-sm">
                                                        <span>Thanh toán</span>
                                                    </a>
                                                </div>
                                            </div>
                                        </li>
                                        <!-- Header Mini Cart Area End Here -->
                                    </ul>
                                </div>
                                <!-- Header Middle Right Area End Here -->
                            </div>
                            <!-- Header Middle Right Area End Here -->
                        </div>
                    </div>
                </div>
                <!-- Header Middle Area End Here -->
                <!-- Begin Header Bottom Area -->
                <div class="header-bottom header-sticky d-none d-lg-block">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12">
                                <!-- Begin Header Bottom Menu Area -->
                                <div class="hb-menu hb-menu-2 d-xl-block">
                                    <nav>
                                        <ul>
                                            <li><a href="<c:url value="/"/>">Trang chủ</a></li>
                                            <li class="megamenu-holder"><a href="shop-left-sidebar.html">Sản phẩm</a>
                                                <ul class="megamenu hb-megamenu">
                                                    <li><a href="<c:url value ="/product/"/>">Điện thoại</a>
                                                        <ul>
                                                        	<c:forEach items="${categorys }" var="category">
                                                        	<li><a href="/product/${category.value.categoryName }">${category.value.categoryName }</a></li>
                                                        	</c:forEach>
                                                            
                                                        </ul>
                                                    </li>
                                                    <li><a href="single-product-gallery-left.html">Mức giá</a>
                                                        <ul>
                                                            <li><a href="single-product-carousel.html">Dưới 2 triệu</a></li>
                                                            <li><a href="single-product-gallery-left.html">Từ 2 - 4 triệu</a></li>
                                                           <li><a href="single-product-gallery-left.html">Từ 4 - 6 triệu</a></li>
                                                            <li><a href="single-product-gallery-left.html">Từ 6 - 8 triệu</a></li>
                                                            <li><a href="single-product-gallery-left.html">Từ 8 - 10 triệu</a></li>
                                                            <li><a href="single-product-gallery-left.html">Từ 11 - 12 triệu</a></li>
                                                        </ul>
                                                    </li>
                                                    
                                                </ul>
                                            </li>
                                            
                                            <li><a href="contact.html">Liên hệ</a></li>
                                            <li><a href="about-us.html">Về chúng tôi</a></li>
                                        </ul>
                                    </nav>
                                </div>
                                <!-- Header Bottom Menu Area End Here -->
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Header Bottom Area End Here -->
                <!-- Begin Mobile Menu Area -->
                <div class="mobile-menu-area d-lg-none d-xl-none col-12">
                    <div class="container"> 
                        <div class="row">
                            <div class="mobile-menu">
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Mobile Menu Area End Here -->
            </header>
            <!-- Header Area End Here -->
    