var MongoClient = require('mongodb').MongoClient;
var db;

module.exports = {
	connect: function(){
		MongoClient.connect('mongodb://localhost:27017/test', function(err, database){
			if(!err)
				db = database;
		});
	},
	getDB: function(){
		return db;
	}
}