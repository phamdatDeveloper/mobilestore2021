<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/taglib.jsp" %>

<!doctype html>
<html class="no-js" lang="zxx">
    
<!-- shop-left-sidebar31:47-->
<head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Sản phẩm</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">

    </head>
    <body>
   
            <!-- Begin Li's Breadcrumb Area -->
            <div class="breadcrumb-area">
                <div class="container">
                    <div class="breadcrumb-content">
                        <ul>
                            <li><a href="index.html">Trang chủ</a></li>
                            <li class="active">Sản phẩm</li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- Li's Breadcrumb Area End Here -->
            <!-- Begin Li's Content Wraper Area -->
            <div class="content-wraper pt-60 pb-60 pt-sm-30">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-9 order-1 order-lg-2">
                            <!-- Begin Li's Banner Area -->
                            <div class="single-banner shop-page-banner">
                                <a href="#">
                                    <img src="<c:url value="template/user/images/bg-banner/2.jpg"/>" alt="Li's Static Banner">
                                </a>
                            </div>
                            <!-- Li's Banner Area End Here -->
                            <!-- shop-top-bar start -->
                            <div class="shop-top-bar mt-30">
                                <div class="shop-bar-inner">

                                    <div class="toolbar-amount">
                                        <span>Hiển thị 1 đến 9 tổng 15</span>
                                    </div>
                                </div>
                                <!-- product-select-box start -->
                                <div class="product-select-box">
                                    <div class="product-short">
                                        <p>Sắp xếp theo:</p>
                                        <select class="nice-select">
                                            <option value="trending">Có liên quan</option>
                                            <option value="sales">Theo tên (A - Z)</option>
                                            <option value="sales">Theo tên (Z - A)</option>
                                            <option value="rating">Theo giá (Thấp &gt; Cao)</option>
                                            <option value="price-asc">Loại sản phẩm (A - Z)</option>
                                            <option value="price-asc">Loại sản phẩm (Z - A)</option>
                                        </select>
                                    </div>
                                </div>
                                <!-- product-select-box end -->
                            </div>
                            <!-- shop-top-bar end -->
                            <!-- shop-products-wrapper start -->
                            <div class="shop-products-wrapper">
                                <div class="tab-content">
                                    <div id="grid-view" class="tab-pane fade active show" role="tabpanel">
                                        <div class="product-area shop-product-area">
                                            <div class="row">
                                            
                                            <c:forEach items ="${products }" var ="product">
                                            	 <div class="col-lg-4 col-md-4 col-sm-6 mt-40">
                                                    <!-- single-product-wrap start -->
                                                    <div class="single-product-wrap">
                                                        <div class="product-image">
                                                            <a href="single-product-normal.html">
                                                                <img src="<c:url value="${product.mainImage}"/>" alt="Li's Product Image">
                                                            </a>
                                                            <span class="sticker">New</span>
                                                        </div>
                                                        <div class="product_desc">
                                                            <div class="product_desc_info">
                                                                <div class="product-review">
                                                                    <h5 class="manufacturer">
                                                                        <a href="#">Graphic Corner</a>
                                                                    </h5>
                                                                    
                                                                </div>
                                                                <h4><a class="product_name" href="single-product-normal.html">${product.productName }</a></h4>
                                                                <div class="price-box">
                                                                    <span class="new-price"><fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${product.price}" /></span>
                                                                </div>
                                                            </div>
                                                            <div class="add-actions">
                                                                <ul class="add-actions-link">
                                                                 <li class="add-cart active" style="cursor: pointer" onclick="addCart(${product.id})">Thêm</li>
                                                                  
                                                                    <li><a href="#" title="Xem nhanh" class="quick-view-btn" data-toggle="modal" data-target="#exampleModalCenter${product.id}"><i class="fa fa-eye"></i></a></li>
                                                                    
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
                                  <div class="paginatoin-area">
                                        <div class="row">
                                            <div class="col-lg-8 col-md-6">
                                                <ul class="pagination-box pt-xs-20 pb-xs-15">
                                                    <li><a href="#" class="Previous"><i class="fa fa-chevron-left"></i> Quay láº¡i</a>
                                                    </li>
                                                    <li class="active"><a href="#">1</a></li>
                                                    <li><a href="#">2</a></li>
                                                    <li><a href="#">3</a></li>
                                                    <li>
                                                      <a href="#" class="Next"> Tiáº¿p theo <i class="fa fa-chevron-right"></i></a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- shop-products-wrapper end -->
                        </div>
                        <div class="col-lg-3 order-2 order-lg-1">
                             <!--sidebar-categores-box start  -->
                            <div class="sidebar-categores-box">
                                <div class="sidebar-title">
                                    <h2>Lọc theo</h2>
                                </div>
                                <!-- btn-clear-all start -->
                               
                                <!-- btn-clear-all end -->
                                <!-- filter-sub-area start -->
                                <div class="filter-sub-area">
                                    <h5 class="filter-sub-titel">Brand</h5>
                                    <div class="categori-checkbox">
                                        <form action="#">
                                            <ul>
                                                <li><input type="checkbox" name="product-categori"><a href="#">Samsung (13)</a></li>
                                                <li><input type="checkbox" name="product-categori"><a href="#">Apple (12)</a></li>
                                                <li><input type="checkbox" name="product-categori"><a href="#">Khác (11)</a></li>
                                            </ul>
                                        </form>
                                    </div>
                                 </div>
                                <!-- filter-sub-area end -->
                                <!-- filter-sub-area start -->
                                <div class="filter-sub-area pt-sm-10 pt-xs-10">
                                    <h5 class="filter-sub-titel">Dung lượng bộ nhớ</h5>
                                    <div class="size-checkbox">
                                        <form action="#">
                                            <ul>
                                                <li><input type="checkbox" name="product-size"><a href="#">32GB</a></li>
                                                <li><input type="checkbox" name="product-size"><a href="#">64GB</a></li>
                                                <li><input type="checkbox" name="product-size"><a href="#">256GB</a></li>
                                                <li><input type="checkbox" name="product-size"><a href="#">512GB</a></li>
                                            </ul>
                                        </form>
                                    </div>
                                </div>
                                <!-- filter-sub-area end -->
                                <!-- filter-sub-area start -->
                                <div class="filter-sub-area pt-sm-10 pt-xs-10">
                                    <h5 class="filter-sub-titel">Màu sắc</h5>
                                    <div class="color-categoriy">
                                        <form action="#">
                                            <ul>
                                                <li><span class="white"></span><a href="#">Trắng (1)</a></li>
                                                <li><span class="black"></span><a href="#">Đen (1)</a></li>
                                                <li><span class="Orange"></span><a href="#">Đỏ (3) </a></li>
                                                <li><span class="Blue"></span><a href="#">Xanh  (2) </a></li>
                                            </ul>
                                        </form>
                                    </div>
                                </div>
                                <!-- filter-sub-area end -->
                            </div>
                            <!--sidebar-categores-box end  -->
                           
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Content Wraper Area End Here -->
            <!-- Begin Footer Area -->
            <div class="footer">
                <!-- Begin Footer Static Top Area -->
                <div class="footer-static-top">
                    <div class="container">
                        <!-- Begin Footer Shipping Area -->
                        <div class="footer-shipping pt-60 pb-55 pb-xs-25">
                            <div class="row">
                                <!-- Begin Li's Shipping Inner Box Area -->
                                <div class="col-lg-3 col-md-6 col-sm-6 pb-sm-55 pb-xs-55">
                                    <div class="li-shipping-inner-box">
                                        <div class="shipping-icon">
                                            <img src="images/shipping-icon/1.png" alt="Shipping Icon">
                                        </div>
                                        <div class="shipping-text">
                                            <h2>Free Ship</h2>
                                            <p>VÃ  free Äá»i tráº£. Miá»n phÃ­ hai chiá»u.</p>
                                        </div>
                                    </div>
                                </div>
                                <!-- Li's Shipping Inner Box Area End Here -->
                                <!-- Begin Li's Shipping Inner Box Area -->
                                <div class="col-lg-3 col-md-6 col-sm-6 pb-sm-55 pb-xs-55">
                                    <div class="li-shipping-inner-box">
                                        <div class="shipping-icon">
                                            <img src="images/shipping-icon/2.png" alt="Shipping Icon">
                                        </div>
                                        <div class="shipping-text">
                                            <h2>Safe Payment</h2>
                                            <p>Thanh toÃ¡n an toÃ n tiá»n lá»£i vá»i cÃ¡c há» thá»ng lá»n.</p>
                                        </div>
                                    </div>
                                </div>
                                <!-- Li's Shipping Inner Box Area End Here -->
                                <!-- Begin Li's Shipping Inner Box Area -->
                                <div class="col-lg-3 col-md-6 col-sm-6 pb-xs-30">
                                    <div class="li-shipping-inner-box">
                                        <div class="shipping-icon">
                                            <img src="images/shipping-icon/3.png" alt="Shipping Icon">
                                        </div>
                                        <div class="shipping-text">
                                            <h2>Guaranteed</h2>
                                            <p>ChÃºng tÃ´i Äáº£m báº£o tá»« viá»c báº¡n mua hÃ ng cho Äáº¿n khi báº¡n nháº­n ÄÆ°á»£c hÃ ng.</p>
                                        </div>
                                    </div>
                                </div>
                                <!-- Li's Shipping Inner Box Area End Here -->
                                <!-- Begin Li's Shipping Inner Box Area -->
                                <div class="col-lg-3 col-md-6 col-sm-6 pb-xs-30">
                                    <div class="li-shipping-inner-box">
                                        <div class="shipping-icon">
                                            <img src="images/shipping-icon/4.png" alt="Shipping Icon">
                                        </div>
                                        <div class="shipping-text">
                                            <h2>24/7 Help Center</h2>
                                            <p>CÃ³ tháº¯c máº¯c? ChÃºng tÃ´i luÃ´n sáºµn sÃ ng há» trá»£ giÃºp Äá»¡ báº¡n.</p>
                                        </div>
                                    </div>
                                </div>
                                <!-- Li's Shipping Inner Box Area End Here -->
                            </div>
                        </div>
                        <!-- Footer Shipping Area End Here -->
                    </div>
                </div>
                <!-- Footer Static Top Area End Here -->

            <!-- Begin Xem nhanh | Modal Area -->
            <c:forEach items="${products }" var ="product">
                        <div class="modal fade modal-wrapper" id="exampleModalCenter${product.id}" >
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-body">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                            <div class="modal-inner-area row">
                                <div class="col-lg-7 col-md-6 col-sm-6">
                                   <!-- Product Details Left -->
                                    <div class="product-details-left">
                                        <div class="product-details-images slider-navigation-1">
                                        <c:forEach items ="${product.secondaryImage }" var ="image">
                                        	 <div class="lg-image">
                                                <img src="<c:url value="${image }"/>" alt="product image">
                                            </div>
                                        </c:forEach>
                                           
                                           
                                        </div>
                                        <div class="product-details-thumbs slider-thumbs-1">     
                                        <c:forEach items ="${product.secondaryImage }" var ="image">
                                        	
                                            <div class="sm-image"><img src="<c:url value="${image }"/>"  alt="product image thumb"></div>
                                        </c:forEach>                                   
                                           
                                        </div>
                                    </div>
                                    <!--// Product Details Left -->
                                </div>

                                <div class="col-lg-5 col-md-6 col-sm-6">
                                    <div class="product-details-view-content pt-60">
                                        <div class="product-info">
                                            <h2>${product.productName } <span><c:if test="${product.isSale == true}">(Khuyến mãi)</c:if></span></h2>
                                            
                                            <div class="rating-box pt-20">
                                                <ul class="rating rating-with-review-item">
                                                    <li><i class="fa fa-star-o"></i></li>
                                                    <li><i class="fa fa-star-o"></i></li>
                                                    <li><i class="fa fa-star-o"></i></li>
                                                    <li class="no-star"><i class="fa fa-star-o"></i></li>
                                                    <li class="no-star"><i class="fa fa-star-o"></i></li>
                                                   
                                                </ul>
                                            </div>
                                            <div class="price-box pt-20">
                                            <c:choose>
											   <c:when test="${product.isSale == true}">
											   	<span class="new-price new-price-2"><fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${product.priceSale}" /></span>
                                            	<span class="old-price" style="text-decoration: line-through;"><fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${product.price}" /></span>
											   </c:when> 
											   <c:otherwise>
											   <span class="new-price new-price-2"><fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${product.price}" /></span>
											   </c:otherwise>   
											</c:choose>
                                            	
                                               
                                            </div>
                                             <div class="single-add-to-cart">
                                                <form action="#" class="cart-quantity">
                                                   
                                                    <button class="add-to-cart" id="btn-cart-quickview" type="button" onclick="addCart(${product.id})">Thêm vào giỏ hàng</button>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                            	
                            	<div class ="product-details-view-content col-sm-12 pt-40">
                            		 <div class="product-desc">
                                          <p>
                                            <span> ${product.description}</span>
                                          </p>
                                      </div>
                            	</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div> 
            </c:forEach>
  
            <!-- Xem nhanh | Modal Area End Here -->

    </body>

</html>
