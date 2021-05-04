<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><decorator:title default="Home" /></title>

 <!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="<c:url value ="/template/user/images/favicon.png"/>">
        <!-- Material Design Iconic Font-V2.2.0 -->
        <link rel="stylesheet" href="<c:url value ="/template/user/css/material-design-iconic-font.min.css"/>  ">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="<c:url value ="/template/user/css/font-awesome.min.css"/> ">
        <!-- Font Awesome Stars-->
        <link rel="stylesheet" href="<c:url value ="/template/user/css/fontawesome-stars.css"/> ">
        <!-- Meanmenu CSS -->
        <link rel="stylesheet" href="<c:url value ="/template/user/css/meanmenu.css"/> ">
        <!-- owl carousel CSS -->
        <link rel="stylesheet" href="<c:url value ="/template/user/css/owl.carousel.min.css"/> ">
        <!-- Slick Carousel CSS -->
        <link rel="stylesheet" href="<c:url value ="/template/user/css/slick.css"/> ">
        <!-- Animate CSS -->
        <link rel="stylesheet" href="<c:url value ="/template/user/css/animate.css"/> ">
        <!-- Jquery-ui CSS -->
        <link rel="stylesheet" href="<c:url value ="/template/user/css/jquery-ui.min.css"/> ">
        <!-- Venobox CSS -->
        <link rel="stylesheet" href="<c:url value ="/template/user/css/venobox.css"/> ">
        <!-- Nice Select CSS -->
        <link rel="stylesheet" href="<c:url value ="/template/user/css/nice-select.css"/> ">
        <!-- Magnific Popup CSS -->
        <link rel="stylesheet" href="<c:url value ="/template/user/css/magnific-popup.css"/> ">
        <!-- Bootstrap V4.1.3 Fremwork CSS -->
        <link rel="stylesheet" href="<c:url value ="/template/user/css/bootstrap.min.css"/> ">
        <!-- Helper CSS -->
        <link rel="stylesheet" href="<c:url value ="/template/user/css/helper.css"/> ">
        <!-- Main Style CSS -->
        <link rel="stylesheet" href="<c:url value ="/template/user/style.css"/> ">
        <!-- Responsive CSS -->
        <link rel="stylesheet" href="<c:url value ="/template/user/css/responsive.css"/> ">
        <!-- Modernizr js -->
        <script src="<c:url value ="/template/user/js/vendor/modernizr-2.8.3.min.js"/>"></script>
        <!-- Sweet alert -->
        <link rel="stylesheet" href="<c:url value ="/template/user/css/sweetalert2.min.css"/>">
        <script src="<c:url value ="/template/user/js/sweetalert2.min.js"/>"></script>
        
        <script src="<c:url value ="/template/user/js/jquery.min.js"/>"></script>

</head>
<body>

	<div class="body-wrapper" id="body-wrapper">
		<!-- Header -->
		<%@include file="/WEB-INF/views/layout/user/header.jsp"%>
		<!-- Body -->
		<decorator:body />
		<!-- Footer Start -->
		<%@include file="/WEB-INF/views/layout/user/footer.jsp"%>
		<!-- end Footer -->

	</div>

        <!-- Popper js -->
        <script src="<c:url value ="/template/user/js/vendor/popper.min.js"/>"></script>
        <!-- Bootstrap V4.1.3 Fremwork js -->
        <script src="<c:url value ="/template/user/js/bootstrap.min.js"/>"></script>
        <!-- Ajax Mail js -->
        <script src="<c:url value ="/template/user/js/ajax-mail.js"/>"></script>
        <!-- Meanmenu js -->
        <script src="<c:url value ="/template/user/js/jquery.meanmenu.min.js"/>"></script>
        <!-- Wow.min js -->
        <script src="<c:url value ="/template/user/js/wow.min.js"/>"></script>
        <!-- Slick Carousel js -->
        <script src="<c:url value ="/template/user/js/slick.min.js"/>"></script>
        <!-- Owl Carousel-2 js -->
        <script src="<c:url value ="/template/user/js/owl.carousel.min.js"/>"></script>
        <!-- Magnific popup js -->
        <script src="<c:url value ="/template/user/js/jquery.magnific-popup.min.js"/>"></script>
        <!-- Isotope js -->
        <script src="<c:url value ="/template/user/js/isotope.pkgd.min.js"/>"></script>
        <!-- Imagesloaded js -->
        <script src="<c:url value ="/template/user/js/imagesloaded.pkgd.min.js"/>"></script>
        <!-- Mixitup js -->
        <script src="<c:url value ="/template/user/js/jquery.mixitup.min.js"/>"></script>
        <!-- Countdown -->
        <script src="<c:url value ="/template/user/js/jquery.countdown.min.js"/>"></script>
        <!-- Counterup -->
        <script src="<c:url value ="/template/user/js/jquery.counterup.min.js"/>"></script>
        <!-- Waypoints -->
        <script src="<c:url value ="/template/user/js/waypoints.min.js"/>"></script>
        <!-- Barrating -->
        <script src="<c:url value ="/template/user/js/jquery.barrating.min.js"/>"></script>
        <!-- Jquery-ui -->
        <script src="<c:url value ="/template/user/js/jquery-ui.min.js"/>"></script>
        <!-- Venobox -->
        <script src="<c:url value ="/template/user/js/venobox.min.js"/>"></script>
        <!-- Nice Select js -->
        <script src="<c:url value ="/template/user/js/jquery.nice-select.min.js"/>"></script>
        <!-- ScrollUp js -->
        <script src="<c:url value ="/template/user/js/scrollUp.min.js"/>"></script>
        <!-- Main/Activator js -->
        <script src="<c:url value ="/template/user/js/main.js"/>"></script>
        
        <script src="<c:url value ="/template/user/js/custom.js"/>"></script>

</body>
</html>