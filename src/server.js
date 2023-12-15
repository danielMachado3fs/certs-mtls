const https = require('https');
const fs = require('fs')

const options = {
  key: fs.readFileSync('/home/appmarketing/www/certs/server/server.key'),
  cert: fs.readFileSync('/home/appmarketing/www/certs/server/server.crt'),
  ca: fs.readFileSync('/home/appmarketing/www/certs/ca.crt'),
  requestCert: true,
  rejectUnauthorized: true
}

https.createServer(options, (req, res) => {
  res.writeHead(200);
  res.end('Server Ok')
}).listen(443)

//para rodar o servidor no linux localhost, precisa rodar o "sudo chown -R `whoami` /home/appmarketing/www/certs/[pasta-certificados]"