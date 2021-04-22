<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
	<form:form method="POST"
		action="http://localhost:8080/admin/uploadOneFile"
		enctype="multipart/form-data">



		<p>
			<label for="image">Choose Image</label>
		</p>
		<p>
			<input name="file" id="fileToUpload" type="file" multiple="multiple" />
		</p>
		
		<p>
			<input type="submit" value="Upload">
		</p>

	</form:form>
</div>
</div>
</div>
</div>

</body>
</html>