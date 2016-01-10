// server.js

// set up ======================================================================
// get all the tools we need
var express  = require('express');
var app      = express();
var port     = process.env.PORT || 8080;
cors = require('cors')
app.use(cors())

var bodyParser = require('body-parser');
var path = require('path');
var fs = require('fs');
var busboy = require('connect-busboy');


app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.use(busboy())

var passport = require('passport');
var flash    = require('connect-flash');

//prevent server from crashing

process.on('uncaughtException', function (err) {
  console.error(err);
  console.log("Node NOT Exiting...");
});

//to get css

app.use(express.static(__dirname + '/scripts'));
app.use(express.static(__dirname + '/public'));
var connection;
// configuration ===============================================================

var mysql = require('mysql');
var dbconfig = require('./config/database');
function handleDisconnect() {
  console.log('i am restarting')
	connection = mysql.createConnection(dbconfig.connection); // Recreate the connection, since
  connection.query('USE ' + dbconfig.database);                                                // the old one cannot be reused.
  connection.connect(function(err) {              // The server is either down
                                      // to avoid a hot loop, and to allow our node script to
  });                                     // process asynchronous requests in the meantime.
                                          // If you're also serving http, display a 503 error.
  connection.on('error', function(err) {
    console.log('db error', err);
    if(err.code === 'PROTOCOL_CONNECTION_LOST') { // Connection to the MySQL server is usually
      handleDisconnect();                         // lost due to either server restart, or a
    } else {                                      // connnection idle timeout (the wait_timeout
      throw err;                                  // server variable configures this)
    }
  });
}

handleDisconnect();
// connect to our database


setInterval(function () {
    connection.query('SELECT * from users');
    console.log('ça marche')
}, 600000);


require('./config/passport')(passport,connection); // pass passport for configuration

app.configure(function() {

	// set up our express application
	app.use(express.logger('dev')); // log every request to the console
	app.use(express.cookieParser()); // read cookies (needed for auth)
	app.use(express.bodyParser()); // get information from html forms

	app.set('view engine', 'ejs'); // set up ejs for templating

	// required for passport
	app.use(express.session({ secret: 'vidyapathaisalwaysrunning' } )); // session secret
	app.use(passport.initialize());
	app.use(passport.session()); // persistent login sessions
	app.use(flash()); // use connect-flash for flash messages stored in session

});

// routes ======================================================================
require('./app/routes.js')(app, passport,connection); // load our routes and pass in our app and fully configured passport

// launch ======================================================================
app.listen(port);
console.log('The magic happens on port ' + port);
