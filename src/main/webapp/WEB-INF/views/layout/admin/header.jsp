<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Topbar Start -->
<div class="navbar-custom">
	<ul class="list-unstyled topnav-menu float-right mb-0">
		<li class="dropdown notification-list"><a
			class="nav-link dropdown-toggle nav-user mr-0 waves-effect"
			data-toggle="dropdown" href="#" role="button" aria-haspopup="false"
			aria-expanded="false"> <img
				src="<c:url value ="/template/admin/assets/images/users/avatar-1.jpg"/>" alt="user-image"
				class="rounded-circle"> <span class="pro-user-name ml-1">
					Phạm Đạt <i class="mdi mdi-chevron-down"></i>
			</span>
		</a>
			<div class="dropdown-menu dropdown-menu-right profile-dropdown ">
				<!-- item-->
				<div class="dropdown-header noti-title">
					<h6 class="text-overflow m-0">Xin chào !</h6>
				</div>



				<!-- item-->
				<a href="javascript:void(0);" class="dropdown-item notify-item">
					<i class="mdi mdi-logout-variant"></i> <span>Đăng xuất</span>
				</a>

			</div></li>

	</ul>

	<!-- LOGO -->
	<div class="logo-box">
		<a href="index.html" class="logo text-center logo-light"> <span
			class="logo-lg"> <img src="<c:url value ="/template/admin/assets/images/logo-light.png"/>" alt=""
				height="20"> <!-- <span class="logo-lg-text-dark">Velonic</span> -->
		</span> <span class="logo-sm"> <!-- <span class="logo-lg-text-dark">V</span> -->
				<img src="<c:url value ="/template/admin/assets/images/logo-sm.png"/>" alt="" height="22">
		</span>
		</a>
	</div>
	<!-- LOGO -->
	<ul class="list-unstyled topnav-menu topnav-menu-left m-0">
		<li>
			<button class="button-menu-mobile waves-effect">
				<i class="mdi mdi-menu"></i>
			</button>
		</li>
	</ul>
</div>
<!-- end Topbar -->
<!-- ========== Left Sidebar Start ========== -->
<div class="left-side-menu">

	<div class="slimscroll-menu">

		<!--- Sidemenu -->
		<div id="sidebar-menu">
			<ul class="metismenu" id="side-menu">

				<li class="menu-title">Tác vụ</li>

				<li><a href="javascript: void(0);" class="waves-effect"> <i
						class="ion-md-speedometer"></i> <span> Trang chủ </span>
				</a>
					<ul class="nav-second-level" aria-expanded="false">
						<li><a href="index.html">Thống kê</a></li>
					</ul></li>

				<li><a href="javascript: void(0);" class="waves-effect"> <i
						class="ion-md-basket"></i> <span> Quản lý sản phẩm </span> <span
						class="menu-arrow"></span>
				</a>
					<ul class="nav-second-level" aria-expanded="false">
						<li><a href="product-manager">Danh sách sản phẩm</a></li>
						<li><a href="product-edit">Thêm sản phẩm</a></li>
					</ul></li>

				<li><a href="javascript: void(0);" class="waves-effect"> <i
						class="ion-ios-apps"></i> <span> Quản lý đơn hàng </span> <span
						class="menu-arrow"></span>
				</a>
					<ul class="nav-second-level" aria-expanded="false">
						<li><a href="order-manager.html">Danh sách đơn hàng</a></li>
					</ul></li>

				<li><a href="javascript: void(0);" class="waves-effect"> <i
						class="fas fa-mobile"></i> <span> Quản lý loại sản phẩm </span> <span
						class="menu-arrow"></span>
				</a>
					<ul class="nav-second-level" aria-expanded="false">
						<li><a href="categorys-manager.html">Danh sách loại sản
								phẩm</a></li>

					</ul></li>

				<li><a href="javascript: void(0);" class="waves-effect"> <i
						class="fas fa-users"></i> <span> Quản lý người dùng </span> <span
						class="menu-arrow"></span>
				</a>
					<ul class="nav-second-level" aria-expanded="false">
						<li><a href="user-manager.html">Danh sách người dùng</a></li>
					</ul></li>

			</ul>

		</div>
		<!-- End Sidebar -->

		<div class="clearfix"></div>

	</div>
	<!-- Sidebar -left -->

</div>
<!-- Left Sidebar End -->