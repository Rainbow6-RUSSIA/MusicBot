const fs = require('fs');

const path = __dirname + '/../'

const cfg = fs.readFileSync(path + 'config.txt', 'utf8').replace(/%%[A-Z_]+%%/g, r => process.env[r.slice(2, -2)]);

fs.writeFileSync(path + 'target/config.txt', cfg);

console.log(cfg);