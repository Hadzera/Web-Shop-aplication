
var express = require('express');
var bodyParser = require('body-parser');
var app = express();
var PORT = 3000;
var ProductDao = require('./ProductDAO');
var UserDao = require('./UserDAO');
var BasketDAO = require('./BasketDAO');




app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended:true}));
app.use((req,res, next) => {
    res.append('Access-Control-Allow-Origin', ['*']); //* -- znaci moze da me zove bilo koji frontend jer je *
    res.append('Access-Control-Allow-Methods', 'GET,PUT,POST,DELETE,OPTIONS');
    res.append('Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content-Type, Accept, X-Auth-Token');
    next();
});



app.get("/product/all", ProductDao.getAll);
app.get("/products/best", ProductDao.getBestProducts);
app.get("/product/all/admin", ProductDao.getAllProductsForAdmin);
app.get("/admin/basket/product", ProductDao.getBasketProductForAdmin);
app.get("/admin/order/product", ProductDao.getOrderProductForAdmin);
app.post("/product/search", ProductDao.searchProducts);
app.get("/product/size", ProductDao.getSize );


app.post("/user/register", UserDao.register);
app.post("/user/login", UserDao.login);

app.post("/product/add-to-basket", BasketDAO.addToBasket);
app.get("/basket/products", BasketDAO.getBasketFromUser);
app.post("/order/products", ProductDao.saveProductToOrder);


app.delete("/basket/remove", BasketDAO.removeFromBasket);
app.delete("/basket/admin/remove", BasketDAO.removeBasketUserByAdmin)
app.get("/profile/orders", ProductDao.getOrderFromUser);

app.get("/admin/users", UserDao.getUsersForAdmin);
app.put("/admin/update-user", UserDao.updateUserForAdmin);
app.delete("/admin/delete/user", UserDao.deleteUser);
app.put("/admin/product/size", ProductDao.insertSize);
app.delete("/admin/product/delete-size", ProductDao.deleteProductSize);
app.put("/admin/add-update/product", ProductDao.addOrUpdateProductForAdmin);
app.delete("/admin/delete/product", ProductDao.deleteProductAdmin);
app.delete("/order/delete/user", ProductDao.deleteOrderUserByAdmin);
app.delete("/basket/delete/product/byadmin",BasketDAO.removeBasketProductByAdmin );
app.delete("/order/delete/product/byAdmin", ProductDao.deleteOrderProductByAdmin);




app.listen(PORT, function(){
    console.log('App is started on port: ' + PORT);
})