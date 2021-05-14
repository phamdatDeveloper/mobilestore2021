<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/taglib.jsp" %>
<!doctype html>
<html class="no-js" lang="zxx">
    
<!-- index-231:32-->
<head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Trang chủ</title>
</head>
    <body>
    <!--[if lt IE 8]>
		<p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
	<![endif]-->
        <!-- Begin Body Wrapper -->


            <!-- Begin Slider With Category Menu Area -->
            <div class="slider-with-banner">
                <div class="container">
                    <div class="row">
                        
                        <!-- Begin Slider Area -->
                        <div class="col-sm-9">
                            <div id="demo" class="carousel slide" data-ride="carousel">

                                <!-- Indicators -->
                                <ul class="carousel-indicators">
                                  <li data-target="#demo" data-slide-to="0" class="active"></li>
                                  <li data-target="#demo" data-slide-to="1"></li>
                                  <li data-target="#demo" data-slide-to="2"></li>
                                </ul>
                                
                                <!-- The slideshow -->
                                <div class="carousel-inner">
                                  <div class="carousel-item active">
                                    <img src=" <c:url value="/template/user/images/slider/slideiphone.png" /> " alt="Los Angeles" width="870" height="500">
                                  </div>
                                  
                                  <div class="carousel-item">
                                    <img src="<c:url value="/template/user/images/slider/slideiphone1.png" />" alt="Chicago" width="870" height="500">
                                  </div>
                                  <div class="carousel-item">
                                    <img src="<c:url value="/template/user/images/slider/slideiphone2.jpg" />" alt="New York" width="870" height="500">
                                  </div>
                                </div>
                                
                                <!-- Left and right controls -->
                                <a class="carousel-control-prev" href="#demo" data-slide="prev">
                                  <span class="carousel-control-prev-icon"></span>
                                </a>
                                <a class="carousel-control-next" href="#demo" data-slide="next">
                                  <span class="carousel-control-next-icon"></span>
                                </a>
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class="single-banner mb-10 ">
                                <a href="#">
                                    <img src="<c:url value="/template/user/images/banner/banner-iphone.png" />" alt="Li's Static Banner" width="270" height="160">
                                </a>
                            </div>
                            <div class="single-banner   mb-10 overflow-auto">
                                <a href="#">
                                    <img src="<c:url value="/template/user/images/banner/1_3.jpg" />" alt="Li's Static Banner" width="270" height="160">
                                </a>
                            </div>
                            <div class="single-banner   mb-10 overflow-auto">
                                <a href="#">
                                    <img src="<c:url value="/template/user/images/banner/1_4.jpg" />" alt="Li's Static Banner" width="270" height="160">
                                </a>
                            </div>
                        </div>
                       
                    </div>
                </div>
            </div>
            <!-- Slider With Category Menu Area End Here -->
 			<section class="product-area li-laptop-product li-laptop-product-2 pb-45">
                <div class="container">
                    <div class="row">
                        <!-- Begin Li's Section Area -->
                        <div class="col-lg-12 mt-50">
                            <div class="li-section-title">
                                <h2>
                                    <span>Sản phẩm khuyến mãi</span>
                                </h2>
                                <ul class="li-sub-category-list">
                                    
                                    <li><a href="shop-left-sidebar.html">Xem tất cả</a></li>
                                </ul>
                            </div>
                           
                           
                            <div class="row">
                                <div class="product-active owl-carousel">
                                <c:forEach items="${products}" var="product">
                                    <div class="col-lg-12">
                                        <!-- single-product-wrap start -->
                                        <div class="single-product-wrap">
                                            <div class="product-image">
                                                <a href="single-product-normal.html">
                                                    <img src="<c:url value ="${product.mainImage}"/>" alt="Li's Product Image">
                                                </a>
                                                <c:if test="${product.isSale == true}">
                                                	<span class="sticker">Sale</span>
                                                </c:if>
                                            </div>
                                            <div class="product_desc">
                                                <div class="product_desc_info">
                                                    <div class="product-review">
                                                        <h5 class="manufacturer">
                                                            
                                                        </h5>
                                                        
                                                    </div>
                                                    <h4><a class="product_name" href="single-product-normal.html">${product.productName}</a></h4>
                                                    <div class="price-box">
                                                    	<c:choose>
															<c:when test="${product.isSale == true}">
																<span class="new-price new-price-2"><fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${product.priceSale}" /> đ</span>
                    											<span class="old-price" style="text-decoration: line-through;"><fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${product.price}" /> đ</span>
											   					<span class="discount-percentage"><fmt:formatNumber type = "number" maxFractionDigits = "0" value = "${100-(product.priceSale/product.price)*100}" />%</span>
											   				</c:when> 
											   				<c:otherwise>
											   					<span class="new-price new-price-2"><fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${product.price}" /> đ</span>
											   				</c:otherwise>   
														</c:choose>
          
                                                    
                                                        
                                                    </div>
                                                    
                                                </div>
                                                <div class="add-actions">
                                                    <ul class="add-actions-link">
                                                        <li class="add-cart active" style="cursor: pointer" onclick="addCart(${product.id})">Thêm</li>
                                                        
                                                        <li><a href="#" title="quick view" class="quick-view-btn" data-toggle="modal" data-target="#exampleModalCenter"><i class="fa fa-eye"></i></a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- single-product-wrap end -->
                                    </div>
                                 </c:forEach>
                                  
                                    
                              
                                </div>
                            </div>
                        </div>
                        <!-- Li's Section Area End Here -->
                    </div>
                </div>
            </section>

            
            
            <c:forEach items ="${categorys }" var="category">
            <section class="product-area li-laptop-product li-laptop-product-2 pb-45">
                <div class="container">
                    <div class="row">
                        <!-- Begin Li's Section Area -->
                        <div class="col-lg-12">
                            <div class="li-section-title">
                                <h2>
                                    <span>${category.categoryName}</span>
                                </h2>
                                <ul class="li-sub-category-list">
                                    
                                    <li><a href="shop-left-sidebar.html">Xem tất cả</a></li>
                                </ul>
                            </div>
                           
                           
                            <div class="row">
                                <div class="product-active owl-carousel">
                                <c:forEach items="${products}" var="product">
                                    <div class="col-lg-12">
                                        <!-- single-product-wrap start -->
                                        <div class="single-product-wrap">
                                            <div class="product-image">
                                                <a href="single-product-normal.html">
                                                    <img src="<c:url value ="${product.mainImage}"/>" alt="Li's Product Image">
                                                </a>
                                                <span class="sticker">New</span>
                                            </div>
                                            <div class="product_desc">
                                                <div class="product_desc_info">
                                                    <div class="product-review">
                                                     
                                                    </div>
                                                    <h4><a class="product_name" href="single-product-normal.html">${product.productName}</a></h4>
                                                    <div class="price-box">
                                                        <span class="new-price" style="color:red;"><fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${product.price}" />đ</span>
                                                    </div>
                                                </div>
                                                <div class="add-actions">
                                                    <ul class="add-actions-link">
                                                         <li class="add-cart active" style="cursor: pointer" onclick="addCart(${product.id})">Thêm</li>
                                                        
                                                        <li><a href="#" title="quick view" class="quick-view-btn" data-toggle="modal" data-target="#exampleModalCenter"><i class="fa fa-eye"></i></a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- single-product-wrap end -->
                                    </div>
                                 </c:forEach>
                                </div>
                            </div>
                        </div>
                        <!-- Li's Section Area End Here -->
                    </div>
                </div>
            </section>
            </c:forEach>
            <!-- Li's Laptops Product | Home V2 Area End Here -->
           
          
           
            <!-- Begin Quick View | Modal Area -->
            <div class="modal fade modal-wrapper" id="exampleModalCenter" >
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-body">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                            <div class="modal-inner-area row">
                                <div class="col-lg-5 col-md-6 col-sm-6">
                                   <!-- Product Details Left -->
                                    <div class="product-details-left">
                                        <div class="product-details-images slider-navigation-1">
                                            <div class="lg-image">
                                                <img src="images/product/large-size/1.jpg" alt="product image">
                                            </div>
                                            <div class="lg-image">
                                                <img src="images/product/large-size/2.jpg" alt="product image">
                                            </div>
                                            <div class="lg-image">
                                                <img src="images/product/large-size/3.jpg" alt="product image">
                                            </div>
                                            <div class="lg-image">
                                                <img src="images/product/large-size/4.jpg" alt="product image">
                                            </div>
                                            <div class="lg-image">
                                                <img src="images/product/large-size/5.jpg" alt="product image">
                                            </div>
                                            <div class="lg-image">
                                                <img src="images/product/large-size/6.jpg" alt="product image">
                                            </div>
                                        </div>
                                        <div class="product-details-thumbs slider-thumbs-1">                                        
                                            <div class="sm-image"><img src="images/product/small-size/1.jpg" alt="product image thumb"></div>
                                            <div class="sm-image"><img src="images/product/small-size/2.jpg" alt="product image thumb"></div>
                                            <div class="sm-image"><img src="images/product/small-size/3.jpg" alt="product image thumb"></div>
                                            <div class="sm-image"><img src="images/product/small-size/4.jpg" alt="product image thumb"></div>
                                            <div class="sm-image"><img src="images/product/small-size/5.jpg" alt="product image thumb"></div>
                                            <div class="sm-image"><img src="images/product/small-size/6.jpg" alt="product image thumb"></div>
                                        </div>
                                    </div>
                                    <!--// Product Details Left -->
                                </div>

                                <div class="col-lg-7 col-md-6 col-sm-6">
                                    <div class="product-details-view-content pt-60">
                                        <div class="product-info">
                                            <h2>Today is a good day Framed poster</h2>
                                            <div class="price-box pt-20">
                                                <span class="new-price new-price-2">$57.98</span>
                                            </div>
                                            <div class="product-desc">
                                                <p>
                                                    <span>100% cotton double printed dress. Black and white striped top and orange high waisted skater skirt bottom. Lorem ipsum dolor sit amet, consectetur adipisicing elit. quibusdam corporis, earum facilis et nostrum dolorum accusamus similique eveniet quia pariatur.
                                                    </span>
                                                </p>
                                            </div>
                                            <div class="single-add-to-cart">
                                                <form action="#" class="cart-quantity">
                                                    <div class="quantity">
                                                        <label>Quantity</label>
                                                        <div class="cart-plus-minus">
                                                            <input class="cart-plus-minus-box" value="1" type="text">
                                                            <div class="dec qtybutton"><i class="fa fa-angle-down"></i></div>
                                                            <div class="inc qtybutton"><i class="fa fa-angle-up"></i></div>
                                                        </div>
                                                    </div>
                                                    <button class="add-to-cart" type="submit">ThÃªm giá» hÃ ng</button>
                                                </form>
                                            </div>
                                            <div class="product-additional-info pt-25">
                                                <div class="product-social-sharing pt-25">
                                                    <ul>
                                                        <li class="facebook"><a href="#"><i class="fa fa-facebook"></i>Facebook</a></li>
                                                        <li class="twitter"><a href="#"><i class="fa fa-twitter"></i>Twitter</a></li>
                                                        <li class="google-plus"><a href="#"><i class="fa fa-google-plus"></i>Google +</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>   
            <!-- Quick View | Modal Area End Here -->


    </body>

<!-- index-231:38-->
</html>
