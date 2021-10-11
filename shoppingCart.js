// this code can be put in server side
//
var shoppingCart = function () {
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
        totalNumberOfItems: 0,
        GrandTotal: 0,
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

    function Upsert(prdId, quantity, price) {

        // search array of items in the cart using prdId

        const iFoundTheItemUsingThePrdId = this.find(item => item.prdId === prdId);
        //Item does not exist in the cart then insert
        if (typeof iFoundTheItemUsingThePrdId !== "undefined") {

            addToCart(prdId, quantity, price);
            updateAllTotals();

        } else //update

        {
            updateTheCart(prdId, quantity, price);
            updateAllTotals();

        }


    }







    // Adding an item to the cart

    function addToCart(prdId, quantity, price) {

        var createdItem = Object.create(item);
        createdItem.ProductId = prdId;
        createdItem.Quantity = quantity;
        createdItem.Price = price;
        createdItem.QuantityTimesPrice = quantity * Price;
        this.addItem(createdItem);

    }

    // updating the cart

    function updateTheCart(prdId, quantity, price) {

        //  for delete -- if the quantity is zero, then delete
        //https://stackoverflow.com/questions/5767325/how-can-i-remove-a-specific-item-from-an-array

        if (quantity === 0) {

            const index = this.indexOf(this.find(item => item.prdId === prdId));
            if (index > -1) {
                this.splice(index, 1);
            }
            //Update
            else {
                const iFoundTheItemUsingThePrdId = this.find(item => item.prdId === prdId);
                iFoundTheItemUsingThePrdId.Quantity = quantity;
                iFoundTheItemUsingThePrdId.Price = price;
                iFoundTheItemUsingThePrdId.QuantityTimesPrice = iFoundTheItemUsingThePrdId.Price.quantity;


            }

        }



    }

    function updateAllTotals() {
        this.totalNumberOfItems = 0;
        this.GrandTotal = 0;
        for (let i of this) {
            this.totalNumberOfItems = + i.Quantity;
            this.GrandTotal = i.QuantityTimesPrice;
        }

    }
    Cart.Upsert = Upsert;
    Cart.addToCart = addToCart;
    Cart.updateTheCart = updateTheCart;
    Cart.updateAllTotals = updateAllTotals;
    return {
        Cart: Cart
    }
}();

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