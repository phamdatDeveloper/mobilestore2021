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
        <link href="assets\css\bootstrap.min.css" rel="stylesheet" type="text/css" id="bootstrap-stylesheet">
        <link href="assets\css\icons.min.css" rel="stylesheet" type="text/css">
        <link href="assets\css\app.min.css" rel="stylesheet" type="text/css" id="app-stylesheet">
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
                                            <li class="breadcrumb-item"><a href="#">Quản lý sản phẩm</a></li>
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
                                                <div class="">
                                                    <form class="form-horizontal">
                                                        <div class="form-group row">
                                                            <label class="col-lg-2 col-form-label">Tên sản phẩm</label>
                                                            <div class="col-lg-10">
                                                                <input type="text" class="form-control" value="Tên sản phẩm">
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <label class="col-lg-2 col-form-label" for="example-email" >Giá</label>
                                                            <div class="col-lg-10">
                                                                <input type="email" id="price-product" name="example-email" class="form-control" placeholder="Giá sản phẩm ">
                                                                <p id="convert-money"></p>
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <label class="col-lg-2 col-form-label">Phân loại sản phẩm</label>
                                                            <div class="col-lg-10">
                                                                <select class=" custom-select form-control">
                                                                    <option>Iphone</option>
                                                                    <option>Samsung</option>
                                                                    <option>Huawei</option>
                                                                    <option>Oppo</option>
                                                                    <option>Nokia</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="form-group row ">
                                                                <label class="col-lg-2 col-form-label" for="example-fileinput">Hình ảnh chính</label>
                                                                <div class="col-lg-10 ">
                                                            
                                                                    <input type="file" class="form-control-file " id="example-fileinput">
                                                                    <div class="preview">
                                                                         <img id="thumb" style="margin: 5px" width="100px" height="100px" src="assets\images\layouts\dark.png" />
                                                                    </div>
                                                                </div>
                                                                
                                                            </div>
                                                        <div class="form-group row">
                                                            <label class="col-lg-2 col-form-label " for="example-fileinput">Hình ảnh chi tiết</label>
                                                            <div class="col-lg-10 ">
                                                                <input type="file" class="form-control-file  " id="example-fileinput">
                                                                <div class="preview">
                                                                     <img id="thumb" style="margin: 5px" width="100px" height="100px" src="assets\images\layouts\dark.png" />
                                                                     <img id="thumb" style="margin: 5px" width="100px" height="100px" src="assets\images\layouts\dark.png" />

                                                                </div>
                                                            </div>
                                                            
                                                        </div>
                                                        <div class="form-group row">
                                                            <label class="col-lg-2 col-form-label" for="example-textarea">Mô tả sản phẩm</label>
                                                            <div class="col-lg-10">
                                                                <textarea class="form-control" rows="5" name="editor1" id="editor1"></textarea>
                                                            </div>
                                                        </div>

                                                        <div class="form-group row">
                                                            <label class="col-lg-2 col-form-label">Giá khuyển mãi</label>
                                                            <div class="col-lg-10">
                                                                <input type="text" class="form-control" >
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <label class="col-lg-2 col-form-label">Tác vụ</label>
                                                            <div class="col-lg-10">
                                                                <div class="custom-control custom-checkbox"> 
                                                                    <input class="custom-control-input" id="checkbox1" type="checkbox" data-parsley-multiple="checkbox6">
                                                                    <label class="custom-control-label" for="checkbox1">
                                                                        Mới
                                                                    </label>
                                                                </div>
                                                                <div class="custom-control custom-checkbox"> 
                                                                    <input class="custom-control-input" id="checkbox2" type="checkbox" data-parsley-multiple="checkbox6">
                                                                    <label class="custom-control-label" for="checkbox2">
                                                                        Khuyến mãi
                                                                    </label>
                                                                </div>
                                                                <div class="custom-control custom-checkbox">
                                                                    <input class="custom-control-input" id="checkbox3" type="checkbox" data-parsley-multiple="checkbox6">
                                                                    <label class="custom-control-label" for="checkbox3">
                                                                        Hiển thị
                                                                    </label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                       
                                                        <div class="form-group row">
                                                            <div class="col-lg-4 "></div>
                                                            <div class="col-lg-8 ">
                                                                <input type="submit" class="btn btn-primary" value="Lưu">
                                                            </div>
                                                        </div>
                                                        
                                                    </form>
                                                </div>
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

                

              

    
        <script>
            CKEDITOR.replace( 'editor1' );
        </script>
        <script>
            $("#price-product").blur(function(){
                var num = $("#price-product").val();
                $("#convert-money").css("color", "red");
                $("#convert-money").text(num.toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,")+" đ");
            });
        </script>
    </body>

</html>