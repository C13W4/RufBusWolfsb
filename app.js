//requirements...
var express = require('express');
var app = express();
var mysql = require('mysql');
var path = require('path');
var bodyParser = require('body-parser');
var date = require('date-and-time');

var connection = mysql.createConnection({
        host: 'localhost',
        user: 'WVG_DB',
        password: '8mA84UJ175md',
        database: "WVG_DATA",
        port: 3307
});




// Konfiguration...
app.use(express.static(__dirname + '/html'));


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


//Eingabedaten per POST verarbeiten
app.post('/', urlencodedParser,  function(req, res) {
  
  	let now = new Date();
    let twenty_min_later = date.addMinutes(now, 20);
    
    if(date.format(twenty_min_later, 'YYYY-MM-DD HH:mm') <= req.body.datetimepicker){

    	connection.query("INSERT INTO Buchungen(Name, Rufnummer, Passenger, Datum, Pickup, Target, ID_BUS) VALUES ('"+req.body.name+"','"+req.body.Mobilnummer+"','"+req.body.Passagiere+"','"+req.body.datetimepicker+"','"+req.body.Haltestelle+"','"+req.body.Ziel+', '+req.body.Ziel_PLZ+' Wolfsburg'+"', NULL)", function(err, result){
	    if(err) throw err;
	        
	        console.log("1 Datensatz eingefügt");

		});

	  	// Buchungsbestätigung

	  	connection.query("Select ID_BUS from Buchungen where ID = (Select MAX(ID) from Buchungen)", function(err, result){

		  	if (result[0].ID_BUS == 0){

		  		res.end("<html><body><center><br><br>Leider ist zur gewuenschten Zeit kein Bus mehr frei, bitte melden Sie sich telefonisch.</center></body></html>");


		  	} else {

		  		// Select from DB für aktuelle Daten
		  		res.send("<html><body><center><br><br>Hallo "+req.body.name+",<br><br>Sie werden abgeholt am: <h3>"+req.body.datetimepicker+"Uhr</h3><br><br>an der Haltestelle: <h3>"+req.body.Haltestelle+"</h3></center></body></html>");

		  	}

	  	});


    } else {

    	// Buchungszeit ist zu kurzfristig (< 20 min. oder in der Vergangenheit)

    	res.end("<html><body><center><br><br>Ihr Buchungsdatum liegt in der Vergangenheit.</center></body></html>");

    }

});

//Server start
app.listen(3000);
console.log('\nServer running at localhost:3000');