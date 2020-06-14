// Add products to cart
function addToCart(pId, pName, price) {

	let cart = localStorage.getItem("cart");

	if (cart == null) {
		// no cart yet
		let products = [];
		let product = {
			productId : pId,
			productName : pName,
			prodcutQuantity : 1,
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
					item.prodcutQuantity = oldProduct.prodcutQuantity;
				}
			})
			
			localStorage.setItem("cart", JSON.stringify(pCart));
			console.log("Product quantity has increased");
		} else {
			let product = {
					productId : pId,
					productName : pName,
					prodcutQuantity : 1,
					productPrice : price
				};
				
			pCart.push(product);
			localStorage.setItem("cart", JSON.stringify(pCart));
			console.log("Product is added successfully");
		}

	}
}