const http = require('http');
const fs = require('fs');
const { parse } = require('querystring');

const hostname = 'localhost';
const port = 3000;

const server = http.createServer((req, res) => { 

	if(req.method === "GET") {

		fs.readFile('index.html', (err, html) => {

			if(err){
			throw err;
		}

  			res.statusCode = 200;
  			res.setHeader('Content-Type', 'text/html');
  			res.write(html);
  			res.end();
  		
			});
	
	} else if (req.method === "POST") {

		var body = "";

		req.on('data', chunk => {
        	body += chunk.toString(); // convert Buffer to string
    	});

    	req.on('end', () => {
        	console.log(parse(body));
        	//res.end('ok');
        	res.end(body);
    	});
	}
  	});
		server.listen(port, hostname, () => {
  		console.log('Server running at ' + hostname + ':'+ port);
});