
const conn = require("./conection");
const bcrypt = require('bcrypt');

module.exports = {
    register: async function(req, res){
        const salt = await bcrypt.genSalt();
        const hashPassword = await bcrypt.hash(req.body.pasword, salt);
        const user = {
            id: req.body.id,
            firstName: req.body.firstName,
            lastName: req.body.lastName,
            email: req.body.email,
            adress: req.body.adress,
            username: req.body.username,
            pasword: hashPassword,
            role: req.body.role,
            gender: req.body.gender
        }
        conn.query('INSERT INTO USER_ SET ?', [user],  function(err,results,fields ){
            if(err) return res.status(500).send(err);
            res.status(200).json(results.insertId);
        });
    },

    login: async function (req, res) {
        
      try{
        const user = req.body;
        const validPassword = await bcrypt.compare(req.body.pasword, user.pasword);
            conn.query('SELECT * FROM USER_ WHERE username = ? AND pasword = ?', [user.username, validPassword], function (err, results, fields) {
                if (err) return res.status(500).send(err);
                res.status(200).json(results[0]);
            });
          }
      catch(err){
          res.send(err);
      }
    },

    getUsersForAdmin: function(req,res){
        conn.query('SELECT * FROM USER_ order by firstName ', function(err,results, fields){
            if(err) return res.status(500).send(err);
            res.status(200).json(results);
        });
    },

    updateUserForAdmin: async function(req,res){
        const salt = await bcrypt.genSalt();
        const hashPassword = await bcrypt.hash(req.body.pasword, salt);
        const user = {
            id: req.body.id,
            firstName: req.body.firstName,
            lastName: req.body.lastName,
            email: req.body.email,
            adress: req.body.adress,
            username: req.body.username,
            pasword: hashPassword,
            role: req.body.role,
            gender: req.body.gender
        }
    var sql = "SET @id = ?;SET @firstName = ?;SET @lastName = ?;SET @username = ?;SET @pasword = ?;SET @email = ?;SET @adress = ?;SET @role = ?; SET @gender = ?;\
        CALL User_AddOrEdit(@id,@firstName,@lastName,@username,@pasword,@email,@adress,@role,@gender);";
        
        conn.query(sql, [user.id, user.firstName, user.lastName, user.username, user.pasword, user.email, user.adress, user.role, user.gender ],
            function(err,results, fields){
            if(err) return res.status(500).send(err);
            res.status(200).json(results[8]);
        });
      },
      
      deleteUser: function(req,res){
        const id = req.query.id;
        
     conn.query('DELETE FROM USER_ WHERE id = ?', [id], function(err, _results,_fields ){
        if(err) return res.status(500).send(err);
        res.status(200).json({ message: 'Uspjesno ste obrisali usera'});
    }); 
    },
      
     
      
     

     
    }


