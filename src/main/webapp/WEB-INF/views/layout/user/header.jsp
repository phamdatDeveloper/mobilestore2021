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
                                                <ul class="ht-setting-list">
                                                    <li><a href="login-register.html">Thông tin tài khoản</a></li>
                                                    <li><a href="login-register - register.html">Đăng ký</a></li>
                                                    <li><a href="login-register.html">Đăng nhập</a></li>
                                                    <li><a href="checkout.html">Đơn hàng của tôi</a></li>
                                                </ul>
                                            </div>
                                        </li>
                                        <!-- Header Middle Wishlist Area End Here -->
                                        <!-- Begin Header Mini Cart Area -->
                                        <li class="hm-minicart">
                                            <div class="hm-minicart-trigger">
                                                <span class="item-icon"></span>
                                                
                                                <span class="item-text">
                                                    ${totalQuantity}
                                                </span>
                                            </div>
                                            <span></span>
                                            <div class="minicart" id="mini-cart">
                                                <ul class="minicart-product-list">
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
                                                <p class="minicart-total">Tổng tiền: <span><fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${totalPrice}" /></span></p>
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
                                                    <li><a href="<c:url value ="/product"/>">Điện thoại</a>
                                                        <ul>
                                                        	<c:forEach items="${categorys }" var="category">
                                                        	<li><a href="shop-3-column.html">${category.categoryName }</a></li>
                                                        	</c:forEach>
                                                            
                                                        </ul>
                                                    </li>
                                                    <li><a href="single-product-gallery-left.html">Single Product Style</a>
                                                        <ul>
                                                            <li><a href="single-product-carousel.html">Single Product Carousel</a></li>
                                                            <li><a href="single-product-gallery-left.html">Single Product Gallery Left</a></li>
                                                            <li><a href="single-product-gallery-right.html">Single Product Gallery Right</a></li>
                                                            <li><a href="single-product-tab-style-top.html">Single Product Tab Style Top</a></li>
                                                            <li><a href="single-product-tab-style-left.html">Single Product Tab Style Left</a></li>
                                                            <li><a href="single-product-tab-style-right.html">Single Product Tab Style Right</a></li>
                                                        </ul>
                                                    </li>
                                                    
                                                </ul>
                                            </li>
                                            <li class="megamenu-static-holder"><a href="index.html">Pages</a>
                                                <ul class="megamenu hb-megamenu">
                                                    <li><a href="blog-left-sidebar.html">Blog Layouts</a>
                                                        <ul>
                                                            <li><a href="blog-2-column.html">Blog 2 Column</a></li>
                                                            <li><a href="blog-3-column.html">Blog 3 Column</a></li>
                                                            <li><a href="blog-left-sidebar.html">Grid Left Sidebar</a></li>
                                                            <li><a href="blog-right-sidebar.html">Grid Right Sidebar</a></li>
                                                            <li><a href="blog-list.html">Blog List</a></li>
                                                            <li><a href="blog-list-left-sidebar.html">List Left Sidebar</a></li>
                                                            <li><a href="blog-list-right-sidebar.html">List Right Sidebar</a></li>
                                                        </ul>
                                                    </li>
                                                    <li><a href="blog-details-left-sidebar.html">Blog Details Pages</a>
                                                        <ul>
                                                            <li><a href="blog-details-left-sidebar.html">Left Sidebar</a></li>
                                                            <li><a href="blog-details-right-sidebar.html">Right Sidebar</a></li>
                                                            <li><a href="blog-audio-format.html">Blog Audio Format</a></li>
                                                            <li><a href="blog-video-format.html">Blog Video Format</a></li>
                                                            <li><a href="blog-gallery-format.html">Blog Gallery Format</a></li>
                                                        </ul>
                                                    </li>
                                                    <li><a href="index.html">Other Pages</a>
                                                        <ul>
                                                            <li><a href="login-register.html">My Account</a></li>
                                                            <li><a href="checkout.html">Checkout</a></li>
                                                            <li><a href="compare.html">Compare</a></li>
                                                            <li><a href="wishlist.html">Wishlist</a></li>
                                                            <li><a href="shopping-cart.html">Shopping Cart</a></li>
                                                        </ul>
                                                    </li>
                                                    <li><a href="index.html">Other Pages 2</a>
                                                        <ul>
                                                            <li><a href="contact.html">Contact</a></li>
                                                            <li><a href="about-us.html">About Us</a></li>
                                                            <li><a href="faq.html">FAQ</a></li>
                                                            <li><a href="404.html">404 Error</a></li>
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
    