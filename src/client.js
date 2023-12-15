const https = require('https');
const fs = require('fs');

const options = {
  hostname: 'localhost',
  port: 443,
  path: '/',
  method: 'GET',
  key: fs.readFileSync('/home/appmarketing/www/certs/client/client.key'),
  cert: fs.readFileSync('/home/appmarketing/www/certs/client/client.crt'),
  ca: fs.readFileSync('/home/appmarketing/www/certs/ca.crt'),
  rejectUnauthorized: true
};

https.request(options,(res) => {
  console.log(`CLIENT 1`);
  console.log(`satusCode: ${res.statusCode}`);
  res.on('data', (d) => {
    process.stdout.write(d)
  });
}).end();

//CLIENT 2
const options2 = {
  hostname: 'localhost',
  port: 443,
  path: '/',
  method: 'GET',
  key: fs.readFileSync('/home/appmarketing/www/certs/client2/client2.key'),
  cert: fs.readFileSync('/home/appmarketing/www/certs/client2/client2.crt'),
  ca: fs.readFileSync('/home/appmarketing/www/certs/ca.crt'),
  rejectUnauthorized: true
};

https.request(options2,(res) => {
  console.log(`CLIENT 2`);
  console.log(`satusCode: ${res.statusCode}`);
  res.on('data', (d) => {
    process.stdout.write(d)
  });
}).end();