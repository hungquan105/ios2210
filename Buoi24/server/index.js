const express = require('express');
const app = express();

const bodyParser = require('body-parser');
app.use(bodyParser.urlencoded({extended:false}));

var arrPerson = [
    new Person('1', 'teo nguyen', 1999, 'male'),
    new Person('2', 'ti pham', 1999, 'male'),
    new Person('3', 'tun nguyen', 1999, 'male'),
    new Person('4', 'to tran', 1999, 'male'),
    new Person('5', 'tinh nguyen', 1999, 'male'),
    new Person('6', 'bi nguyen', 1999, 'male')
]

app.post('/login', function(req, res){
    const username = req.body.username;
    const password = req.body.password;
    // username : admin & password : admin123
    if (username == 'admin' && password == 'admin123') {
        res.json({
            result: true,
            message: 'Dang Nhap Thanh Cong',
            data: arrPerson
        });
    } else {
        res.json({
            result: false,
            message: 'Dang Nhap That Bai',
            data: []
        });
    }
    
});

app.listen(3001);

function Person(id, name, age, gender){
    this.id = id;
    this.name = name;
    this.age = age;
    this.gender = gender;
}