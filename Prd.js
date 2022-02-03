const fs = require('fs');
const http = require('http');
const https = require('https');
const express = require('express');
const mysql = require("mysql2");
const path = require("path");
const bodyParser = require("body-parser");
const session = require('express-session');
const {
    v1: uuidv1,
    v4: uuidv4,
} = require('uuid');

const MemoryStore = require('memorystore')(session);
//I was not able to make this exrernal moudle to work
//const shoppingCart = require('./shoppingCart');
const app = express();
app.set('views', './');
app.set('view engine', 'ejs');
app.use(
    session(
        {
            secret: 'This is a secret',
            cookie: { maxAge: 864000 },
            saveUninitialized: true,
            resave: false,
            store: new MemoryStore({
                checkPeriod: 864000 // prune expired entries every 24h/100
            })
        }
    )
);
const hostname = 'dropsofocean.com';
const httpPort = 80;
const httpsPort = 443;

const httpsOptions = {
    cert: fs.readFileSync('./cert/dropsofocean.com.crt'),
    ca: fs.readFileSync('./cert/dropsofocean.com.ca-bundle'),
    key: fs.readFileSync('./cert/dropsofocean_com_key.txt')
};

app.use(bodyParser.json());
const httpServer = http.createServer(app);
const httpsServer = https.createServer(httpsOptions, app);

app.use((req, res, next) => {
    if (req.protocol === 'http') {
        res.redirect(301, `https://${req.headers.host}${req.url}`);
    }
    next();
});

/// rest of the application goes here:

/////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////
////////////////// Cart Object Defination Starts here ///////////////
var item = {

    ProductId: 0,
    ProductName: "",
    ImageUrl: "",
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
    },
    splice: function splice(index, a) {

        [].splice.call(this, index, a)
    }
}
Cart.Upsert = Upsert;
Cart.addToCart = addToCart;
Cart.updateTheCart = updateTheCart;
Cart.updateAllTotals = updateAllTotals;
Cart.IfItemExistInCart = IfItemExistInCart;
Cart.findItemInCartByIdThenRerunIndex = findItemInCartByIdThenRerunIndex;

// when user hit add item(+) or removes an item(-) or selects a quantity, the client shoud send (ProductId and quantity to the server), 
// so server can creat an item and add it/remove it/ or update the cart.

//first search the cart to see if the item exist
// Update
//if does not exist
// Add

function Upsert(prdId, quantity, price, productName, imageUrl) {

    // search array of items in the cart using prdId
    const iFoundTheItemUsingThePrdId = this.IfItemExistInCart(this, prdId);

    //Item does not exist in the cart then insert
    if (typeof iFoundTheItemUsingThePrdId === "undefined") {

        addToCart(prdId, quantity, price, productName, imageUrl, this);
        updateAllTotals(this);

    } else //update

    {
        updateTheCart(prdId, quantity, price, this);
        updateAllTotals(this);

    }


}

// Adding an item to the cart

function addToCart(prdId, quantity, price, productName, imageUrl, cart) {

    var createdItem = Object.create(item);
    createdItem.ProductId = prdId;
    createdItem.ProductName = productName;
    createdItem.ImageUrl = imageUrl;
    createdItem.Quantity = quantity;
    createdItem.Price = price;
    createdItem.QuantityTimesPrice = quantity * price;
    cart.addItem(createdItem);

}

// updating the cart

function updateTheCart(prdId, quantity, price, cart) {

    //  for delete -- if the quantity is zero, then delete
    //https://stackoverflow.com/questions/5767325/how-can-i-remove-a-specific-item-from-an-array

    if (quantity === 0) {

        const index = cart.findItemInCartByIdThenRerunIndex(cart, prdId);
        if (index > -1) {

            cart.splice(index, 1);

        }

    }
    //Update
    else {
        const iFoundTheItemUsingThePrdId = cart.findItemInCartByIdThenRerunIndex(cart, prdId);
        cart[iFoundTheItemUsingThePrdId].Quantity = quantity;
        cart[iFoundTheItemUsingThePrdId].Price = price;
        cart[iFoundTheItemUsingThePrdId].QuantityTimesPrice = Number(cart[iFoundTheItemUsingThePrdId].Price) * Number(cart[iFoundTheItemUsingThePrdId].Quantity);
        console.log(cart[iFoundTheItemUsingThePrdId].QuantityTimesPrice);

    }




}

function updateAllTotals(cart) {
    cart.totalNumberOfItems = 0;
    cart.GrandTotal = 0;
    for (var itemIndex = 0; itemIndex < cart.length; itemIndex++) {

        cart.totalNumberOfItems += Number(cart[itemIndex].Quantity);
        cart.GrandTotal += cart[itemIndex].QuantityTimesPrice;

    }


}

function IfItemExistInCart(cart, prductId) {

    for (var itemIndex = 0; itemIndex < cart.length; itemIndex++) {

        if (cart[itemIndex].ProductId == prductId) {

            return 1;
        }
    }
}

function findItemInCartByIdThenRerunIndex(cart, prductId) {

    for (var itemIndex = 0; itemIndex < cart.length; itemIndex++) {

        if (cart[itemIndex].ProductId == prductId) {

            return itemIndex;
        }

    }
    return -1;
}

/////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////
////////////////// Cart Object Defination Ends here ///////////////

var connection = mysql.createConnection(
    {
        host: "localhost",
        user: "********",
        password: "*********",
        database: "*********",
        multipleStatements: true

    }
);

connection.connect((err) => {
    if (!err) {
        console.log("successfully connected");
    }
    else {
        console.log("failed- ha ha ");
    }
})


//static files
app.use(express.static(path.join(__dirname, 'public')));

app.use(express.static(path.join(__dirname + 'public/css')));
app.use(express.static(path.join(__dirname + 'public/js')));
app.use(express.static(path.join(__dirname + 'public/img')));
app.use(express.static(path.join(__dirname + 'public/manifest.json')));

// app.use('/css', express.static(__dirname + 'public/css'));
// app.use('/js', express.static(__dirname + 'public/js'));
// app.use('/img', express.static(__dirname + 'public/img'));

app.set('view engine', 'ejs');
app.set('views', path.join(__dirname, '/views'));

app.get('', (req, res) => {
    connection.query("SELECT * from products", (err, rows) => {

        if (!err) {

            if (typeof req.sessionStore.Cart === "undefined") {
                res.render('home', { products: rows, count: 0 });
            }
            else {
                res.render('home', { products: rows, count: req.sessionStore.Cart.totalNumberOfItems });
            }
        }
        else {
            console.log(err);
        }

    })
});
app.get('/product/:prdId', (req, res) => {
    var result;
    var itemsInCart;
    //https://stackoverflow.com/questions/25187903/what-do-curly-braces-around-javascript-variable-name-mean
    const { prdId } = req.params;
    let sql = "SELECT * from products where Id=" + prdId;
    connection.query(sql, (err, rows) => {


        if (!err) {
            result = rows;
            console.log(rows);
        }
        else {
            console.log(err);
        }
        if (typeof req.sessionStore.Cart != "undefined") {


            res.render('product', { product: result[0], itemsInCart: req.sessionStore.Cart.totalNumberOfItems });

        }
        else {
            res.render('product', { product: result[0], itemsInCart: 0 });

        }

    })



})

app.get('/cart', (req, res) => {

    if (typeof req.sessionStore.Cart === "undefined") {
        res.render('cart', { user: null, count: 0, totalcost: 0 });
    }
    else {
        var cart = req.sessionStore.Cart;
        var rows = [];
        for (var itemIndex = 0; itemIndex < cart.length; itemIndex++) {

            rows.push(cart[itemIndex]);
        }
        res.render('cart', { user: rows, count: cart.totalNumberOfItems, totalcost: cart.GrandTotal });

    }

})

app.get('/placeorder', (req, res) => {

    connection.query("select city, name,id   from delivery_location", (err, rowss) => {

        if (!err) {
            if (typeof req.sessionStore.Cart === "undefined") {

                res.render('placeorder', { cart: [], locations: [], GrandTotal: 0 })
            }
            else {
                var cart = req.sessionStore.Cart;
                var rows = [];
                for (var itemIndex = 0; itemIndex < cart.length; itemIndex++) {
                    rows.push(cart[itemIndex]);
                }
                console.log(req.sessionStore.Cart)
                console.log(rowss)
                res.render('placeorder', { cart: rows, locations: rowss, GrandTotal: req.sessionStore.Cart.GrandTotal })
            }
        }
    });


});



app.post('/order', (req, res) => {

    if (typeof req.sessionStore.Cart != "undefined") {

        var cart = req.sessionStore.Cart;
        var items = [];
        var name = req.body.name;
        var num = req.body.phone;
        var loc = req.body.location;
        var date = req.body.date;
        var inserted_id = 0;
        for (var itemIndex = 0; itemIndex < cart.length; itemIndex++) {
            items.push(cart[itemIndex]);
        }
        let uuid = uuidv1();
        // let sql = "insert into carttable(UserId,ImageUrl,ProductName,ProductPrice,ProductId,ProductTotalPrice,Quantity) values ('Darshan123','ImageUrl', 'name','price',1,'10','1')";

        /////--------------------------------------------------------------------------------
        ////----------------------------------------------------------------------------------
        ///---------------Problem running queries sequentially, maybe the link below helps---------------
        //https://stackoverflow.com/questions/45936021/node-mysql-sequential-query-execution
        let sql = "INSERT INTO orders (customer_name,delivery_loc_id, total,created_dt,updated_dt,phone_number,uuid) VALUES ('" + name + "'," + loc + "," + cart.GrandTotal + ",'" + date + "','" + date + "'," + num + ", '" + uuid + "'" + ")";
        console.log(sql);

        connection.query(sql, (err, rowss) => {


            if (!err) {
                inserted_id = rowss.insertId;
                console.log("hurray");

                items.forEach(item => {
                    var sql1 = "INSERT INTO product_order (prd_id, order_id, quantity) VALUES ('" + item.ProductId + "'," + inserted_id + ",'" + item.Quantity + "'" + ")";
                    connection.query(sql1, (err1, rows) => {
                        if (!err1) {
                            console.log("hurray");
                            res.json(
                                {
                                    "redirectUrl": "localhost:" + port + "/orderComplete",
                                    "uniqeId": uuid
                                }
                            );
                        } else {
                            console.log(err1)
                        }

                    });

                });

            } else {
                console.log(err);
            }


            console.log("hurray--outside");


        });

        /////////////////////--------end of  the problematic block--------------------

    }
});

app.post('/delete', (req, res) => {
    let UserId = req.body.UserId;
    let sql = "delete from carttable where CartId=" + UserId;
    connection.query(sql, (err, rows) => {

        if (!err) {

            res.json({ success: true })
        }
        else {
            console.log(err);
        }
        // console.log(rows);
    })
})

app.post('/updateCart', (request, response) => {

    if (typeof request.sessionStore.Cart === "undefined") {
        request.sessionStore.Cart = Object.create(Cart);
        request.sessionStore.Cart.Upsert(request.body.productId, request.body.quantity, request.body.price, request.body.productName, request.body.imageUrl);
    }
    else {

        request.sessionStore.Cart.Upsert(request.body.productId, request.body.quantity, request.body.price, request.body.productName, request.body.imageUrl);

    }
    var object = { "cartNumber": request.sessionStore.Cart.totalNumberOfItems, "GrandTotal": request.sessionStore.Cart.GrandTotal }

    response.json({ object });
})

app.get('/orderComplete/:uniqeId', (req, res) => {

    const { uniqeId } = req.params;

    res.render('order', { "orderId": uniqeId });

});


/////////////////////////////////////////////
/////////////////////////////////////////////
/////////////////////////////////////////////



httpServer.listen(httpPort, hostname);
httpsServer.listen(httpsPort, hostname);

