
const conn = require("./conection");


function saveOrderItem(request){
   return new Promise(function(resolve,reject){
       conn.query('INSERT INTO clothes_order SET ?', [request], function(err,results,_fields){
           if(err) return reject(err);
           resolve(results.insertId);
       })
   }) 
}
function deleteFromBasket(request){
    return new Promise(function(resolve,reject){
        conn.query('DELETE FROM BASKET WHERE userId = ? AND clothesProductId = ?', [request.userId, request.clothesProductId],
        function(err,results,_fields){
            if(err) return reject(err);
            resolve(results.insertId);
            
        })
    })
}
  function updateProductQuantity(request){
    return new Promise(function(resolve,reject){
        conn.query("UPDATE clothes_product SET productQuantity = productQuantity - ? WHERE id = ?", [request.quantity,request.clothesProductId],
        function(err,results,_fields){
            if(err) return reject(err);
            resolve({message:`Uspjesno ste kupili '${request.quantity}' proizvoda`});
            
        }); 
    });
} 

function updateSoldInt(request){
  return new Promise(function(resolve,reject){
      conn.query("update clothes_product set soldInd = '1' where productQuantity = 0 and id = ?", [request.clothesProductId],
      function(err,results,_fields){
          if(err) return reject(err);
          resolve(results.insertId);
          
      }); 
  });
} 


module.exports = {
  saveProductToOrder: async function(req,res){
    const request = req.body;
    try{
       const orderId = await saveOrderItem(request);
       console.log(orderId);
       const deletedProduct = await deleteFromBasket(request);
       console.log(deletedProduct);
       const message = await updateProductQuantity(request);
       console.log(message);
       const message3 = await updateSoldInt(request);
       console.log(message3);
    }
    catch(err){
        res.status(500).send(err);
    }
  },


   
    getAll: function(_req,res){
        conn.query('SELECT * FROM clothes_product order by create_date desc', function(err,results,_fields ){
            if(err) return res.send(err);
            res.status(200).json(results);
        });
    },

    getBestProducts: function(_req,res){
      conn.query('SELECT * FROM clothes_product order by rating desc limit 8', function(err,results,_fields ){
          if(err) return res.send(err);
          res.status(200).json(results);
      });
  },

    getAllProductsForAdmin: function(_req,res){
      conn.query('SELECT p.*,c.cat_name, b.nameBrand, t.type FROM clothes_product p join clothes_category c on p.clothesCategoryId = c.id \
       join brand b on p.brandId = b.id join type_of_clothes t on p.collectionId = t.id  order by p.create_date desc', function(err,results,_fields ){
          if(err) return res.send(err);
          res.status(200).json(results);
      });
  },

    getBasketProductForAdmin: function(req,res){
      conn.query('SELECT * FROM  basket', function(err,results,_fields ){
        if(err) return res.send(err);
        res.status(200).json(results);
    });
    },

    getOrderProductForAdmin: function( req, res){
      conn.query('SELECT * FROM  clothes_order', function(err,results,_fields ){
        if(err) return res.send(err);
        res.status(200).json(results);
    });
    },

    getSize: function(req, res){
        const id = req.query.productId;
        conn.query('select c.id,c.value from clothes_product as a join product_size as b on a.id = b.productId \
        join clothes_size as c on b.sizeId = c.id where a.id = ?',
        [id],function(err,results,_fields ){
            if(err) return res.send(err);
            res.status(200).json(results);
        })
    },

   insertSize: function( req,res){
    const productId = req.body.productId;
    const sizes = req.body.sizes;
 
    let query = `INSERT INTO product_size (productId, sizeId) VALUES `
      if(sizes.length == 1){
        query += `(${productId}, ${sizes[0]})`
        
      }
      if(sizes.length == 2){
        query += `(${productId}, ${sizes[0]}), (${productId}, ${sizes[1]})`
      }
      if(sizes.length == 3){
        query += `(${productId}, ${sizes[0]}), (${productId}, ${sizes[1]}), (${productId}, ${sizes[2]}) `
      }
      if(sizes.length == 4){
        query += `(${productId}, ${sizes[0]}), (${productId}, ${sizes[1]}), (${productId}, ${sizes[2]}), (${productId}, ${sizes[2]}) `
      }
     
      console.log(productId)
      conn.query(query, [productId, sizes],  function(err,results,_fields ){
        if(err) return res.send(err);
        res.status(200).json(results.insertId);
         

    });
    },

    deleteProductSize: function(req, res){

      const request = req.query;

      console.log(request);
      conn.query(`delete from product_size where productId = ? and sizeId in (${request.sizeIds.toString()})`, [request.productId, request.sizeIds],  function(err,results,_fields ){
        if(err) return res.send(err);
        res.status(200).json(results);
         
      });
    },

  
    searchProducts: function(req,res){
     const searchProduct = req.body;
     let brandIds = [];
     let categoryIds = [];
     let collectionIds = [];
     let query = " SELECT * FROM CLOTHES_PRODUCT WHERE 1=1 "
     if(searchProduct.category1){
       categoryIds.push(1);
     }
     if(searchProduct.category2){
        categoryIds.push(2);
      }
     if(searchProduct.category3){
        categoryIds.push(3);
      }
     if(searchProduct.category4){
        categoryIds.push(4);
      }
      if(searchProduct.category5){
        categoryIds.push(5);
      }
      if(searchProduct.brand1){
        brandIds.push(1);
      }
      if(searchProduct.brand2){
        brandIds.push(2);
      }
      if(searchProduct.brand3){
        brandIds.push(3);
      }
      if(searchProduct.brand4){
        brandIds.push(4);
      }
      if(searchProduct.brand5){
        brandIds.push(5);
      }
      if(searchProduct.brand6){
        brandIds.push(6);
      }
      if(searchProduct.collection1){
        collectionIds.push(1);
      }
      if(searchProduct.collection2){
        collectionIds.push(2);
      }
      if(searchProduct.collection3){
        collectionIds.push(3);
      }
      if(searchProduct.collection4){
        collectionIds.push(4);
      }
      if(searchProduct.price1){
          query += 'AND price <= 50.00';
      }
      if(searchProduct.price2){
          query += 'AND price <= 100.00';
      }
      if(searchProduct.price3){
        query += 'AND price <= 200.00';
      }
      if(searchProduct.price4){
        query += 'AND price <= 300.00';
      }

      if(categoryIds.length > 0){
        query += `AND clothesCategoryId in (${categoryIds.toString()})`;
      }
      if(brandIds.length > 0){
          query += `AND brandId in (${brandIds.toString()})`;
      }
      if(collectionIds.length > 0){
        query += `AND collectionId in (${collectionIds.toString()})`;
    }

     conn.query(query, function(err,results,fields ){
        if(err) return res.send(err);
        res.status(200).json(results);
    });
    
},
 

   

   getOrderFromUser: function(req,res){
          const userId = req.query.userId;
        conn.query('select p.name,p.price,p.image,o.color,o.size,o.quantity,u.* from clothes_order o join clothes_product p on o.clothesProductId = p.id join user_ u on u.id = o.userId where userId = ? order by o.orderDate desc', [userId], function(err,results,_fields ){
            if(err) return res.send(err);
            res.status(200).json(results);
        });

      },
   deleteOrderUserByAdmin: function(req, res){
      const request = req.query;
      conn.query('DELETE FROM clothes_order WHERE userId = ? ', [request.userId], function(err,results,fields ){
        if(err) return res.send(err);
        res.status(200).json({ message: 'You have successfully deleted the product from order'});
    }); 
   },

   deleteOrderProductByAdmin: function(req, res){
     const request = req.query;
    conn.query('DELETE FROM clothes_order WHERE clothesProductId = ? ', [request.productId], function(err,results,fields ){
      if(err) return res.send(err);
      res.status(200).json({ message: 'You have successfully deleted the product from order'});
  }); 

   },

    addOrUpdateProductForAdmin:  function(req,res){
    const product = req.body;
  
    var sql = "SET @id = ?;SET @name = ?;SET @color = ?;SET @color_2 = ?;SET @price = ?;SET @image = ?;SET @image_2 = ?;SET @create_date = ?; \
     SET @soldInd = ?; SET @clothesCategoryId = ?; SET @brandId = ?; SET @collectionId = ?; SET @description = ?; SET @details = ?; \
    SET @productQuantity = ?; SET @rating = ?; \
    CALL ProductAddOrEdit(@id,@name,@color,@color_2,@price,@image,@image_2,@create_date,@soldInd,@clothesCategoryId, \
      @brandId,@collectionId,@description,@details,@productQuantity,@rating);";

      conn.query(sql, [product.id, product.name, product.color, product.color_2, product.price, product.image,
      product.image_2, product.create_date, product.soldInd, product.clothesCategoryId, product.brandId, product.collectionId, product.description, 
    product.details, product.productQuantity, product.rating],
        function(err,results, fields){

        if(err) return res.status(500).send(err);
        res.status(200).json(results[16]);
        
    });
    
  },

  deleteProductAdmin: function(req, res){
    const id = req.query.id;
        console.log(id);
    conn.query('DELETE FROM clothes_product WHERE id = ?', [id], function(err, _results,_fields ){
       if(err) return res.status(500).send(err);
       res.status(200).json({ message: 'You have successfully deleted the product'});
   }); 
  }

   
}
