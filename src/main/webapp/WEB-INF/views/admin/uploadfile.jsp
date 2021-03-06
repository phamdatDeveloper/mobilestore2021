<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>Upload One File:</h3>
	<br />
	<br />
	<!-- MyUploadForm -->
	 <div id="wrapper">

            <div class="content-page">
                <div class="content">
                    
                    <!-- Start Content-->
                    <div class="container-fluid">
	
<div class="row">
    <div class="col-md-3">
        <div class="custom-control custom-checkbox image-checkbox">
            <input type="checkbox" class="custom-control-input" id="ck1a">
            <label class="custom-control-label" for="ck1a">
                <img src="https://cdn.tgdd.vn/Products/Images/42/213031/iphone-12-xanh-duong-new-600x600-600x600.jpg" alt="#" class="img-fluid">
            </label>
        </div>
    </div>

    <div class="col-md-3">
        <div class="custom-control custom-checkbox image-checkbox">
            <input type="checkbox" class="custom-control-input" id="ck1b">
            <label class="custom-control-label" for="ck1b">
                <img src="https://cdn.tgdd.vn/Products/Images/42/213031/iphone-12-xanh-duong-new-600x600-600x600.jpg" alt="#" class="img-fluid">
            </label>
        </div>
    </div>
    <div class="col-md-3">
        <div class="custom-control custom-checkbox image-checkbox">
            <input type="checkbox" class="custom-control-input" id="ck1c">
            <label class="custom-control-label" for="ck1c">
                <img src="https://cdn.tgdd.vn/Products/Images/42/213031/iphone-12-xanh-duong-new-600x600-600x600.jpg" alt="#" class="img-fluid">
            </label>
        </div>
    </div>
    <div class="col-md-3">
        <div class="custom-control custom-checkbox image-checkbox">
            <input type="checkbox" class="custom-control-input" id="ck1d">
            <label class="custom-control-label" for="ck1d">
                <img src="https://cdn.tgdd.vn/Products/Images/42/213031/iphone-12-xanh-duong-new-600x600-600x600.jpg" alt="#" class="img-fluid">
            </label>
        </div>
    </div>
</div>
	<form action="" id="fileUploadForm">

		<p>
			<label for="image">Choose Image</label>
		</p>
		<p>
			<input name="file" id="fileToUpload" type="file" multiple="multiple" />
		</p>
		
		<p>
			<button id="btnSubmit">upload</button>
		</p>
<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" />
	</form>

	<div id="show-img">
		
	</div>
	
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
	        url: "http://localhost:8080/admin/uploadOneFile?${_csrf.parameterName}=${_csrf.token}",
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
	        		 img.append("<img width='100px' height='100px' src='<c:url value ='"+item+"'/>' />");
	        		 $('#fileToUpload').val("");
	        	});	
	        },
	        error: function (e) {

	        	console.log("error");

	        }
	    });

	}
	</script>
</body>
</html>