

window.onload=function(){


const toggleButton = document.getElementsByClassName('toggle-button')[0]
const navbarLinks = document.getElementsByClassName('navbar-links')[0]




toggleButton.addEventListener('click', () => {
  navbarLinks.classList.toggle('active')
})



}

function values(a)
{
    var b=parseInt(a);
    fetch('http://localhost:3001/delete',{
   headers:{
       'Content-type':'application/json'
   },
        method:'POST',
        body: JSON.stringify({
            UserId: b
        })
    }).then((response)=> response.json())
    .then((data)=>{
        console.log("success");
    })
    .catch((error)=>{
        alert(error);
    });
   
}

function Send(aa,bb,cc,dd,ee)
{
    var total=parseInt(bb.value) * parseInt(cc.value);
    total=total.toString();
    fetch('http://localhost:3001/insert',{
   headers:{
       'Content-type':'application/json'
   },
        method:'POST',
        body: JSON.stringify({
            cartid:null,
            imageurl: aa.value,
            price: bb.value,
            quality: cc.value,
            total: total,
            Name:dd.value,
            ProductId: ee.value
        })
    }).then((response)=> response.json())
    .then((data)=>{
     var a1=   document.getElementById("lblCartCount").innerText;
     var b=parseInt(a1)+1;
     document.getElementById("lblCartCount").innerHTML=b.toString();
        console.log("success");
    })
    .catch((error)=>{
        alert(error);
    });
}