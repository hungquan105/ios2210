const express = require('express');
const app = express();

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
connectPool();
app.get('/', function(req,res){
    // connectPool();
    pool.query(`select * from "Accounts"`, function(err, result){
        res.json(result.rows);
        console.log(result);
        // pool.end();
    });
});

app.listen(3000);