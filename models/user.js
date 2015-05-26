

var knex = require('knex')({
  client: 'mysql',
  connection: {
    host     : '127.0.0.1',
    user     : 'root',
    password : 'root',
    database : 'dbUsers',
    charset  : 'utf8'
  }
});

var bookshelf = require('bookshelf')(knex);

var User = bookshelf.Model.extend({
   tableName: 'tblUsers',
   idAttribute: 'userId',
});

var Admin = bookshelf.Model.extend({
   tableName: 'tblAdmin',
   idAttribute: 'adminId',
});

module.exports = {
   User: User
};
