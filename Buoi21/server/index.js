const express = require('express');
const app = express();

app.get('/ios', function(req, res){
    res.send('IOS');
});

app.listen(3000);
// console.log("Hello World!");