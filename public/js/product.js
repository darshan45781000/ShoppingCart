

window.onload = function () {


    const toggleButton = document.getElementsByClassName('toggle-button')[0]
    const navbarLinks = document.getElementsByClassName('navbar-links')[0]




    toggleButton.addEventListener('click', () => {
        navbarLinks.classList.toggle('active')
    })



}


if ('serviceWorker' in navigator) {
    navigator.serviceWorker.register('/serviceworker.js')
        .then((reg) => {
            console.log('Service worker registered -->', reg);
        }, (err) => {
            console.error('Service worker not registered -->', err);
        });
}


function values(a) {
    var b = parseInt(a);
    fetch('../delete', {
        headers: {
            'Content-type': 'application/json'
        },
        method: 'POST',
        body: JSON.stringify({
            UserId: b
        })
    }).then((response) => response.json())
        .then((data) => {
            console.log("success");
        })
        .catch((error) => {
            alert(error);
        });

}

function updateCart() {

    var productId = document.getElementById("product-id").value;
    var productPrice = document.getElementById("product-price").value;
    var imageUrl = document.getElementById("image-url").value;
    var productName = document.getElementById("product-name").value;
    var productQuantitySelect = document.getElementById("quantity");
    var Quantity = productQuantitySelect.options[productQuantitySelect.selectedIndex].text;
    var total = Quantity * productPrice;
    fetch('../updateCart', {
        headers: {
            'Content-type': 'application/json'
        },
        method: 'POST',
        body: JSON.stringify({

            productId: productId,
            price: productPrice.replace('$', ''),
            imageUrl: imageUrl,
            productName: productName,
            quantity: Quantity
        })
    }).then((response) => response.json())
        .then((data) => {

            document.getElementById("lblCartCoun1t").textContent = data.object.cartNumber;
        })
        .catch((error) => {
            alert(error);
        });


}



function Send(aa, bb, cc, dd, ee) {
    a = aa.value;
    b = bb.value;
    c = cc;
    d = dd.value;
    e = ee.value;
    console.log("hi");
    console.log(aa);
    console.log("helo");
    var total = parseInt(bb.value) * parseInt(cc);
    total = total.toString();
    fetch('./insert', {
        headers: {
            'Content-type': 'application/json'
        },
        method: 'POST',
        body: JSON.stringify({
            cartid: null,
            imageurl: a,
            price: b,
            quantity: c,
            total: total,
            Name: d,
            ProductId: e
        })
    }).then((response) => response.json())
        .then((data) => {
            var a1 = document.getElementById("lblCartCoun1t").innerText;
            var b = parseInt(a1) + 1;
            document.getElementById("lblCartCoun1t").innerHTML = b.toString();
            console.log("success");
        })
        .catch((error) => {
            alert(error);
        });
}