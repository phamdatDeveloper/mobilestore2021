<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<title>Chỉnh sửa sản phẩm</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta content="Responsive bootstrap 4 admin template" name="description">
<meta content="Coderthemes" name="author">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- App favicon -->
<link rel="shortcut icon" href="assets\images\favicon.ico">

<!-- App css -->
<link href="assets\css\bootstrap.min.css" rel="stylesheet"
	type="text/css" id="bootstrap-stylesheet">
<link href="assets\css\icons.min.css" rel="stylesheet" type="text/css">
<link href="assets\css\app.min.css" rel="stylesheet" type="text/css"
	id="app-stylesheet">
<!--ck-->
<script src="assets\ckeditor\ckeditor.js"></script>

</head>

<body>

	<!-- Begin page -->
	<div id="wrapper">

		<div class="content-page">
			<div class="content">

				<!-- Start Content-->
				<div class="container-fluid">

					<!-- start page title -->
					<div class="row">
						<div class="col-12">
							<div class="page-title-box">
								<h4 class="page-title">Chỉnh sửa sản phẩm</h4>
								<div class="page-title-right">
									<ol class="breadcrumb p-0 m-0">
										<li class="breadcrumb-item"><a href="#">Quản lý sản
												phẩm</a></li>
										<li class="breadcrumb-item"><a href="#">Forms</a></li>
										<li class="breadcrumb-item active">Chỉnh sửa sản phẩm</li>
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
								<div class="card-body">
									<h4 class="header-title mb-4">Nhập thông tin sản phẩm</h4>

									<div class="row">
										<div class="col-12">

											<form:form action="save" method="get"
												modelAttribute="product" class="form-horizontal"
												id="product-edit">
												<div class="form-group row">

													<div class="col-lg-10">
														<form:hidden path="id" />
													</div>
												</div>
												<div class="form-group row">
													<label class="col-lg-2 col-form-label">Tên sản phẩm</label>
													<div class="col-lg-10">
														<form:input path="productName" name="productName"
															id="productName" type="text" class="form-control" />
													</div>
												</div>
												<div class="form-group row">
													<label class="col-lg-2 col-form-label" for="example-email">Giá</label>
													<div class="col-lg-10">
														<form:input path="price" name="price" id="price"
															type="text" class="form-control" />


													</div>
												</div>
												<div class="form-group row">
													<label class="col-lg-2 col-form-label">Phân loại
														sản phẩm</label>

													<div class="col-lg-10">
														<form:select path="categoryId" name="category"
															id="category" class=" custom-select form-control">
															<form:options items="${categorys}" itemValue="id"
																itemLabel="categoryName" />
														</form:select>

													</div>
												</div>
												<div class="form-group row ">
													<label class="col-lg-2 col-form-label"
														for="example-fileinput">Hình ảnh chính</label>
													<div class="col-lg-10 ">
														<button type="button" class="btn btn-primary mb-5"
															data-toggle="modal" data-target="#upload-main-image">Thêm ảnh</button>
														<div class="preview">
															<form:checkbox path="mainImage" value="${product.mainImage }"/>
															<img id="thumb" style="margin: 5px" width="100px"
																height="100px" src='<c:url value ="${product.mainImage }"/>' />
																
														</div>
													</div>

												</div>
												<div class="form-group row">
													<label class="col-lg-2 col-form-label "
														for="example-fileinput">Hình ảnh chi tiết</label>
													<div class="col-lg-10 ">
														<button type="button" class="btn btn-primary mb-5"
															data-toggle="modal" data-target="#upload-main-image">Thêm ảnh</button>
														<div class="preview " id="show-img">
															
																<c:forEach items="${secondaryImage }" var = "image" > 
														<form:checkbox path="secondaryImage" value="${image}" />
															
															   <img width="100px" height="100px" src="<c:url value ="${image}"/>" />
																										
														</c:forEach>
													
														</div>
														
													
													</div>

												</div>
												<div class="form-group row">
													<label class="col-lg-2 col-form-label"
														for="example-textarea">Mô tả sản phẩm</label>
													<div class="col-lg-10">
														<form:textarea path="description" class="form-control" rows="5" name="editor1"
															id="editor1"/>
														
													</div>
												</div>

												<div class="form-group row">
													<label class="col-lg-2 col-form-label">Giá khuyển
														mãi</label>
													<div class="col-lg-10">
														<form:input path="priceSale" class="form-control" id="priceSale"/>
														
													</div>
												</div>
												<div class="form-group row">
													<label class="col-lg-2 col-form-label">Tác vụ</label>
													<div class="col-lg-10">
														<div class="custom-control custom-checkbox">
															<input class="custom-control-input" id="checkbox1"
																type="checkbox" data-parsley-multiple="checkbox6">
															<label class="custom-control-label" for="checkbox1">
																Mới </label>
														</div>
														<div class="custom-control custom-checkbox">
															<input class="custom-control-input" id="sale"
																type="checkbox" data-parsley-multiple="checkbox6">
															<label class="custom-control-label" for="checkbox2">
																Khuyến mãi </label>
														</div>
														<div class="custom-control custom-checkbox">
															<input class="custom-control-input" id="checkbox3"
																type="checkbox" data-parsley-multiple="checkbox6">
															<label class="custom-control-label" for="checkbox3">
																Hiển thị </label>
														</div>
													</div>
												</div>

												<div class="form-group row">
													<div class="col-lg-4 "></div>
													<div class="col-lg-8 ">
														<input type="submit" class="btn btn-primary" value="Lưu">
													</div>
												</div>

											</form:form>
										</div>

									</div>
									<!-- end row -->

								</div>
							</div>
							<!-- end card -->
						</div>
						<!-- end col -->
					</div>
					<!-- end row -->


				</div>
				<!-- end container-fluid -->

			</div>
			<!-- end content -->

			
			<!-- Modal -->
			<div class="modal fade" id="upload-main-image" tabindex="-1"
				role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">Vui lòng tải ảnh lên</h5>
							<button type="submit" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
						

							<form action="" id="fileUploadForm">

								<p>
									<label for="image">Chọn ảnh</label>
								</p>
								<p>
									<input name="file" id="fileToUpload" type="file" multiple="multiple" />
								</p>
								
								
						
							</form>
						</div>
						<div class="modal-footer">
							<button  id="btnSubmit" class="btn btn-secondary"
								data-dismiss="modal">Tải lên</button>
							
						</div>
					</div>
				</div>
			</div>
			
			<script>
	$(document).ready(function () {

	    $("#btnSubmit").click(function (event) {

	        //stop submit the form, we will post it manually.
	        event.preventDefault();

	        fire_ajax_submit();

	    });

	});

	function fire_ajax_submit() {

	    // Get form
	    var form = $('#fileUploadForm')[0];

	    var data = new FormData(form);

	    $.ajax({
	        type: "POST",
	        enctype: 'multipart/form-data',
	        url: "http://localhost:8080/mobileshop/admin/uploadOneFile",
	        data: data,
	        //http://api.jquery.com/jQuery.ajax/
	        //https://developer.mozilla.org/en-US/docs/Web/API/FormData/Using_FormData_Objects
	        processData: false, //prevent jQuery from automatically transforming the data into a query string
	        contentType: false,
	        cache: false,
	        timeout: 600000,
	        success: function (data) {
	        	data.forEach(function(item, index, array) {
	        		 var img = $("#show-img");
	        		 
	        		 img.append("<input id='secondaryImage"+index+"' name='secondaryImage' type='checkbox' value='/"+item+"' checked='checked'><img width='100px' height='100px' src='<c:url value ='/"+item+"'/>' />");
	        		 $('#fileToUpload').val("");
	        	});	
	        },
	        error: function (e) {

	        	console.log("error");

	        }
	    });

	}
	
	 $("#sale").change(function(){
         $("#priceSale").prop("disabled", false);
     });
	</script>
</body>

</html>