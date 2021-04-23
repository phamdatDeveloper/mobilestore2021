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
	        		 img.append("<img width='100px' height='100px' src='<c:url value ='/"+item+"'/>' />");
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