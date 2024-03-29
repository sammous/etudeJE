// config/passport.js

// load all the things we need
var LocalStrategy   = require('passport-local').Strategy;
var bcrypt = require('bcrypt-nodejs');

// load up the user model
var mysql = require('mysql');

var dbconfig = require('./database');
var connection = mysql.createConnection(dbconfig.connection);

connection.query('USE ' + dbconfig.database);

// expose this function to our app using module.exports
module.exports = function(passport,connection) {

    // =========================================================================
    // passport session setup ==================================================
    // =========================================================================
    // required for persistent login sessions
    // passport needs ability to serialize and unserialize users out of session

    // used to serialize the user for the session
    passport.serializeUser(function(user, done) {
        done(null, user.id);
    });

    // used to deserialize the user
    passport.deserializeUser(function(id, done) {
        connection.query("SELECT * FROM users WHERE id = ? ",[id], function(err, rows){
            done(err, rows[0]);
        });
    });

    // =========================================================================
    // LOCAL SIGNUP ============================================================
    // =========================================================================
    // we are using named strategies since we have one for login and one for signup
    // by default, if there was no name, it would just be called 'local'

    passport.use(
        'local-signup',
        new LocalStrategy({
            // by default, local strategy uses username and password, we will override with email
            usernameField : 'username',
            passwordField : 'password',
            passReqToCallback : true // allows us to pass back the entire request to the callback
        },
        function(req, username, password, done) {
            // find a user whose email is the same as the forms email
            // we are checking to see if the user trying to login already exists
            connection.query("SELECT * FROM users WHERE username = ?",[username], function(err, rows) {
                if (err)
                    return done(err);
                if (rows.length) {
                    return done(null, false, req.flash('signupMessage', 'ECHEC : Cet identifiant est déjà pris.'));
                } else {
                    // if there is no user with that username
                    // create the user
                if (req.body.attribut.length != 0) {
                    var newUserMysql = {
                        username: username,
                        password: bcrypt.hashSync(password, null, null),  // use the generateHash function in our user model
                        attribut: req.body.attribut,
                        agence: req.body.agence,
                    };


                    var insertQuery = "INSERT INTO users ( username, password, attribut, agence ) values (?,?,?,?)";

                    connection.query(insertQuery,[newUserMysql.username, newUserMysql.password, newUserMysql.attribut, newUserMysql.agence],function(err, rows) {
                        newUserMysql.id = rows.insertId;

                        return done(null, false,req.flash('signupMessage','SUCCES : Compte créé.'));
                    });
                } else {
                    return done(null,false,req.flash('signupMessage', 'ECHEC : Choisir un attribut.'));
                }
              }
          });
        }
      )
    );


    // =========================================================================
    // LOCAL LOGIN =============================================================
    // =========================================================================
    // we are using named strategies since we have one for login and one for signup
    // by default, if there was no name, it would just be called 'local'

    passport.use(
        'local-login',
        new LocalStrategy({
            // by default, local strategy uses username and password, we will override with email
            usernameField : 'username',
            passwordField : 'password',
            passReqToCallback : true // allows us to pass back the entire request to the callback
        },
        function(req, username, password, done) { // callback with email and password from our form
            connection.query("SELECT * FROM users WHERE username = ?",[username], function(err, rows){
                if (err)
                    return done(err);
                if (!rows.length) {
                    return done(null, false, req.flash('loginMessage', 'Pas d\'utilisateur trouvé.')); // req.flash is the way to set flashdata using connect-flash
                }

                // if the user is found but the password is wrong
                if (!bcrypt.compareSync(password, rows[0].password))
                    return done(null, false, req.flash('loginMessage', 'Oops! Mauvais mot de passe.')); // create the loginMessage and save it to session as flashdata

                // all is well, return successful user

                return done(null, rows[0]);
            });
        })
    );

    // =========================================================================
    // CHANGE LOGIN =============================================================
    // =========================================================================
    // we are using named strategies since we have one for login and one for signup
    // by default, if there was no name, it would just be called 'local'

    passport.use(
        'local-update',
        new LocalStrategy({
            // by default, local strategy uses username and password, we will override with email
            usernameField : 'username',
            passwordField : 'password',
            passReqToCallback : true // allows us to pass back the entire request to the callback
        },
        function(req, username, password, done) { // callback with email and password from our form
            connection.query("SELECT * FROM users WHERE username = ?",[username], function(err, rows){
                if (err)
                    return done(err);
                if (!rows.length) {
                    return done(null, false, req.flash('updateMessage', 'ECHEC : Pas d\'utilisateur trouvé.')); // req.flash is the way to set flashdata using connect-flash
                }

                connection.query("UPDATE users SET password = ? WHERE username = ?",[bcrypt.hashSync(password, null, null),username], function(err, rows2){
                    return done(null, req.flash('updateMessage','SUCCES : Mot de passe changé avec succès.'))
                });


                // all is well, return successful user
                return done(null, rows[0]);
            });
        })
    );


};
