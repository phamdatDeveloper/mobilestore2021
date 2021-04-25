<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<div class="content-page">
	<div class="content">

		<!-- Start Content-->
		<div class="container-fluid">

			<!-- start page title -->
			<div class="row">
				<div class="col-12">
					<div class="page-title-box">
						<h4 class="page-title">Xin chào !</h4>
						<div class="page-title-right">
							<ol class="breadcrumb p-0 m-0">
								<li class="breadcrumb-item"><a href="#">LIMUPA</a></li>
								<li class="breadcrumb-item"><a href="#">Trang chủ</a></li>
								<li class="breadcrumb-item active">Thống kê</li>
							</ol>
						</div>
						<div class="clearfix"></div>
					</div>
				</div>
			</div>
			<!-- end page title -->

			<div class="row">
				<div class="col-xl-3 col-sm-6">
					<div class="card bg-pink">
						<div class="card-body widget-style-2">
							<div class="text-white media">
								<div class="media-body align-self-center">
									<h2 class="my-0 text-white">
										<span data-plugin="counterup">250</span>
									</h2>
									<p class="mb-0">Số lượng truy cập</p>
								</div>
								<i class="ion-md-eye"></i>
							</div>
						</div>
					</div>
				</div>

				<div class="col-xl-3 col-sm-6">
					<div class="card bg-purple">
						<div class="card-body widget-style-2">
							<div class="text-white media">
								<div class="media-body align-self-center">
									<h2 class="my-0 text-white">
										<span data-plugin="counterup">${countProduct}</span>
									</h2>
									<p class="mb-0">Số lượng sản phẩm</p>
								</div>
								<i class="ion-md-paper-plane"></i>
							</div>
						</div>
					</div>
				</div>

				<div class="col-xl-3 col-sm-6">
					<div class="card bg-info">
						<div class="card-body widget-style-2">
							<div class="text-white media">
								<div class="media-body align-self-center">
									<h2 class="my-0 text-white">
										<span data-plugin="counterup">50</span>
									</h2>
									<p class="mb-0">Số đơn bán ra</p>
								</div>
								<i class="ion-ios-pricetag"></i>
							</div>
						</div>
					</div>
				</div>

				<div class="col-xl-3 col-sm-6">
					<div class="card bg-primary">
						<div class="card-body widget-style-2">
							<div class="text-white media">
								<div class="media-body align-self-center">
									<h2 class="my-0 text-white">
										<span data-plugin="counterup">100,000</span>
									</h2>
									<p class="mb-0">Số tiền thu về</p>
								</div>
								<i class="mdi mdi-comment-multiple"></i>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- end container-fluid -->

	</div>
	<!-- end content -->