//requirements...
var express = require('express');
var app = express();
var mysql = require('mysql');
var path = require('path');
var bodyParser = require('body-parser');

var connection = mysql.createConnection({
        host: 'mycloud',
        user: 'WVG_DB',
        password: '8mA84UJ175md',
        database: "WVG_DATA",
        port: 3307
});

const http = require('http');
const fs = require('fs');
const { parse } = require('querystring');
const hostname = 'localhost';
const router = express.Router();
 
let date = require('date-and-time');

// Konfiguration...
app.use(express.static(__dirname + '/html'));
app.use(express.static(__dirname + '/bootstrap/'));

// Datenbankverbindung herstellen
connection.connect(function(err) {
  if (err) throw err;
  console.log("\nConnected to mysql: WVG_DATA\n");
});


var urlencodedParser = bodyParser.urlencoded({ extended: false });

// Aufruf-Händling
app.get('/', function(req, res) {
  res.sendFile(path.join(__dirname + '/html/landing.html'));
});


app.get('/booking', function(req, res) {
  res.sendFile(path.join(__dirname + '/html/booking.html'));
});


//Eingabe Daten per POST verarbeiten
app.post('/', urlencodedParser,  function(req, res) {
  
	console.log('\nName: ' + req.body.name);
    console.log('Datum/Uhrzeit: ' + req.body.mydatetimepicker);
    console.log('Abholung: ' + req.body.Haltestelle);
    console.log('Ziel: ' + req.body.Ziel);  

	connection.query("INSERT INTO Buchungen(Name, Rufnummer, Passenger, Datum, Pickup, Target) VALUES ('"+req.body.name+"','"+req.body.Mobilnummer+"','"+req.body.Passagiere+"','"+req.body.mydatetimepicker+"','"+req.body.Haltestelle+"','"+req.body.Ziel+"')", function(err, result){
	if(err) throw err;
	        
	    console.log("1 Datensatz eingefügt");

	    res.end(req.body.name);
	});
});


//Server start
app.listen(3000);
console.log('\nServer running at localhost:3000');