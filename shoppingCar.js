// this code can be put in server side
//
function shoppingCart() {
    // Defenition of an item
    var item = {

        ProductId: 0,
        Price: 0,
        Quantity: 0,
        QuantityTimesPrice: 0 //this can be drived from Price* Quantity
    }


    // empty cart, which will contian array of items, see notes to undrestand that this cart object will work as array of objects

    let Cart = {
        length: 0,

        addItem: function addItem(item) {
            // obj.length is automatically incremented
            // every time an element is added.
            [].push.call(this, item)
        }
    }


    // when user hit add item(+) or removes an item(-) or selects a quantity, the client shoud send (ProductId and quantity to the server), 
    // so server can creat an item and add it/remove it/ or update the cart.

    //first search the cart to see if the item exist
    // Update
    //if does not exist
    // Add

    function Upsert(prdId, quantity) {

        // search array of items in the cart using prdId

        const iFoundTheItemUsingThePrdId = Cart.find(item => item.prdId === prdId);
        //Item does not exist in the cart then insert
        if (typeof iFoundTheItemUsingThePrdId !== "undefined") {

            addToCart(prdId, quantity);

        } else //update

        {
            updateTheCart(prdId, quantity);

        }


    }







    // Adding an item to the cart

    function addToCart(prdId, quantity) {

        var createdItem = Object.create(item);
        createdItem.ProductId = prdId;
        createdItem.Quantity = quantity;
        //probably use db to fetch price?
        createdItem.Price = "fetch from db";
        createdItem.QuantityTimesPrice = quantity * Price;
        Cart.addItem(createdItem);

    }

    // updating the cart

    function updateTheCart(prdId, quantity) {

        // if the quantity is zero, then delete
        //https://stackoverflow.com/questions/5767325/how-can-i-remove-a-specific-item-from-an-array

        if (quantity === 0) {

            const index = Cart.indexOf(Cart.find(item => item.prdId === prdId));
            if (index > -1) {
                Cart.splice(index, 1);
            } else {
                const iFoundTheItemUsingThePrdId = Cart.find(item => item.prdId === prdId);
                iFoundTheItemUsingThePrdId.Quantity = quantity;
                iFoundTheItemUsingThePrdId.Price = "fetch from db?";
                iFoundTheItemUsingThePrdId.QuantityTimesPrice = iFoundTheItemUsingThePrdId.Price.quantity;


            }

        }



    }
}

module.exports = shoppingCart;





//Notes:
// used this way of treating Object as arrays to create Cart object: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/push
// let obj = {
//     length: 0,

//     addElem: function addElem(elem) {
//         // obj.length is automatically incremented
//         // every time an element is added.
//         [].push.call(this, elem)
//     }
// }

// // Let's add some empty objects just to illustrate.
// obj.addElem({})
// obj.addElem({})
// console.log(obj.length)
// // → 2