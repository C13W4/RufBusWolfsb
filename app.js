const http = require('http');
const fs = require('fs');
const { parse } = require('querystring');
var path = require('path');

var express = require('express');
var app = express();

const hostname = 'localhost';

const router = express.Router(); // 1
 
app.listen(3000);

console.log('Server running at Port localhost:3000');




app.get('/', function(req, res) {
  res.sendFile(path.join(__dirname + '/landing.html'));
});


app.get('/notizblock.jpg', function(req, res) {
  res.sendFile(path.join(__dirname + '/notizblock.jpg'));
});


app.get('/booking', function(req, res) {
  res.sendFile(path.join(__dirname + '/booking.html'));
});


app.post('/', function(req, res) {
  
      var body = "";

      req.on('data', chunk => {
          body += chunk.toString(); // convert Buffer to string
      });

      req.on('end', () => {
          console.log(parse(body));
          //res.end('ok');
          res.end(body);
      });
});