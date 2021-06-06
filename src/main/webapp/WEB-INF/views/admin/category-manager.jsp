<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quản lý loại sản phẩm</title>
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
									<li class="breadcrumb-item"><a href="#">Quản lý loại
											sản phẩm</a></li>
									<li class="breadcrumb-item active">Danh sách loại sản phẩm</li>
								</ol>
							</div>
							<div class="clearfix"></div>
						</div>
					</div>
				</div>
				<!-- end page title -->
				<div class="row">
					<div class="col-12">
						<div class="card">
							<div class="card-body table-responsive">
								<div class="d-flex">
									<h4 class="m-t-0 header-title mb-4 ">
										<b>Danh sách khách hàng</b>
									</h4>
									<button type="button" class="btn btn-primary ml-auto p-2 mb-4"
										data-toggle="modal" data-target="#add-category-Modal">
										Thêm Loại Sản Phẩm</button>
								</div>
								<table id="datatable-buttons"
									class="table table-striped table-bordered dt-responsive nowrap"
									style="border-collapse: collapse; border-spacing: 0; width: 100%;">

									<thead>
										<tr>
											<th>Tên loại</th>
											<th>Trạng thái</th>
											<th>Ngày khởi tạo</th>
											<th>Tác vụ</th>
										</tr>
									</thead>

									<tbody id="body-table">
										<c:forEach items="${listCategory }" var="category">
											<tr>
												<td id="display-categoryName-${category.id}">${category.categoryName}</td>
												<td id="display-active-${category.id}"><c:choose>
														<c:when test="${category.active == true }">
															<span class="badge badge-success">Đang hiển thị</span>

														</c:when>
														<c:otherwise>
															<span class="badge badge-success">Khóa</span>

														</c:otherwise>
													</c:choose></td>
												<td>${category.createDate}</td>
												<td>
													<button type="button" class="btn btn-primary"
														onclick="showEditCategory(${category.id})"
														data-toggle="modal" data-target="#edit-category-Modal">
														Sửa</button>
												</td>
											</tr>
										</c:forEach>

									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
				<!-- end row -->

			</div>
			<!-- end container-fluid -->

		</div>
		<!-- end content -->

		<!-- The Modal -->
		<div class="modal" id="edit-category-Modal">
			<div class="modal-dialog">
				<div class="modal-content">

					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">Chỉnh sửa thông loại hàng</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>

					<!-- Modal body -->
					<form action="" id="form-update-category">
						<div class="modal-body">
							<table class="table "
								style="border-collapse: collapse; border-spacing: 0; width: 100%;">

								<thead>
									<tr>
										<th>Tên</th>
										<th>Tác vụ</th>

									</tr>
								</thead>

								<tbody>
									<tr>
										<td>Tên</td>
										<td><input type="text" name="categoryName"
											id="editCategoryName"> <input type="hidden" name="id"
											id="id-input"></td>
									</tr>
									<tr>
										<td>Hiển thị</td>
										<td>
											<div class="custom-control custom-switch">
												<input type="checkbox" value="false" name="active"
													class="custom-control-input" id="switch1"> <label
													class="custom-control-label" for="switch1">Khóa</label>
											</div>
										</td>
									</tr>

								</tbody>
							</table>
						</div>

						<!-- Modal footer -->
						<div class="modal-footer">
							<button type="button" class="btn btn-danger"
								onclick="saveCategory()" id="submit-button" data-dismiss="modal">Lưu</button>
						</div>
					</form>
				</div>
			</div>
		</div>

		<!-- The Modal -->
		<div class="modal" id="add-category-Modal">
			<div class="modal-dialog">
				<div class="modal-content">

					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">Thêm loại sản phẩm</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>
					<form action="" id="add-form-category">
						<!-- Modal body -->
						<div class="modal-body">
							<table class="table "
								style="border-collapse: collapse; border-spacing: 0; width: 100%;">

								<thead>
									<tr>
										<th>Tên</th>
										<th>Tác vụ</th>

									</tr>
								</thead>

								<tbody>
									<tr>
										<td>Tên</td>
										<td><input type="text" name="categoryName" class="" id="">

										</td>
									</tr>
									<tr>
										<td>Trạng thái</td>
										<td>
											<div class="custom-control custom-switch">
												<input type="checkbox" name="active" value="false"
													class="custom-control-input" id="switch2"> <label
													class="custom-control-label" for="switch2">Hiển thị</label>
											</div>
										</td>
									</tr>

								</tbody>
							</table>
						</div>

						<!-- Modal footer -->
						<div class="modal-footer">
							<button type="button" onclick="addCategory()"
								class="btn btn-danger" data-dismiss="modal">Thêm</button>
						</div>
					</form>
				</div>
			</div>
		</div>

		<!-- Footer Start -->
		<footer class="footer">
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-12">Mobile Store</div>
				</div>
			</div>
		</footer>
		<!-- end Footer -->

	</div>
	<script type="text/javascript">
function showEditCategory(id){
	$.ajax({
        type: 'get',
        url: '/api/categorys/'+id,
        success: function (data) {
        	$('#id-input').val(data.id);
        	$('#editCategoryName').val(data.categoryName);
     
        	if(data.active === false){
        		$('#switch1').prop('checked',true);
        	}
        }
    });
}

function saveCategory(){
	
	ajaxForm();
		
}
function addCategory(){
	var data =  $('#add-form-category').serialize();
	console.log(JSON.stringify(data));
	$.ajax({
		type : "put",
		data : data,
		url : "/api/categorys?"+data,
		dataType : 'JSON',
		 success: function (value) {
			 var html = "";
			 html+= '<tr><td id="display-categoryName-'+value.id+'">'+value.categoryName+'</td>';
			 var active = value.active;
			 if(active == false){
				 html += '<td id="display-active-'+value.id+'"><span class="badge badge-success">Khóa</span></td>';
			 }else{
				 html += '<td id="display-active-'+value.id+'"><span class="badge badge-success">Đang hiển thị</span></td>';
			 }
			 var date = new Date(value.createDate);
			 html +='<td>'+date+'</td>';
			 html +='<td><button type="button" class="btn btn-primary" onclick="showEditCategory('+value.id+')" data-toggle="modal" data-target="#edit-category-Modal">Sửa</button></td></tr>';
			 
			 $('#body-table').append(html);
				

			 swal("Thêm thành công !", {
			    	buttons: false,
			  		timer: 1000,
			      icon: "success",
			    });
		 }
	});
}
function ajaxForm(){
	var data =  $('#form-update-category').serialize();
	console.log(JSON.stringify(data));
	$.ajax({
		type : "put",
		data : data,
		url : "/api/categorys?"+data,
		dataType : 'JSON',
		 success: function (value) {
			 $('#display-categoryName-'+value.id).html(value.categoryName);
			 var active = value.active;
			 var html="";
			 if(active == false){
				 html += '<span class="badge badge-success">Khóa</span>'
			 }else{
				 html += '<span class="badge badge-success">Đang hiển thị</span>'
			 }
			 $('#display-active-'+value.id).html(html);

			 swal("Chỉnh sửa thành công !", {
			    	buttons: false,
			  		timer: 1000,
			      icon: "success",
			    });
		 }
	});
}
</script>
</body>
</html>