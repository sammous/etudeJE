var express=require('express');
var app=express();
var  mysql=require('mysql');

var connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',
  password : '123456',
  database : 'my_schema'
});

connection.connect();

app.set('views',__dirname + '/views');
app.use(express.static(__dirname + '/JS'));
app.set('view engine', 'ejs');
app.engine('html', require('ejs').renderFile);

app.get('/',function(req,res){
res.render('index.ejs');
});

app.get('/search',function(req,res){
connection.query('use my_schema;');
connection.query('SELECT * from users where id like '+req.query.key+'', function(err, rows, fields) {
    //console.log('SELECT id from users where id = '+req.query.key+';');
	  if (err) throw err;
    var data=[];
    for(i=0;i<rows.length;i++)
      {
        console.log(rows);
        data.push(rows[i].username);
      }
    res.end(JSON.stringify(data));
  //  res.end(toString(rows[i].username))	;
  });
});


var server=app.listen(8080,function(){
console.log("Magic is happening in port 8080");
});
