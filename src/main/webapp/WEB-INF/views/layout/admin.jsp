<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<title><decorator:title default="Home" /></title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta content="Responsive bootstrap 4 admin template" name="description">
<meta content="Coderthemes" name="author">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- App favicon -->
<link rel="shortcut icon"
	href="<c:url value ="/template/admin/assets/images/icon-logo.jpg"/>">

<!-- Plugins css-->
<link
	href="<c:url value ="/template/admin/assets/libs/sweetalert2/sweetalert2.min.css"/>"
	rel="stylesheet" type="text/css">
<link
	href="<c:url value ="/template/admin/assets/libs/datatables/dataTables.bootstrap4.min.css"/>"
	rel="stylesheet" type="text/css">
<link
	href="<c:url value ="/template/admin/assets/libs/datatables/buttons.bootstrap4.min.css"/>"
	rel="stylesheet" type="text/css">
<link
	href="<c:url value ="/template/admin/assets/libs/datatables/responsive.bootstrap4.min.css"/>"
	rel="stylesheet" type="text/css">
<link
	href="<c:url value ="/template/admin/assets/libs/datatables/select.bootstrap4.min.css"/>"
	rel="stylesheet" type="text/css">
<!-- App css -->
<link
	href="<c:url value ="/template/admin/assets/css/bootstrap.min.css"/>"
	rel="stylesheet" type="text/css" id="bootstrap-stylesheet">
<link
	href="<c:url value ="/template/admin/assets/css/bootstrap-image-checkbox.css"/>"
	rel="stylesheet" type="text/css" id="bootstrap-stylesheet">
<link href="<c:url value ="/template/admin/assets/css/icons.min.css"/>"
	rel="stylesheet" type="text/css">
<link href="<c:url value ="/template/admin/assets/css/app.min.css"/>"
	rel="stylesheet" type="text/css" id="app-stylesheet">
<link href="<c:url value ="/template/admin/assets/css/custom.css"/>"
	rel="stylesheet" type="text/css" id="app-stylesheet">
<link
	href="<c:url value ="/template/admin/assets/libs/dropzone/dropzone.min.css"/>"
	rel="stylesheet" type="text/css">
<!--ck-->
    <link rel="stylesheet" href="<c:url value ="/template/user/css/sweetalert2.min.css"/>">
        <script src="<c:url value ="/template/user/js/sweetalert2.min.js"/>"></script>

<script src="<c:url value ="/template/admin/assets/js/jquery.min.js"/>"></script>
<script
	src="<c:url value ="/template/admin/assets/js/jquery.validate.min.js"/>"></script>

<script
	src="<c:url value ="/template/admin/assets/ckeditor/ckeditor.js"/>"></script>
</head>

<body>

	<!-- Begin page -->
	<div id="wrapper">
		<!-- Header -->
		<%@include file="/WEB-INF/views/layout/admin/header.jsp"%>
		<!-- Body -->
		<decorator:body />

		<!-- Footer Start -->
		<%@include file="/WEB-INF/views/layout/admin/footer.jsp"%>
		<!-- end Footer -->

	</div>
	<!-- END wrapper -->

	<!-- Vendor js -->
	<script src="<c:url value ="/template/admin/assets/js/vendor.min.js"/>"></script>
	<!-- Required datatable js -->
	<script
		src="<c:url value ="/template/admin/assets/libs/datatables/jquery.dataTables.min.js"/>"></script>
	<script
		src="<c:url value ="/template/admin/assets/libs/datatables/dataTables.bootstrap4.min.js"/>"></script>
	<!-- App js -->
	<script src="<c:url value ="/template/admin/assets/js/app.min.js"/>"></script>
	<!-- Responsive examples -->
	<script
		src="<c:url value ="/template/admin/assets/libs/datatables/dataTables.responsive.min.js"/>"></script>
	<script
		src="<c:url value ="/template/admin/assets/libs/datatables/responsive.bootstrap4.min.js"/>"></script>

	<script
		src="<c:url value ="/template/admin/assets/libs/datatables/dataTables.keyTable.min.js"/>"></script>
	<script
		src="<c:url value ="/template/admin/assets/libs/datatables/dataTables.select.min.js"/>"></script>
	<!-- Datatables init -->
	<script
		src="<c:url value ="/template/admin/assets/js/pages/datatables.init.js"/>"></script>

	<!-- custom js -->
	<script src="<c:url value ="/template/admin/assets/js/customjs.js"/>"></script>
	<!-- dropzone -->
	<script
		src="<c:url value ="/template/admin/assets/libs/dropzone/dropzone.min.js"/>"></script>
</body>
</html>