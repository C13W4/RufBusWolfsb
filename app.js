//requirements...

const http = require('http');
const fs = require('fs');
const { parse } = require('querystring');
var path = require('path');

var express = require('express');
var app = express();
var mysql = require('mysql');

const hostname = 'localhost';

const router = express.Router(); // 1
 


// Konfiguration...
app.use(express.static(__dirname + '/html'));

//app.use(express.bodyParser());


/*connection.query('USE test', function (err) {
  if (err) throw err;
  connection.query('CREATE TABLE IF NOT EXISTS users('
        + 'id INT NOT NULL AUTO_INCREMENT,'
            + 'PRIMARY KEY(id),'
            + 'name VARCHAR(30)'
            +  ')', function (err) {
                if (err) throw err;
            });
});*/


// Aufruf-Händling
app.get('/', function(req, res) {
  res.sendFile(path.join(__dirname + '/html/landing.html'));
});


app.get('/booking', function(req, res) {
  res.sendFile(path.join(__dirname + '/html/booking.html'));
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


//Server start
app.listen(3000);
console.log('Server running at Port localhost:3000');