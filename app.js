var express = require('express');
var app = express();
var path = require('path');
var bodyParser = require('body-parser');
var cookieParser = require('cookie-parser');
var session = require('express-session');
var bcrypt = require('bcrypt-nodejs');
var passport = require('passport');
var LocalStrategy = require('passport-local').Strategy;
var mongoose = require('mongoose');
var port = process.env.PORT || 3000;


// custom libraries
// routes
var route = require('./routes');
// model
var Model = require('./models/user');

app.set('view engine','ejs');

//app.set('views', __dirname + '/views');
app.use(express.static(__dirname + '/public'));

//middleware
app.use(bodyParser.urlencoded({ extended: true}));

passport.use(new LocalStrategy(function(username, password, done) {
   new Model.User({username: username}).fetch().then(function(data) {
      var user = data;
      if(user === null) {
         return done(null, false, {message: 'Invalid username or password'});
      } else {
         user = data.toJSON();
         if(!bcrypt.compareSync(password, user.password)) {
            return done(null, false, {message: 'Invalid username or password'});
         } else {
            return done(null, user);
         }
      }
   });
}));

passport.serializeUser(function(user, done) {
  done(null, user.username);
});

passport.deserializeUser(function(username, done) {
   new Model.User({username: username}).fetch().then(function(user) {
      done(null, user);
   });
});

app.use(cookieParser());
app.use(bodyParser());
app.use(session({secret: 'secret strategic xxzzz code'}));
app.use(passport.initialize());
app.use(passport.session());


app.get('/', route.signIn);

// signin
// GET
app.get('/signin', route.signIn);
// POST
app.post('/signin', route.signInPost);

// signup
// GET
app.get('/signup', route.signUp);
// POST
app.post('/signup', route.signUpPost);

// logout
// GET
app.get('/logout', route.logout);

/********************************/

/********************************/
// 404 not found
app.use(route.notFound404);


var server = app.listen(app.get('port'), function(err) {
   if(err) throw err;

   var message = 'Server is running @ http://localhost:' + server.address().port;
   console.log(message);
});

/*
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

app.post('/', function(req, res, next) {
   passport.authenticate('local', { successRedirect: '/',
                          failureRedirect: '/signin'}, function(err, user, info) {
      if(err) {
         return res.render('signin', {title: 'Sign In', errorMessage: err.message});
      }

      if(!user) {
         return res.render('signin', {title: 'Sign In', errorMessage: info.message});
      }
      return req.logIn(user, function(err) {
         if(err) {
            return res.render('signin', {title: 'Sign In', errorMessage: err.message});
         } else {
            return res.redirect('/');
         }
      });
   })(req, res, next);
};
});

app.get('/logout', function(req, res){
  req.logout();
  res.redirect('/');
});

app.get('/search', isLoggedIn, function(req, res) {
  res.render('search.ejs', {
  user : req.user // get the user out of session and pass to template
  });
});

// route middleware to make sure a user is logged in
function isLoggedIn(req, res, next) {

    // if user is authenticated in the session, carry on
    if (req.isAuthenticated())
        return next();

    // if they arent redirect them to the home page
    res.redirect('/');
}
*/
app.listen(port);
