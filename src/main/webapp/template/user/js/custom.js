function deleteCart(id) {

	console.log(id);
	$.ajax({
		type: "GET",
		url: "/deleteCart/" + id,
		timeout: 600000,
		success: function(data) {
			console.log(data);

			$("#table-cart").load("#table-cart >*");
			$("#mini-cart").load(" #mini-cart > *");

		},
		error: function(e) {

			console.log("error");

		}
	});
};

function addCart(id) {

	console.log(id);
	$.ajax({
		type: "GET",
		url: "/addCart/" + id,
		timeout: 600000,
		success: function(data) {
			console.log(data);
			$("#mini-cart").load(" #mini-cart > *");
			Swal.fire({

				icon: 'success',
				type: "success",
				title: 'Thêm vào giỏ hàng thành công',
				showConfirmButton: false,
				timer: 1000
			})
		},
		error: function(e) {

			console.log("error");

		}
	});
};

function editCart(id,quantity) {
	
	console.log("edit:"+quantity);
	console.log(id);
	$.ajax({
		type: "GET",
		url: "/updateCart/" + id+"/"+quantity,
		timeout: 600000,
		success: function(data) {
			console.log(data);

			$("#body-wrapper").load("#body-wrapper");
			

		},
		error: function(e) {

			console.log("error");

		}
	});
};

function increaseQuantity(id) {
	var quantityProduct = $("#quantity-product").val();
	editCart(id,parseInt(quantityProduct)+1);

};
function decreaseQuantity(id) {
	var quantityProduct = $("#quantity-product").val();
	console.log(quantityProduct);
	if (quantityProduct < 1 || (quantityProduct-1) == 0) {
		deleteCart(id);
		
	}else{
		editCart(id,parseInt(quantityProduct)-1);
	};

};


function incrementValue(e) {
  e.preventDefault();
  var fieldName = $(e.target).data('field');
  var parent = $(e.target).closest('div');
  var currentVal = parseInt(parent.find('input[name=' + fieldName + ']').val(), 10);

  if (!isNaN(currentVal)) {
    parent.find('input[name=' + fieldName + ']').val(currentVal + 1);
  } else {
    parent.find('input[name=' + fieldName + ']').val(0);
  }
}

function decrementValue(e) {
  e.preventDefault();
  var fieldName = $(e.target).data('field');
  var parent = $(e.target).closest('div');
  var currentVal = parseInt(parent.find('input[name=' + fieldName + ']').val(), 10);

  if (!isNaN(currentVal) && currentVal > 0) {
    parent.find('input[name=' + fieldName + ']').val(currentVal - 1);
  } else {
    parent.find('input[name=' + fieldName + ']').val(0);
  }
}



$('.input-group').on('click', '.button-minus', function(e) {
  decrementValue(e);
});

$('.input-group').on('click', '.button-plus', function(e) {
  incrementValue(e);
});