const express = require('express');
const app = express();

// body
const bodyParser = require('body-parser');
app.use(bodyParser.urlencoded({extended:false}));

// pg
const { Pool } = require('pg');
var pool = null;

function connectPool(){
    pool = new Pool({
        user: 'postgres',
        host: 'localhost',
        database: 'ios2210',
        password: '123',
        port: 5432,
    });
}

app.get('/', function(req,res){
    connectPool();
    pool.query(`select * from "Accounts"`, function(err, result){
        res.json(result.rows);
        console.log(result);
        pool.end();
    });
});

app.post('/login', function(req,res){
    connectPool();
    const {username, password} = req.body;
    pool.query(`select * from "Accounts"
    where "USERNAME" = '${username}' and "PASSWORD" = MD5('${password}')`,
    function(err, result){
        if (result.rowCount == 1) {
            res.json({result : true, message : 'Dang nhap thanh cong', data : result.rows});
        } else {
            res.json({result : false, message : 'Dang nhap that bai', data : []});
        }
    });
    pool.end();
});

app.post('/register', function(req,res){
    connectPool();
    const {username, password, email, phonenumber} = req.body;
    pool.query(`select * from "Accounts"
    where "USERNAME" = '${username}'`,
    function(err, result){
        console.log(result.rowCount);
        if (result.rowCount == 1) {
            res.json({result : false, message : 'Tai khoan da ton tai', data : []});
            pool.end();
        } else {
            let query = `insert into "Accounts" ("USERNAME", "PASSWORD", "EMAIL", "PHONENUMBER")
            values ('${username}', MD5('${password}'), '${email}', '${phonenumber}')`
            connectPool();
            pool.query(query, function(err, result){
                res.json({result : true, message : 'Dang Ky Thanh Cong', data : []});
            });
            pool.end()
        };
    });
    pool.end();
});

app.listen(3000);