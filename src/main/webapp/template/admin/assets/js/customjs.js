
CKEDITOR.replace( 'editor1' );


$("#btn-save").click(function(){
				var data = {};
				var buildingTypes = [];
				var formData = $('#form-upload').serializeArray();
				console.log(formData);
				 $.ajax({

        url: "http://localhost:8080/mobileshop/admin/uploadOneFile",
        data: $("#form-upload").serialize(),
        type: "POST", 
        processData: false,
        contentType: false,

        success: function(data) {
               console.log("ss");
        },

        error: function (xhr, ajaxOptions, thrownError) {
                if (xhr.readyState == 0 || xhr.status == 0) {
                    // not really an error
                    return;
                } else {
                    alert("XHR Status = "+xhr.status);
                    alert("Thrown Error = "+thrownError);
                    alert("AjaxOptions = "+ajaxOptions)
                }
          }

    });
});


$(document).ready(function() {
        	  $("#product-edit").validate({
        	    rules: {
        	    	productName : {
        	        required: true,
        	        minlength: 6
        	      },
        	      price: {
        	        required: true,
        	        number: true,
        	        min: 18
        	      },
        	      category: {
        	        required: true
        	        
        	      }
        	     
        	    },
        	    messages : {
        	    	productName: {
        	        minlength: "Name should be at least 3 characters"
        	      },
        	      price: {
        	        required: "Please enter your age",
        	        number: "Please enter your age as a numerical value",
        	        min: "You must be at least 18 years old"
        	      },
        	      category: {
        	    	  required: "Please enter your age"
        	        
        	      },
        	     
        	    }
        	  });
        	});