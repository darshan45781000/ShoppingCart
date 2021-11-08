function deleteItemFromCart(productId) {

    var Quantity = 0;
    fetch('http://localhost:3002/updateCart', {
        headers: {
            'Content-type': 'application/json'
        },
        method: 'POST',
        body: JSON.stringify({

            productId: productId,
            price: -1,
            imageUrl: "",
            productName: "",
            quantity: Quantity
        })
    }).then((response) => response.json())
        .then((data) => {

            console.log("success");
            document.getElementById("lblCartCoun1t").textContent = data.cartNumber;
        })
        .catch((error) => {
            alert(error);
        });


}
