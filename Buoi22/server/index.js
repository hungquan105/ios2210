const express = require('express');
const app = express();

var arrProducts = [
    new Product('iPhone', '999', 'smart phone'),
    new Product('iPhone', '999', 'smart phone'),
    new Product('iPhone', '999', 'smart phone')
];

function Product(name, price, description){
    this.NAME = name;
    this.PRICE = price;
    this.DESCRIPTION = description;
}

// route
app.get('/ios', function(req, res){
    // res.send('IOS');
    res.json(
        {
            name: 'IOS',
            duration: 90
        }
    );
});

app.get('/android', function(req, res){
    res.json(arrProducts);
});

app.get('/dangky/:ten/:tuoi', function(req, res){
    const ten = req.params.ten;
    const tuoi = req.params.tuoi;
    res.send(ten + ' - ' + tuoi + ' tuoi');
});

app.get('/phepcong/:so1/:so2', function(req, res){
    const so1 = req.params.so1;
    const so2 = req.params.so2;
    const tong = parseInt(so1) + parseInt(so2);
    const total = tong.toString();
    res.send(total);
});

app.listen(3000);