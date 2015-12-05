var MongoClient = require('mongodb').MongoClient;
var db;

module.exports = {
	connect: function(){
		MongoClient.connect('mongodb://<user>:<password>@ds061374.mongolab.com:61374/discountlocator', function(err, database){
			if(!err)
				db = database;
		});
	},
	getDB: function(){
		return db;
	}
}