

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
    fetch('http://localhost:3002/delete', {
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



    var productId = document.getElementById("product-id");
    var productPrice = document.getElementById("product-price");
    var productQuantitySelect = document.getElementById("quantity");
    var Quantity = productQuantitySelect.options[productQuantitySelect.selectedIndex].text;
    var total = Quantity * productPrice;
    fetch('http://localhost:3002/updateCart', {
        headers: {
            'Content-type': 'application/json'
        },
        method: 'POST',
        body: JSON.stringify({

            ProductId: productId,
            price: productPrice,
            quality: Quantity,
            total: total,
            Name: ''

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
    fetch('http://localhost:3002/insert', {
        headers: {
            'Content-type': 'application/json'
        },
        method: 'POST',
        body: JSON.stringify({
            cartid: null,
            imageurl: a,
            price: b,
            quality: c,
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