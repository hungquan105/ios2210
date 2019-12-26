const express = require('express');
const app = express();

// body
const bodyParser = require('body-parser');
app.use(bodyParser.urlencoded({extended:false}));

// jwt
const jwt = require('jsonwebtoken');
const secret = 'khoapham';

app.get('/login', function(req,res){
    console.log('GET');
    // const {username, password} = req.body;
    const token = jwt.sign({
        username : 'khoapham',
        name : 'khoa',
        age : 19,
        gentle : 'Male',
        phonenumber : 123456789
    },secret,{expiresIn : 300});
    res.json({token : token});
});

app.post('/check', function(req,res){
    const token = req.body.token;
    jwt.verify(token, secret, function(err, decoded){
        if (err) {
            res.json({result : 'Dang nhap qua han'});
        } else {
            req.decoded = decoded;
            // res.json({name : decoded.name, age : decoded.age, gentle : decoded.gentle, phone : decoded.phonenumber});
            res.json({result : 'Dang nhap thanh cong'});
        };
    });
});

app.listen(3000);
