const http = require('http');

const server = http.createServer((req, res) => {
    return res.end("I'm working");
}).listen(process.env.PORT);