/*var mysql = require('mysql');
var dbconfig = require('../config/database');
function handleDisconnect() {
	var connection = mysql.createConnection(dbconfig.connection); // Recreate the connection, since
  connection.query('USE ' + dbconfig.database);                                                // the old one cannot be reused.
  connection.connect(function(err) {              // The server is either down
    if(err) {                                     // or restarting (takes a while sometimes).
      console.log('error when connecting to db:', err);
      setTimeout(handleDisconnect, 2000); // We introduce a delay before attempting to reconnect,
    }                                     // to avoid a hot loop, and to allow our node script to
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

handleDisconnect();*/
//var connection = mysql.createConnection(dbconfig.connection);
/*
var del = connection._protocol._delegateError;
connection._protocol._delegateError = function(err, sequence){
  if (err.fatal) {
    console.trace('fatal error: ' + err.message);
  }
  return del.call(this, err, sequence);
};*/

/*
function handleDisconnect() {
	var connection = mysql.createConnection(dbconfig.connection); // Recreate the connection, since
  connection.query('USE ' + dbconfig.database);                                                // the old one cannot be reused.
  connection.connect(function(err) {              // The server is either down
    if(err) {                                     // or restarting (takes a while sometimes).
      console.log('error when connecting to db:', err);
      setTimeout(handleDisconnect, 2000); // We introduce a delay before attempting to reconnect,
    }                                     // to avoid a hot loop, and to allow our node script to
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
}*/


module.exports = function(app, passport,connection) {

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
	console.log(req.body.Aspiration_intérieur ? 1 : 0 );
	var insertQueryf44='INSERT INTO process_f44 (mva,immat,remplissage_carburant,aspiration_interieur,lavage_exterieur,nettoyage_vitre,nettoyage_parebrise_interieur,niveau_huile,niveau_lave_glace,pression_pneus,controle_carosserie,controle_interieur,nomOperateur) values(?,?,?,?,?,?,?,?,?,?,?,?,?)';
	connection.query(insertQueryf44,[req.body.MVA,req.body.immat,req.body.Aspiration_intérieur ? 1 : 0 ,req.body.Lavage_extérieure ? 1 : 0 ,req.body.Nettoyage_vitre ? 1 : 0 ,req.body.Nettoyage_parebrise_intérieur ? 1 : 0  ,req.body.Niveau_huile ? 1 : 0  ,req.body.Niveau_lave_glace ? 1 : 0 ,
		 req.body.Pression_pneus ? 1 : 0 ,req.body.Contrôle_carrosserie ? 1 : 0 ,req.body.Aspiration_intérieure ? 1 : 0 ,req.body.remplissage_carburant ? 1 : 0 ,req.body.name]);
	res.render('confirmation.ejs',{
		user : req.userproximity
	});

});

app.get('/header', function(req,res){
	res.render('header.ejs');
});

/*
app.get('/liste_vehicules', function(req,res){
	res.render('liste_vehicules.ejs');
});*/

	app.post('/data_chercher_vehicule', function(req,res){
		console.log(req.body.immat)
		connection.query('select * from vehicules where immat like "%'+req.body.immat+'%";', function(err,result){
			connection.query('select * from process_f44 where immat like"%'+req.body.immat+'%";', function(err,result2){

		res.render('chercher_vehicule_resp.ejs', {
			rows : result,
			rows2 : result2,
			user : req.user
		});
			});
		});
	});

	app.post('/data_chercher_process', function(req,res){
		connection.query('select * from process_f44 where Numero like "%'+req.body.numero+'%";', function(err,result){
		console.log(result);
		res.render('chercher_process_resp.ejs', {
			rows : result,
			user : req.user
			});
		});
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
	app.get('/admin/signup', isAdmin, function(req, res) {
		// render the page and pass in any flash data if it exists
		connection.query('select nom from Agence', function(err,result){
			res.render('signup.ejs', { user: req.user, message: req.flash('signupMessage'), agence: result});
		});
	});

	// process the signup form
	app.post('/signup', passport.authenticate('local-signup', {
		successRedirect : '/admin/signup', // redirect to the secure profile section
		failureRedirect : '/admin/signup', // redirect back to the signup page if there is an error
		failureFlash : true // allow flash messages
	})
	);


	// =====================================
	// UPDATE PASSWORD ==============================
	// =====================================
	// show the signup form
	app.get('/update', isLoggedIn, isAdmin, function(req, res) {
		// render the page and pass in any flash data if it exists
		res.render('update.ejs', { user: req.user, message: req.flash('updateMessage') });
	});

	// process the signup form
	app.post('/update', passport.authenticate('local-update', {
		successRedirect : '/update', // redirect to the secure profile section
		failureRedirect : '/update', // redirect back to the signup page if there is an error
		failureFlash : true // allow flash messages
	})
	);

	// =====================================
	// PROFILE SECTION =========================
	// =====================================
	// we will want this protected so you have to be logged in to visit
	// we will use route middleware to verify this (the isLoggedIn function)
	app.get('/liste_vehicules', isLoggedIn, function(req, res) {
		var data ='';

		if (req.user.attribut == "administrateur") {

			connection.query('select * from vehicules LIMIT 50', function(err,result){
			data=JSON.stringify(result);
			res.render('liste_vehicules.ejs', {
				user : req.user, // get the user out of session and pass to template
				rowsv : result,
				data: JSON.stringify(result)
			});
			});
		console.log(data);
		} else {
	  console.log(req.query);
		res.render('liste_vehicules.ejs', {
			user : req.user, // get the user out of session and pass to template
			rowsv : []
		});
	};
	console.log(data);
	});

	app.get('/profile', isLoggedIn, function(req, res) {
		var data ='';

		if (req.user.attribut == "administrateur") {
			console.log("Connected as admin");
			connection.query('select * from vehicules LIMIT 50', function(err,result){
			data=JSON.stringify(result);
			res.render('admin.ejs', {
				user : req.user, // get the user out of session and pass to template
				rowsv : result,
				data: JSON.stringify(result)
			});
			});
		console.log(data);
		} else {
	  console.log(req.query);
		connection.query('select * from vehicules LIMIT 50', function(err,result){
		data=JSON.stringify(result);
		res.render('profile.ejs', {
			user : req.user, // get the user out of session and pass to template
			rowsv : result,
			data: JSON.stringify(result)
		});
		});
	}
	console.log(data);
	});


	app.get('/confirmation', function(req,res){
 	res.render('confirmation.ejs',{
 		user : req.user
 	});
 });

 // =====================================
 // ASSIGNER_RECEPTION ===============================
 // =====================================
 app.get('/tache_reception', function(req,res){
  res.render('tache_reception.ejs',{
 	 user : req.user
  });
 });

 app.post('/ajouter_tache_reception', isLoggedIn, function(req, res) {
	 var insertQueryRecup='INSERT INTO recuperation (immat , prev_date , accompli , nomOperateur , nomPreparateur) values(?,?,?,?,?)';
	 connection.query(insertQueryRecup,[req.body.immat , req.body.date ,req.body.accompli ? 1 : 0 , req.body.nomOperateur, req.body.nomPreparateur ]);
	 res.redirect('/confirmation');
 });


 app.get('/historique_tache_reception', function(req,res){

	 connection.query('select * from recuperation;', function(err,result){
	 res.render('historique_tache_reception.ejs', {
		 rows : result,
		 user : req.user,
	 });
	 });
 });
 // =====================================
 // data_f44 ============================
 // =====================================
 // show the login form
 app.post('/data_f44', function(req,res){
 	console.log(req.body)
 	res.render('confirmation.ejs',{
 		user : req.user
 	});

 });

 	app.get('/header', function(req,res){
 		res.render('header.ejs');
 	});

	// =====================================
	// FICHE RECEPTION VEHICULE SECTION =========================
	// =====================================
	app.get('/fvehicule', isLoggedIn, function(req, res) {
		res.render('reception_vehicule.ejs',{
			user : req.user
		});
	});

	app.post('/fvehicule', function(req,res){
		console.log(req.body);
		res.render('confirmation.ejs',{
			user : req.user
		});
	});

	app.get('/blank', isLoggedIn, function(req, res) {
		res.render('blank.ejs',{
			user : req.user
		});
	});

	// =====================================
	// FICHE F44 SECTION ===================
	// =====================================
	app.get('/f44', isLoggedIn, function(req, res) {
		console.log()
		res.render('f44.ejs',{
			user : req.user
		});
	});


	app.get('/historique_f44', isLoggedIn, function(req, res) {

		res.render('chercher_process.ejs',{
			user : req.user
		});
	});

	// =====================================
	// CHERCHER VEHICULE SECTION ===========
	// =====================================
	app.get('/chercher_vehicule', isLoggedIn, function(req, res) {
		console.log()
		res.render('chercher_vehicule.ejs',{
			user : req.user
		});
	});


	app.post('/data_chercher_vehicule', function(req,res){
		console.log(req.body.immat)
		connection.query('select * from vehicules where immat like "%'+req.body.immat+'%";', function(err,result){
		res.render('chercher_vehicule_resp.ejs', {
			rows : result,
			user : req.user,
		});
		});
	});

	app.get('/modifier_vehicule', isLoggedIn, function(req, res) {
		console.log(req.query);
		connection.query('UPDATE vehicules SET MVA = ? , IMMAT = ? , CURRENT_LOCATION_STN = ? , STATUT = ? , STATION_DEPART = ? , STATION_RETOUR = ? , DATE_DEPART = ? , DATE_RETOUR = ? , NUMERO_CONTRAT = ?  , marque = ?  WHERE IMMAT = ?', [req.query.MVA , req.query.IMMAT , req.query.CURRENT_LOCATION_STN , req.query.STATUT , req.query.STATION_DEPART , req.query.STATION_RETOUR , req.query.DATE_DEPART , req.query.DATE_RETOUR , req.query.NUMERO_CONTRAT , req.query.marque , req.query.IMMAT]);
		var data="";
    res.end(data);
	});


	// =====================================
	// CHERCHER AGENCE SECTION =============
	// =====================================

	app.get('/chercher_agence', isLoggedIn, function(req, res) {
		console.log()
		res.render('chercher_agence.ejs',{
			user : req.user
		});
	});

	app.get('/ajouter_agence', isLoggedIn, function(req, res) {
		res.render('ajouter_agence.ejs',{
			user : req.user
		});
	});


	app.post('/data_chercher_agence', function(req,res){
		console.log(req.body)
		connection.query('select * from agence where nom like "%'+req.body.agence+'%";', function(err,result){
			console.log("voici")
			console.log(result)
		res.render('chercher_agence_resp.ejs', {
			rows : result,
			user : req.user,
		});
		});
	});

	app.get('/modifier_agence', isLoggedIn, function(req, res) {
	connection.query('UPDATE agence SET nom = ?, adresse = ? WHERE idAgence = ?', [req.query.nom, req.query.adresse, req.query.id])
		var data="";
		res.end(data);
	});

	app.get('/data_ajouter_agence', isLoggedIn, function(req, res) {
		var insertQueryAgence='INSERT INTO agence (nom,adresse) values(?,?)';
 	 connection.query(insertQueryAgence,[req.query.nom,req.query.adresse]);
 	 var data="";
 	res.end(data);
  });
	// =====================================
	// CHERCHER PARKING SECTION ============
	// =====================================

	app.get('/chercher_parking', isLoggedIn, function(req, res) {
		console.log()
		res.render('chercher_parking.ejs',{
			user : req.user
		});
	});

	app.get('/ajouter_parking', isLoggedIn, function(req, res) {
		console.log()
		res.render('ajouter_parking.ejs',{
			user : req.user
		});
	});

	app.post('/data_chercher_parking', function(req,res){
		console.log(req.body)
		connection.query('select * from parking where nom like "%'+req.body.parking+'%";', function(err,result){
		res.render('chercher_parking_resp.ejs', {
			rows : result,
			user : req.user,
		});
		});
	});

	app.get('/modifier_parking', isLoggedIn, function(req, res) {

		connection.query('UPDATE parking SET nom = ?, agence = ? WHERE idParking = ?', [req.query.nom, req.query.agence, req.query.id])
		data="";
		res.end(data);
	});

	app.get('/data_ajouter_parking', isLoggedIn, function(req, res) {
		var insertQueryParking='INSERT INTO parking (nom,agence) values(?,?)';
  	 connection.query(insertQueryParking,[req.query.nom,req.query.agence]);
 	 var data="";
 	res.end(data);
  });




	// =====================================
	// CHERCHER IMMAT  =====================
	// =====================================


	app.get('/search_immat',function(req,res){
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



	// =====================================
	// CHERCHER IMMAT  =====================
	// =====================================


	app.get('/search_num',function(req,res){
	connection.query('SELECT Numero from process_f44 where Numero like "%'+req.query.key+'%"', function(err, rows, fields) {
			//console.log('SELECT id from users where id = '+req.query.key+';');
			if (err) throw err;
			var data=[];
			for(i=0;i<rows.length;i++)
				{
					console.log(rows[i].Numero);
					data.push(rows[i].Numero);
				}
			res.end(JSON.stringify(data));
		//  res.end(toString(rows[i].username))	;
		});
	});


	app.get('/search_name',function(req,res){
		console.log(req.query.key)

	connection.query('SELECT nomOperateur from operateur where nomOperateur like "%'+req.query.key+'%"', function(err, rows, fields) {
			//console.log('SELECT id from users where id = '+req.query.key+';');
			if (err) throw err;
			var data=[];
			for(i=0;i<rows.length;i++)
				{
					data.push(rows[i].nomOperateur);
				}
			res.end(JSON.stringify(data));
		//  res.end(toString(rows[i].username))	;
		});
	});

	// =====================================
	// CHERCHER MVA  =======================
	// =====================================
	app.get('/search_mva',function(req,res){
			if (req.query.key!=''){
	connection.query('SELECT mva from vehicules where immat like "%'+req.query.key+'%"', function(err, rows, fields) {
			//console.log('SELECT id from users where id = '+req.query.key+';');
			if (err) throw err;
			var data=[];
			for(i=0;i<rows.length;i++)
				{
					data.push(rows[i].mva);
				}
			res.end(JSON.stringify(data));
		//  res.end(toString(rows[i].username))	;
		});
	};
	});

	// =====================================
	// CHERCHER Propriétaire  =======================
	// =====================================
	app.get('/search_proprio',function(req,res){
		console.log();
			if (req.query.key!=''){
	connection.query('SELECT PROPRIO_WIZARD from vehicules where immat like "%'+req.query.key+'%"', function(err, rows, fields) {
			//console.log('SELECT id from users where id = '+req.query.key+';');
			if (err) throw err;
			var data=[];
			for(i=0;i<rows.length;i++)
				{
					data.push(rows[i].PROPRIO_WIZARD);
				}
			res.end(JSON.stringify(data));
		//  res.end(toString(rows[i].username))	;
		});
	};
	});

	// =====================================
	// CHERCHER Modèle  =======================
	// =====================================
	app.get('/search_modele',function(req,res){
			if (req.query.key!=''){
	connection.query('SELECT libell_mod_le from vehicules where immat like "%'+req.query.key+'%"', function(err, rows, fields) {
			//console.log('SELECT id from users where id = '+req.query.key+';');
			if (err) throw err;
			var data=[];
			for(i=0;i<rows.length;i++)
				{
					data.push(rows[i].libell_mod_le);
				}
			res.end(JSON.stringify(data));
		//  res.end(toString(rows[i].username))	;
		});
	};
	});

	// =====================================
	// CHERCHER agence  =======================
	// =====================================
	app.get('/search_agence',function(req,res){
	connection.query('SELECT nom from agence where nom like "%'+req.query.key+'%"', function(err, rows, fields) {
			//console.log('SELECT id from users where id = '+req.query.key+';');
			if (err) throw err;
			var data=[];
			for(i=0;i<rows.length;i++)
				{
					data.push(rows[i].nom);
				}
			res.end(JSON.stringify(data));
		//  res.end(toString(rows[i].username))	;
		});
	});

	app.get('/search_parking',function(req,res){
	connection.query('SELECT nom from parking where nom like "%'+req.query.key+'%"', function(err, rows, fields) {
			//console.log('SELECT id from users where id = '+req.query.key+';');
			if (err) throw err;
			var data=[];
			for(i=0;i<rows.length;i++)
				{
					data.push(rows[i].nom);
				}
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
		var data='';
		connection.query('select * from users', function(err,result){
			connection.query('select * from vehicules LIMIT 50', function(err,result2){
			data = JSON.stringify(result2)
			res.render('admin.ejs', {
				user:req.user,
				rows : result, // get the user out of session and pass to template
				rowsv : result2,
				data: data
			});
		});
	});
		console.log('teeeest');
		console.log(data);
});


// =====================================
// VEHICULE SECTION =========================
// =====================================
// we will want this protected so you have to be logged in to visit
// we will use route middleware to verify this (the isLoggedIn function)
app.get('/vehicule', isLoggedIn, function(req, res) {

  	connection.query('select * from vehicules', function(err,result2){
		res.render('vehicule.ejs', {
			 // get the user out of session and pass to template
			rowsv : result2
		});
});
});



app.get('/transfertvehicule', isLoggedIn, function(req, res) {

		connection.query('select * from vehicules where STATUT = "ON MOVE"', function(err,result){
		res.render('transfert_vehicule.ejs', {
			 // get the user out of session and pass to template
			rowsv : result,
			user: req.user
		});
});
});


app.get('/preparevehicule', isLoggedIn, function(req, res) {

		connection.query('select * from vehicules where STATUT = "MARSHALL"', function(err,result){
		res.render('prepare_vehicule.ejs', {
			 // get the user out of session and pass to template
			rowsv : result,
			user: req.user
		});
});
});


app.get('/recuperervehicule', isLoggedIn, function(req, res) {

		connection.query('select * from vehicules where STATUT = "ON HAND"', function(err,result){
		res.render('recuperer_vehicule.ejs', {
			 // get the user out of session and pass to template
			rowsv : result,
			user: req.user
		});
});
});

// =====================================
// COMPTES SECTION =========================
// =====================================
// we will want this protected so you have to be logged in to visit
// we will use route middleware to verify this (the isLoggedIn function)
app.get('/comptes', isLoggedIn, function(req, res) {

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

		connection.query('select * from Agence', function(err,result2){
		res.render('agence.ejs', {
			 // get the user out of session and pass to template
			rows : result2,
		  message: req.flash('success'),
			user : req.user

		});
});
});


app.post('/agences', function(req,res){
	var post = {
		id :"",
		nom : req.body.nom_agence,
		adresse : req.body.adresse_agence
	};
	connection.query('INSERT INTO Agence (idAgence, nom, adresse) VALUES (?,?,?)', [post.id, post.nom, post.adresse], function(err,result){
			if (err){
				req.flash("messages",{"error": "Une erreur est survenue"})
			} else {
				req.flash("messages",{"success" : "Agence ajoutée"});
				res.redirect("/agences");
			}
	});
});

// =====================================
// TACHE SECTION =========================
// =====================================
app.get('/assigner_tache', isLoggedIn, function(req, res) {

		connection.query('select * from Agence', function(err,result2){
		res.render('agence.ejs', {
			 // get the user out of session and pass to template
			rows : result2,
		  message: req.flash('success'),
			user : req.user

		});
});
});


app.post('/assigner_tache', function(req,res){
	var post = {
		id :"",
		nom : req.body.nom_agence,
		adresse : req.body.adresse_agence
	};
	connection.query('INSERT INTO Agence (idAgence, nom, adresse) VALUES (?,?,?)', [post.id, post.nom, post.adresse], function(err,result){
			if (err){
				req.flash("messages",{"error": "Une erreur est survenue"})
			} else {
				req.flash("messages",{"success" : "Agence ajoutée"});
				res.redirect("/agences");
			}
	});
});



// =====================================
// PARKING SECTION =========================
// =====================================
app.get('/parking', isLoggedIn, function(req, res) {

		connection.query('select * from Parking order by agence', function(err,result2){
			console.log(result2);
		res.render('parking.ejs', {
			 // get the user out of session and pass to template
			rows : result2,
		  message: req.flash('success'),
			user : req.user

		});
});
});

app.post('/parking', function(req,res){
	var post = {
		id :"",
		nom : req.body.nom_parking,
	};
	connection.query('INSERT INTO Parking (idParking, nom) VALUES (?,?)', [post.id, post.nom], function(err,result){
			if (err){
				req.flash("messages",{"error": "Une erreur est survenue"})
			} else {
				req.flash("messages",{"success" : "Parking ajouté"});
				res.redirect("/parking");
			}
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
}
