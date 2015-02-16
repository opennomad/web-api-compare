var express = require('express');
var app = express();
var bodyParser = require('body-parser');

function errorHandler(err, req, res, next) {
  res.status(500);
  res.render('error', { error: err });
}

app.use(bodyParser.json());

app.get('/', function(req, res) {
    res.send('Hello World!\n');
});

app.get('/time', function(req, res) {
    /* use a function for the exact format desired... */
    function ISODateString(d) {
        function pad(n) {
            return n < 10 ? '0' + n : n;
        }
        return d.getUTCFullYear() + '-' + pad(d.getUTCMonth() + 1) + '-' + pad(d.getUTCDate()) + 'T' + pad(
            d.getUTCHours()) + ':' + pad(d.getUTCMinutes()) + ':' + pad(d.getUTCSeconds()) + 'Z';
    }

    var d = new Date();
    res.send(ISODateString(d) + '\n'); // prints something like 2009-09-28T19:03:12Z
});

app.post('/sort', function(req, res) {
    try {
        var b = req.body.sort();
        res.json(JSON.stringify(b));
    } catch(err) {
        res.status(400).send();
    }
});

var server = app.listen(8080, function() {

    var host = server.address().address;
    var port = server.address().port;

    console.log('Example app listening at http://%s:%s', host, port);

});
