<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Danh sách thành viên</title>


</head>
<body>
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

		<div class="row">
			<div class="col-xl-8">
				<div class="card">
					<div class="card-header py-3 bg-transparent">
						<div class="card-widgets">


							<select class="custom-select mr-sm-2" id="select-pay-order">
								
								<option value="now-year">Trong năm nay</option>
								<option>Trong tháng này</option>
							</select>

						</div>
						<h5 class="header-title mb-0">Tiền bán hàng</h5>

					</div>
					<div id="cardCollpase1" class="collapse show">
						<div class="card-body">
							<div class="row">
								<div class="col-md-12">

									<div class="row text-center mt-4 mb-4">
										<canvas id="charOrderMonney" width="600" height="400"></canvas>
									</div>
								</div>
							</div>

						</div>
					</div>
				</div>
				<!-- end card-->
			</div>
			<!-- end col -->
			<div class="col-xl-4">
				<div class="card">
					<div class="card-header py-3 bg-transparent">
						<div class="card-widgets">


							<select class="" id="select-time-order">
								
								<option value="now-year">Trong năm nay</option>
								<option value="now-month">Trong tháng</option>
							</select>

						</div>
						<h5 class="header-title mb-0">Thống kê đơn hàng</h5>

					</div>
					<div id="cardCollpase1" class="collapse show">
						<div class="card-body">
							<div class="row">
								<div class="col-md-12">

									<div class="row text-center mt-4 mb-4">
										<canvas id="charOrder" width="600" height="400"></canvas>
									</div>
								</div>
							</div>

						</div>
					</div>
				</div>
				<!-- end card-->

			</div>
			<!-- end col -->
		</div>

	</div>
</div>
<!-- end content -->

<script type="text/javascript">
$(document).ready(function() {
	charOrderByYear("now-year");
	charOrderPayByYear('now-year');
});

console.log($('#select-time-order').val());
$('#select-time-order').change(function() {
	console.log($('#select-time-order').val());
	var type = $('#select-time-order').val();
	
		charOrderByYear(type);

	
});

console.log($('#select-pay-order').val());
$('#select-pay-order').change(function() {
	console.log($('#select-pay-order').val());
	var type = $('#select-pay-order').val();
	
		charOrderPayByYear('now-year');

	
});

function charOrderByYear(type) {
	var date = new Date();
	var year = date.getFullYear();
	var month = date.getMonth();
	var url ="";
	if(type == 'now-year'){
		url = "/api/orders/" + year;
	}else if(type == 'now-month'){
		url = "/api/orders/" + parseInt(month + 1)+"/"+year;
	}
	console.log(year);
	$.ajax({
		type: "GET",
		url: url,
		success: function(data) {
			console.log(data.orderSuccess);
			var ctx = document.getElementById("charOrder");
			var orderStatus = ['Huỷ','Thành công' ];
			var chartOrder = new Chart(ctx, {
				type : 'pie',
				
				data : {
					
					labels : orderStatus,
					borderColor : "#0014ff",
					fill : false,
					datasets : [ {
						label : 'Số đơn hàng',
						data : [data.orderFail,data.orderSuccess],
						backgroundColor:[ 'rgba(30, 144, 255)', 'rgba(128, 128, 128)',] 
					}]
				},
				options:{
					legend:{
						position: 'right',
					}
				}
			});
			}
	});
};
	
function charOrderPayByYear(type) {
	var date = new Date();
	var year = date.getFullYear();
	var month = date.getMonth();
	var url ="";
	if(type == 'now-year'){
		url = "/api/orders/sum/" + year;
	}else if(type == 'now-month'){
		url = "/api/orders/" + parseInt(month + 1)+"/"+year;
	}
	console.log(year);
	$.ajax({
		type: "GET",
		url: url,
		success: function(data) {
			console.log(Object.values(data));
			
			var months = [ 'Tháng 1', 'Tháng 2', 'Tháng 3', 'Tháng 4', 'Tháng 5', 'Tháng 6', 'Tháng 7', 'Tháng 8', 'Tháng 9',
				'Tháng 10','Tháng 11','Tháng 12' ];
			var ctx = document.getElementById("charOrderMonney");
			var myChart = new Chart(ctx, {
				type : 'bar',
				
				data : {
					
					labels : months,
					borderColor : "#0014ff",
					fill : false,
					datasets : [ 
					{
						label : 'Số tiền thu về',
						data : Object.values(data),
						backgroundColor: "#797979",
					}]
				},
				options:{
					legend:{
						position: 'right',
					},
					 tooltips: {
				          callbacks: {
				                label: function(tooltipItem, data) {
				                    var value = data.datasets[0].data[tooltipItem.index];
				                    if(parseInt(value) >= 1000){
				                               return  value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + ' đ';
				                            } else {
				                               return  value + ' đ';
				                            }
				                }
				          } // end callbacks:
				        }, //end tooltips                
				            scales: {
				                yAxes: [{
				                    ticks: {
				                        beginAtZero:true,
				                        callback: function(value, index, values) {
				                            if(parseInt(value) >= 1000){
				                               return  value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + ' đ';
				                            } else {
				                               return value + ' đ';
				                            }
				                       }                            
				                    }
				                }]
				            }
				}
			});
			}
	});
};
	
</script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>


</body>
</html>