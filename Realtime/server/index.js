const express = require('express');
const app = express();

// socket
const server = require('http').Server(app);
const io = require('socket.io')(server);

// on : nghe - nhan tin hieu
io.on('connection', function(socket){
    console.log(socket.id + ' da ket noi');
    // emit : noi - phat tin hieu
    socket.emit('welcome', 'Xin chao Quan Nguyen');

    socket.on('Plus', function(data){
        console.log(data);
        // emit
    });

    socket.on('client-send', function(data){
        console.log(data);
        // gui cho chinh minh
        // socket.emit('send-myself', data);
        // gui cho so con lai
        socket.broadcast.emit('server-send', data);
    }); 
});

server.listen(3000);