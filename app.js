const http = require('http');
const fs = require('fs');
//const http = require('bootstrap');

const hostname = 'localhost';
const port = 3000;

fs.readFile('index.html', (err, html) => {

	//if(err){
	//	throw err;
	//}

		const server = http.createServer((req, res) => {
  		res.statusCode = 200;
  		res.setHeader('Content-Type', 'text/html');
  		res.write(html);
  		res.end();
  		
	});

		server.listen(port, hostname, () => {
  		console.log('Server running at ' + hostname + ':'+ port);
	});
});