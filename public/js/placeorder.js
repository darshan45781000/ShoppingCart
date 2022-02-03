function order() {

    var name = document.getElementById("fname").value;
    var phone = Number(document.getElementById("phone-number").value);
    var e = document.getElementById("locations").value;
    var currentdate = new Date();
    var datetime = currentdate.getFullYear() + "-" + currentdate.getMonth()
        + "-" + currentdate.getDate();
    var location = Number(e);


    fetch('../order', {
        headers: {
            'Content-type': 'application/json'
        },
        method: 'POST',
        body: JSON.stringify({

            name: name,
            phone: phone,
            location: location,
            date: datetime

        })
    }).then((response) => response.json())
        .then((data) => {

            console.log(data);
            document.location = "../orderComplete/" + data.uniqeId;
        })
        .catch((error) => {
            alert(error);
        });


}