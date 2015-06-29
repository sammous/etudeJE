var mysql = require('mysql');
var dbconfig = require('../config/database');
var connection = mysql.createConnection(dbconfig.connection);

/*CETTE PARTIE EST POUR LE SUBMIT DE FORMS A NOTRE DB
==
==
*/

/*
==
==
npm install body-parser est nécessaire
*/



// app/routes.js
module.exports = function(app, passport) {

	// =====================================
	// LOGIN ===============================
	// =====================================
	// show the login form
	app.get('/', function(req, res) {
		res.render('login.ejs',{ message: req.flash('loginMessage') }); // load the index.ejs file
	});

 app.get('/ts', function(req,res){
	res.render('post_data.ejs',{
		user : req.user
	});
});

app.post('/data_f44', function(req,res){
	console.log(req.body)
	console.log('Fonctionnalité pour ajouter à SQL');
	console.log(req.body.MVA);
  console.log(req.body.immat);
});

app.get('/header', function(req,res){
	res.render('header.ejs');
});


	// =====================================
	// LOGIN ===============================
	// =====================================
	// show the login form
	app.get('/login', function(req, res) {
		// render the page and pass in any flash data if it exists
		res.render('login.ejs', { message: req.flash('loginMessage') });
	});

	// process the login form
	app.post('/login', passport.authenticate('local-login', {
            successRedirect : '/profile', // redirect to the secure profile section
            failureRedirect : '/login', // redirect back to the signup page if there is an error
            failureFlash : true // allow flash messages
		}),
        function(req, res) {
            console.log("hello");

            if (req.body.remember) {
              req.session.cookie.maxAge = 1000 * 60 * 3;
            } else {
              req.session.cookie.expires = false;
            }
        res.redirect('/');
    });

	// =====================================
	// SIGNUP ==============================
	// =====================================
	// show the signup form
	app.get('/admin/signup', isLoggedIn, isAdmin, function(req, res) {
		// render the page and pass in any flash data if it exists
		res.render('signup.ejs', { message: req.flash('signupMessage') });
	});

	// process the signup form
	app.post('/admin/signup', passport.authenticate('local-signup', {
		successRedirect : '/admin/signup', // redirect to the secure profile section
		failureRedirect : '/admin/signup', // redirect back to the signup page if there is an error
		failureFlash : true // allow flash messages
	})
	);

	// =====================================
	// PROFILE SECTION =========================
	// =====================================
	// we will want this protected so you have to be logged in to visit
	// we will use route middleware to verify this (the isLoggedIn function)
	app.get('/profile', isLoggedIn, function(req, res) {

		if (req.user.attribut == "administrateur") {
			console.log("Connected as admin");
			connection.query('use my_schema;');
			connection.query('select * from vehicules', function(err,result){
			res.render('admin.ejs', {
				user : req.user, // get the user out of session and pass to template
				rowsv : result
			});
			});
		} else {
	  console.log(req.query);
  	/*var	patate = querystring.parse(url.parse(req.url).query);
	  console.log(request);*/
		connection.query('use my_schema;');
		connection.query('select * from vehicules', function(err,result){
		res.render('profile.ejs', {
			user : req.user, // get the user out of session and pass to template
			rowsv : result
		});
		});
	}
	});


	// =====================================
	// FICHE RECEPTION VEHICULE SECTION =========================
	// =====================================
	app.get('/fvehicule', isLoggedIn, function(req, res) {
		res.render('reception_vehicule.ejs',{
			user : req.user
		});
	});

	// =====================================
	// FICHE CHECKIN SECTION =========================
	// =====================================
	app.get('/checkin', isLoggedIn, function(req, res) {
		res.render('checkin.ejs',{
			user : req.user
		});
	});
	app.get('/blank', isLoggedIn, function(req, res) {
		res.render('blank.ejs');
	});

	// =====================================
	// FICHE F44 SECTION =========================
	// =====================================
	app.get('/f44', isLoggedIn, function(req, res) {
		console.log()
		res.render('f44.ejs',{
			user : req.user

		});
	});

//?? pourquoi il y a un post sur f44 au lieu de data_f44 ?
	app.post('/f44', function(req,res){
		console.log(req.body)
		console.log('Fonctionnalité pour ajouter à SQL');
		console.log(req.body.controle_interieur);
	});

	app.get('/search_immat',function(req,res){
	connection.query('use my_schema;');

	connection.query('SELECT immat from vehicules where immat like "%'+req.query.key+'%"', function(err, rows, fields) {
			//console.log('SELECT id from users where id = '+req.query.key+';');
			if (err) throw err;
			var data=[];
			for(i=0;i<rows.length;i++)
				{
					console.log(rows[i].immat);
					data.push(rows[i].immat);
				}
			res.end(JSON.stringify(data));
		//  res.end(toString(rows[i].username))	;
		});
	});



	app.get('/search_mva',function(req,res){
	connection.query('use my_schema;');

	connection.query('SELECT mva from vehicules where immat like "%'+req.query.key+'%"', function(err, rows, fields) {
			//console.log('SELECT id from users where id = '+req.query.key+';');
			if (err) throw err;
			var data=[];
			for(i=0;i<rows.length;i++)
				{
					console.log(rows[i].mva);
					data.push(rows[i].mva);
				}
				console.log(JSON.stringify(data));
			res.end(JSON.stringify(data));
		//  res.end(toString(rows[i].username))	;
		});
	});


	// =====================================
	// ADMIN SECTION =========================
	// =====================================
	// we will want this protected so you have to be logged in to visit
	// we will use route middleware to verify this (the isLoggedIn function)
	app.get('/admin', isLoggedIn, isAdmin, function(req, res) {

		connection.query('use my_schema;');
		connection.query('select * from users', function(err,result){
			connection.query('select * from vehicules', function(err,result2){
			res.render('admin.ejs', {
				rows : result, // get the user out of session and pass to template
				rowsv : result2
			});
		});
	});
});


// =====================================
// VEHICULE SECTION =========================
// =====================================
// we will want this protected so you have to be logged in to visit
// we will use route middleware to verify this (the isLoggedIn function)
app.get('/vehicule', isLoggedIn, function(req, res) {

	  connection.query('use my_schema;');
		connection.query('select * from vehicules', function(err,result2){
		res.render('vehicule.ejs', {
			 // get the user out of session and pass to template
			rowsv : result2
		});
});
});

// =====================================
// COMPTES SECTION =========================
// =====================================
// we will want this protected so you have to be logged in to visit
// we will use route middleware to verify this (the isLoggedIn function)
app.get('/comptes', isLoggedIn, function(req, res) {

	  connection.query('use my_schema;');
		connection.query('select * from users', function(err,result2){
		res.render('comptes.ejs', {
			 // get the user out of session and pass to template
			rows : result2
		});
});

});


// =====================================
// AGENCE SECTION =========================
// =====================================
app.get('/agences', isLoggedIn, function(req, res) {

	  connection.query('use mydb;');
		connection.query('select * from Agence', function(err,result2){
		res.render('agence.ejs', {
			 // get the user out of session and pass to template
			rows : result2
		});
});

});

	// =====================================
	// LOGOUT ==============================
	// =====================================
	app.get('/logout', function(req, res) {
		req.logout();
		res.redirect('/');
	});


};

// route middleware to make sure
function isLoggedIn(req, res, next) {

	// if user is authenticated in the session, carry on
	if (req.isAuthenticated())
		return next();

	// if they aren't redirect them to the home page
	res.redirect('/');
}

//admin check
function isAdmin(req,res,next) {
	if (req.user.attribut == "administrateur")
			return next()

	res.redirect('/')
}
