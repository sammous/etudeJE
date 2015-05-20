var express = require('express');
var app = express();
var path = require('path');
var bodyParser = require('body-parser');
var mongoose = require('mongoose');
var port = process.env.PORT || 3000;

var configDB = require('./config/database.js');

// connect to mongo
mongoose.connect('mongodb://localhost/newauth');

app.set('view engine','ejs');

//app.set('views', __dirname + '/views');
app.use(express.static(__dirname + '/public'));

//middleware
app.use(bodyParser.urlencoded({ extended: true}));

app.get('/', function(req, res) {
  res.render('signin.ejs');
});

app.post('/', function(req, res){
  User.findOne({ username: req.body.username }, function(err, user) {
    if (!user) {
      res.render('signin.ejs', {error: 'Invalid username or password.' });
    } else {
      if (req.body.password == user.password ){
        res.redirect('/dashboard');
      } else {
        res.render('signin.ejs', {error: 'Invalid username or password.' });
      }
    }
  });
});

app.get('/signin', function(req, res) {
  res.render('search.html');
});

// route middleware to make sure a user is logged in
function isLoggedIn(req, res, next) {

    // if user is authenticated in the session, carry on
    if (req.isAuthenticated())
        return next();

    // if they arent redirect them to the home page
    res.redirect('/');
}

app.listen(port);
