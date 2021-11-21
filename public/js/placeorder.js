function order() {

    var name = document.getElementById("fname").value;
    var phone = document.getElementById("phone-number").value;
    var e = document.getElementById("locations");
    var location = e.value;
    fetch('http://localhost:3002/order', {
        headers: {
            'Content-type': 'application/json'
        },
        method: 'POST',
        body: JSON.stringify({

            name: name,
            phone: phone,
            location: location

        })
    }).then((response) => response.json())
        .then((data) => {

            // document.getElementById("lblCartCoun1t").textContent = data.object.cartNumber;
        })
        .catch((error) => {
            alert(error);
        });


}