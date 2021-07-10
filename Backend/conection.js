var mySql = require('mysql');

var connection = mySql.createConnection({
    host:"localhost",
    user:"root",
    password:"root",
    database:"clothes",
    port:"8889",
    multipleStatements: true
});

connection.connect(function(err){
    if(err) throw err;
    console.log('Connected!');
})

module.exports = connection;