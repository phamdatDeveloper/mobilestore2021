<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Quản lý danh sách nhân viên</title>
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
									<li class="breadcrumb-item"><a href="#">Quản lý khách
											hàng</a></li>
									<li class="breadcrumb-item active">Danh sách khách hàng</li>
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
								<h4 class="m-t-0 header-title mb-4">
									<b>Danh sách khách hàng</b>
								</h4>

								<table id="datatable-buttons"
									class="table table-striped table-bordered dt-responsive nowrap"
									style="border-collapse: collapse; border-spacing: 0; width: 100%;">

									<thead>
										<tr>
											<th>Tên tài khoản</th>
											<th>Họ & tên</th>
											<th>Email</th>
											<th>Quyền truy cập</th>
											<th>Tác vụ</th>
										</tr>
									</thead>

									<tbody id="body-table">
										<c:forEach items="${listUser}" var="user">

											<tr>
												<td>${user.username}</td>
												<td>${user.fullName }</td>
												<td>${user.email }</td>
												<td id="display-role-${user.id}"><c:forEach
														items="${user.role}" var="role">

														<span class="badge badge-success">${role}</span>
													</c:forEach></td>
												<td>
													<button type="button" onclick="buttonEdit(${user.id})"
														id="edit-button" class="btn btn-primary"
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
						<h4 class="modal-title">Chỉnh sửa</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>
					<form id="form-update-user">
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
										<input type="hidden" name="id" id="id-input">
										<td>Phân quyền</td>
										<td><input type="checkbox" name="roles" id="ROLE_ADMIN"
											value="ROLE_ADMIN"><label>Admin</label> <input
											type="checkbox" name="roles" id="ROLE_USER" value="ROLE_USER"><label>User</label></td>
									</tr>
									<tr>
										<td>Trạng thái</td>
										<td>
											<div class="custom-control custom-switch">
												<input type="checkbox" class="custom-control-input"
													id="switch1" name="active" value="true"> <label
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
								onclick="showValue()" id="submit-button" data-dismiss="modal">Lưu</button>
						</div>
					</form>
				</div>
			</div>
		</div>

	</div>
	<script type="text/javascript">
function buttonEdit(id){
	$.ajax({
        type: 'get',
        url: '/api/user/'+id,
        success: function (data) {
        	$('#id-input').val(data.id);
        	var roles = data.role;
        	if(roles.length == 0){
        		$('#ROLE_ADMIN').prop('checked',false);
      		   	$('#ROLE_USER').prop('checked',false);
        	}else{
        		$('#ROLE_ADMIN').prop('checked',false);
      		   	$('#ROLE_USER').prop('checked',false);
        	$.each( roles, function( index, value ){
        	   if(value === 'ROLE_ADMIN'){
        		   console.log('admin');
        		   $('#ROLE_ADMIN').prop('checked',true);
        	   }else if(value === 'ROLE_USER'){
        		   console.log('user');
        		   $('#ROLE_USER').prop('checked',true);
        	   }
        	});
        	}
        	
        	if(data.active === true){
        		$('#switch1').prop('checked',true);
        	}
        }
    });
}

function showValue(){
	
	ajaxForm();
		
}

function ajaxForm(){
	var data =  $('#form-update-user').serialize();
	console.log(JSON.stringify(data));
	$.ajax({
		type : "put",
		data : data,
		url : "/api/user?"+data,
		dataType : 'JSON',
		 success: function (data) {
			 var role = data.role;
			 var html ="";
			 $.each( role, function( index, value ){
				 console.log("aaaaa");
				html += '<span class="badge badge-success">'+value+'</span>';
	        	});
			 $('#display-role-'+data.id).html(html);
			 
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