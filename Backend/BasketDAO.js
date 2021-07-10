
const conn = require("./conection");

module.exports = {

    addToBasket: function(req, res){
        const basketProduct = req.body;
        conn.query('INSERT INTO BASKET SET ?', [basketProduct],  function(err,results,_fields ){
            if(err) return res.send(err);
            res.status(200).json(results);
        });
    },

   

    getBasketFromUser: function(req,res){
        const id = req.query.userId;
        conn.query('select p.id as productId,p.name,p.price,p.image,p.productQuantity,b.color,b.size,b.quantity,o.id as userId from basket b join clothes_product p on b.clothesProductId = p.id join user_ o on b.userId = o.id where userId = ? order by b.dateTime desc',[id], function(err,results,_fields ){
            if(err) return res.status(500).send(err);
            res.status(200).json(results);
        });
    },

    removeFromBasket: function(req, res){
        const request = req.query
        console.log(request);
 
        conn.query('DELETE FROM BASKET WHERE userId = ? AND clothesProductId = ?', [request.userId, request.productId], function(err,results,fields ){
           if(err) return res.send(err);
           res.status(200).json({message: 'Uspjesno ste obrisali proizvod iz kosarice'});
       }); 
    
    },
    removeBasketUserByAdmin: function(req, res){
        const request = req.query
        console.log(request);
 
        conn.query('DELETE FROM BASKET WHERE userId = ? ', [request.userId], function(err,results,fields ){
           if(err) return res.send(err);
           res.status(200).json({message: 'Uspjesno ste izbrisali proizvod iz kosarice'});
       }); 
    
    },
    removeBasketProductByAdmin: function(req, res){
        const request = req.query
        console.log(request);
 
        conn.query('DELETE FROM BASKET WHERE clothesProductId = ? ', [request.productId], function(err,results,fields ){
           if(err) return res.send(err);
           res.status(200).json({message: 'Uspjesno ste obrisali proizvod iz kosarice'});
       }); 
    
    },

  
}