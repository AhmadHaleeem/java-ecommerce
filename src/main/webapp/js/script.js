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
		console.log("Product is added for the first time");

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
			console.log("Product quantity has increased");
		} else {
			let product = {
					productId : pId,
					productName : pName,
					productQuantity : 1,
					productPrice : price
				};
				
			pCart.push(product);
			localStorage.setItem("cart", JSON.stringify(pCart));
			console.log("Product is added successfully");
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
					<td class="text-center">${item.productQuantity * item.productPrice}</td>
					<td>
						<button class="btn btn-danger btn-sm">Remove</button>
					</td>
				</tr>
			`;
			totalPrice += item.productPrice * item.productQuantity;
		})
		
		
		table += `
				<tr>
					<td colspan="5" class="text-right font-weight-bold m-5">
						Total price: ${totalPrice}
					</td>
				</tr>
			</table>`;
		$(".cart-body").html(table);
	}
	
	
}


window.onload = function() {
	updateCart();
};










