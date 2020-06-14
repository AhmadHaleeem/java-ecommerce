// Add products to cart
function addToCart(pId, pName, price) {

	let cart = localStorage.getItem("cart");

	if (cart == null) {
		// no cart yet
		let products = [];
		let product = {
			productId : pId,
			productName : pName,
			productQuantity : 1,
			productPrice : price
		};
		
		products.push(product);
		localStorage.setItem("cart", JSON.stringify(products));
		//console.log("Product is added for the first time");
		showToast("Product is added to cart");
	} else {
		// cart is already present
		let pCart = JSON.parse(cart);
		
		const oldProduct = pCart.find((item) => item.productId === pId);
		if (oldProduct) {
			oldProduct.prodcutQuantity += 1;
			
			pCart.map((item) => {
				if (item.productId == oldProduct.productId) {
					item.productQuantity = oldProduct.productQuantity;
				}
			})
			
			localStorage.setItem("cart", JSON.stringify(pCart));
			//console.log("Product quantity has increased");
			showToast(oldProduct.productName + " quantity is increased");
		} else {
			let product = {
					productId : pId,
					productName : pName,
					productQuantity : 1,
					productPrice : price
				};
				
			pCart.push(product);
			localStorage.setItem("cart", JSON.stringify(pCart));
			//console.log("Product is added successfully");
			showToast("Product is added to cart");
		}

	}
	
	updateCart();
}

// update cart
function updateCart() {
	let cartString = localStorage.getItem("cart");
	let cart = JSON.parse(cartString);
	
	if (cart == null || cart.length == 0) {
		console.log("Cart is empty");
		$(".cart-items").html("(0)");
		$(".cart-body").html("<h3>Cart doesn't contain items </h3>");
		$(".checkout-btn").addClass("disabled");
	} else {
		console.log("CART...")
		
		$(".cart-items").html(`(${cart.length})`);
		let table = `
			<table class="table">
				<thead class="thead-light">
					<tr>
						<th>Item name</th>
						<th>Price</th>
						<th>Quantity</th>
						<th>Total Price</th>
						<th>Action</th>
					</tr>
				</thead>
		`;
		let totalPrice = 0;
		
		cart.map((item) => {
			table += `
				<tr>
					<td>${item.productName}</td>
					<td class="text-center">${item.productPrice}</td>
					<td class="text-center">${item.productQuantity}</td>
					<td class="text-center">${item.productQuantity * item.productPrice}&euro;</td>
					<td>
						<button class="btn btn-danger btn-sm" onclick="deleteItemFromCart(${item.productId})">Remove</button>
					</td>
				</tr>
			`;
			totalPrice += item.productPrice * item.productQuantity;
		})
		
		
		table += `
				<tr>
					<td colspan="5" class="text-right font-weight-bold m-5">
						Total price: ${totalPrice}&euro;
					</td>
				</tr>
			</table>`;
		$(".cart-body").html(table);
	}
	
	
}

// delete item
function deleteItemFromCart(pId) {
	let cart = JSON.parse(localStorage.getItem("cart"));

	let newCart = cart.filter(item => item.productId != pId);
	localStorage.setItem("cart", JSON.stringify(newCart));
	updateCart();
	
	showToast("This product is removed from cart");
}

window.onload = function() {
	updateCart();
};


function showToast(content) {
	$("#toast").addClass("display");
	$("#toast").html(content);
	setTimeout(() => {
		$("#toast").removeClass("display");
	}, 2000);
}











