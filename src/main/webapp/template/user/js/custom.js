
function confirmDeleteCart(id){
swal({
  title: "Bạn có chắc muốn xoá ?",
  text: "Sản phẩm sẽ được xoá khỏi giỏ hàng !",
  icon: "warning",
  buttons: true,
  cancel: true,
  confirm: "Ok",
  
})
.then((willDelete) => {
  if (willDelete) {
  deleteCart(id);
    swal("Sản phẩm đã được xoá khỏi giỏ hàng !", {
    	buttons: false,
  		timer: 1000,
      icon: "success",
    });
  }
});
}

function confirmCheckout(id){
swal({
  title: "Bạn có chắc muốn xoá ?",
  text: "Sản phẩm sẽ được xoá khỏi giỏ hàng !",
  icon: "warning",
  buttons: true,
  cancel: true,
  confirm: "Ok",
  
})
.then((willDelete) => {
  if (willDelete) {
  deleteCart(id);
    swal("Sản phẩm đã được xoá khỏi giỏ hàng !", {
    	buttons: false,
  		timer: 1000,
      icon: "success",
    });
  }
});
}

function deleteCart(id) {

	console.log(id);
	$.ajax({
		type: "GET",
		url: "/deleteCart/" + id,
		timeout: 600000,
		success: function(data) {
			console.log(data);
			var HTML = "";
			var totalPrice =0;
			var totalQuantity=0;
			
			for(var i=0;i< data.length;i++){
				totalPrice += data[i].totalPrice;
				totalQuantity += data[i].quantity;
				HTML += "<li>";
				HTML += "<a href='single-product-normal.html' class='minicart-product-image'><img src='"+data[i].product['mainImage']+"' alt='cart products'> </a>";
				HTML += "<div class='minicart-product-details'>";
				HTML += "<h6><a href='single-product-normal.html'>"+data[i].product['productName']+"</a></h6>";
				if(data[i].product['isSale'] != true){
				var price = data[i].product['price'];
				var fomatPrice = price.toString().replace(/(.)(?=(\d{3})+$)/g,'$1,');
				HTML += "<span>"+data[i].product['price']+" đ x"+data[i].quantity+"</span></div>";
				}else{
				var priceSale = data[i].product['priceSale'];
				var fomatPrice = priceSale.toString().replace(/(.)(?=(\d{3})+$)/g,'$1,');
				HTML += "<span>"+fomatPrice+" đ x"+data[i].quantity+"</span></div>";				}
				HTML += "<button class='close' onclick='deleteCart("+data[i].product['id']+")'>  <i class='fa fa-close'></i> </button></li>";
				
			}
			$("#minicart-product-list").html(HTML);
			var fomatTotalPrice = totalPrice.toString().replace(/(.)(?=(\d{3})+$)/g,'$1,');
			$("#totalPrice").html("<input hidden id='input-total-price' value ='"+totalPrice+"' > Tổng tiền: <span>"+fomatTotalPrice+"</span></p>");
			$("#show-total-quantity").html(totalQuantity);
			
			
			var HTMLCART = "";
			for(var i=0;i< data.length;i++){
				totalPrice += data[i].totalPrice;
				totalQuantity += data[i].quantity;
				HTMLCART += " <tr><input hidden id='idProductCart' value ='"+data[i].product['id']+"' >";
				HTMLCART += "<td class='li-product-remove'><i class='fa fa-times' onclick='confirmDeleteCart("+data[i].product['id']+")'></i></td>";
				HTMLCART += "<td class='li-product-thumbnail'><a href='#'><img src='"+data[i].product['mainImage']+"' with='150px' height='150px' alt='Li's Product Image'></a></td>";
				HTMLCART += "<td class='li-product-name'><a href='#'>"+data[i].product['productName']+"</a></td>";
				if(data[i].product['isSale'] != true){
					var price = data[i].product['price'];
					var fomatPrice = price.toString().replace(/(.)(?=(\d{3})+$)/g,'$1,');
					HTMLCART += "<td class='li-product-price'><input hidden id='price-"+data[i].product['id']+"' value ='"+data[i].product['price']+"' ><span class='amount'>"+fomatPrice+" đ</span></td>";                  
				}else{
					var priceSale = data[i].product['priceSale'];
					var fomatPriceSale = priceSale.toString().replace(/(.)(?=(\d{3})+$)/g,'$1,');
					HTMLCART += "<td class='li-product-price'><input hidden id='price-"+data[i].product['id']+"' value ='"+data[i].product['price']+"' ><span class='amount'>"+fomatPriceSale+" đ</span></td>";   		
				}
				HTMLCART += " <td><div class='input-group'>";
				HTMLCART += "<input type='button' value='-' class='button-minus' data-field='quantity' onclick ='decreaseQuantity("+data[i].product['id']+")'>";
				HTMLCART += "<input type='number' step='1' max='' value='"+data[i].quantity+"' name='quantity' class='quantity-field' id='quantity-product-"+data[i].product['id']+"'>";
				HTMLCART += "<input type='button' value='+' class='button-plus' data-field='quantity' onclick ='increaseQuantity("+data[i].product['id']+")'>";
				HTMLCART += "</div></td>";
				HTMLCART += "<td class='product-subtotal'><span class='amount' id='product-subtotal-"+data[i].product['id']+"'>"+fomatTotalPrice+" đ</span></td> </tr>";
				
			}	
			$("#body-table-cart").html(HTMLCART);
			$("#total-pay").html(fomatTotalPrice);
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
			console.log(data[0].quantity);
			console.log(data[0].product['productName']);	
			
			var HTML = "";
			var totalPrice=0;
			var totalQuantity=0;
			
			for(var i=0;i< data.length;i++){
				totalPrice += data[i].totalPrice;
				totalQuantity += data[i].quantity;
				HTML += "<li>";
				HTML += "<a href='single-product-normal.html' class='minicart-product-image'><img src='"+data[i].product['mainImage']+"' alt='cart products'> </a>";
				HTML += "<div class='minicart-product-details'>";
				HTML += "<h6><a href='single-product-normal.html'>"+data[i].product['productName']+"</a></h6>";
				if(data[i].product['isSale'] != true){
				var price = data[i].product['price'];
				var fomatPrice = price.toString().replace(/(.)(?=(\d{3})+$)/g,'$1,');
				HTML += "<span>"+data[i].product['price']+" đ x"+data[i].quantity+"</span></div>";
				}else{
				var priceSale = data[i].product['priceSale'];
				var fomatPrice = priceSale.toString().replace(/(.)(?=(\d{3})+$)/g,'$1,');
				HTML += "<span>"+fomatPrice+" đ x"+data[i].quantity+"</span></div>";				}
				HTML += "<button class='close' onclick='deleteCart("+data[i].product['id']+")'>  <i class='fa fa-close'></i> </button></li>";
				
			}
			$("#minicart-product-list").html(HTML);
			var fomatTotalPrice = totalPrice.toString().replace(/(.)(?=(\d{3})+$)/g,'$1,');
			$("#totalPrice").html("Tổng tiền: <span>"+fomatTotalPrice+"</span></p>");
			$("#show-total-quantity").html(totalQuantity);
			swal("Thêm vào giỏ hàng thành công !", {
		    	buttons: false,
		  		timer: 1000,
		      icon: "success",
		    });
			
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
			var HTML = "";
			var totalPrice =0;
			var totalQuantity=0;
			
			for(var i=0;i< data.length;i++){
				totalPrice += data[i].totalPrice;
				totalQuantity += data[i].quantity;
				HTML += "<li>";
				HTML += "<a href='single-product-normal.html' class='minicart-product-image'><img src='"+data[i].product['mainImage']+"' alt='cart products'> </a>";
				HTML += "<div class='minicart-product-details'>";
				HTML += "<h6><a href='single-product-normal.html'>"+data[i].product['productName']+"</a></h6>";
				if(data[i].product['isSale'] != true){
				
				var price = data[i].product['price'];
				var fomatPrice = price.toString().replace(/(.)(?=(\d{3})+$)/g,'$1,');
				HTML += "<span>"+data[i].product['price']+" đ x"+data[i].quantity+"</span></div>";
				}else{
				var priceSale = data[i].product['priceSale'];
				var fomatPriceSale = priceSale.toString().replace(/(.)(?=(\d{3})+$)/g,'$1,');
				HTML += "<span>"+fomatPriceSale+" đ x"+data[i].quantity+"</span></div>";				}
				HTML += "<button class='close' onclick='deleteCart("+data[i].product['id']+")'>  <i class='fa fa-close'></i> </button></li>";
				
			}
			$("#minicart-product-list").html(HTML);
			var fomatTotalPrice = totalPrice.toString().replace(/(.)(?=(\d{3})+$)/g,'$1,');
			$("#totalPrice").html("Tổng tiền: <span>"+fomatTotalPrice+"</span></p>");
			$("#show-total-quantity").html(totalQuantity);
			$("#total-pay").html(fomatTotalPrice);

		},
		error: function(e) {

			console.log("error");

		}
	});
};



function increaseQuantity(id) {
	var idInput = "#quantity-product-"+id;
	var quantityProduct = $(idInput).val();
	var idPrice ="#price-"+id;
	var price = $(idPrice).val();
	var subPrice ="#product-subtotal-"+id;
	var total = (parseInt(quantityProduct)+1)*price;
	editCart(id,parseInt(quantityProduct)+1);
	$(idInput).val(parseInt(quantityProduct)+1);
	$(subPrice).html(total.toString().replace(/(.)(?=(\d{3})+$)/g,'$1,'));
};
function decreaseQuantity(id) {
	var idInput = "#quantity-product-"+id;
	var quantityProduct = $(idInput).val();
	console.log(quantityProduct);
	if (quantityProduct < 1 || (quantityProduct-1) == 0) {
		confirmDeleteCart(id);
		
	}else{
		var idInput = "#quantity-product-"+id;
	var quantityProduct = $(idInput).val();
	var idPrice ="#price-"+id;
	var price = $(idPrice).val();
	var subPrice ="#product-subtotal-"+id;
	var total = (parseInt(quantityProduct)-1)*price;
	editCart(id,parseInt(quantityProduct)-1);
	$(idInput).val(parseInt(quantityProduct)-1);
	$(subPrice).html(total.toString().replace(/(.)(?=(\d{3})+$)/g,'$1,'));
		
	};

};


