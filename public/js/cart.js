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


function UpdateFunction(quantity, productid,price)
{
    var total =Number(document.getElementById("totalcost").textContent);
    document.getElementById("placeorder").disabled = true;
   
    var Quantity = quantity;
    var Price=price;
    var ProductId=productid;
    fetch('http://localhost:3002/updateCart', {
        headers: {
            'Content-type': 'application/json'
        },
        method: 'POST',
        body: JSON.stringify({

            productId: ProductId,
            price:Price ,
            imageUrl: "",
            productName: "",
            quantity: Quantity
        })
    }).then((response) => response.json())
        .then((data) => {

            console.log(data);
            if(total!=data.object.GrandTotal)
            {
               document.getElementById("placeorder").disabled = false;
            }
            document.getElementById("lblCartCoun1t").textContent = data.object.cartNumber;
            document.getElementById("totalcost").textContent = data.object.GrandTotal;
        })
        .catch((error) => {
            alert(error);
        });
}

