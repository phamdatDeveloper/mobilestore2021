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
			<div class="col-xl-8">
				<div class="card">
					<div class="card-header py-3 bg-transparent">
						<div class="card-widgets">

							<button class ="btn btn-info" id="find-by-now-year">Trong năm nay</button>
							<button class="btn btn-info" id="find-by-year">Tìm trong năm</button>
							<input type ="number" id= "input-of-find-by-year" style="display: none;">
							

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

<!-- Khoi tao bieu do ban dau -->
$(document).ready(function() {
	charOrderByYear("now-year");
	charOrderPayByYear('');
});
<!-- set sk click 2 button -->
$('#find-by-year').click(function(){
  $("#input-of-find-by-year").show();
});

$('#find-by-now-year').click(function(){
	  $("#input-of-find-by-year").hide();
	  charOrderPayByYear('');
	});

$('#input-of-find-by-year').keyup(function() {
   
    charOrderPayByYear($(this).val());
});

console.log($('#select-time-order').val());
$('#select-time-order').change(function() {
	console.log($('#select-time-order').val());
	var type = $('#select-time-order').val();
	
		charOrderByYear(type);

	
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
	
function charOrderPayByYear(year) {
	var date = new Date();
	var nowYear = date.getFullYear();
	var month = date.getMonth();
	var url ="";
	if(year == ''){
		url = "/api/orders/sum/" + nowYear;
	}else{
		url = "/api/orders/sum/"+year;
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