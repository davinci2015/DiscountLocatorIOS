var express   = require('express');
var mongo = require('mongodb');
var app       = express();
var bodyParser = require('body-parser');
var server    = require('http').createServer(app);
var mongoUtil = require('./mongoUtil');


mongoUtil.connect();

app.use(express.static(__dirname));
app.use(bodyParser.json());
app.set('view engine', 'jade');

app.get('/', function(req, res) {
	res.render(__dirname + '/index.jade');
});


app.get('/stores', function(req, res) {
	var db = mongoUtil.getDB();
	db.collection('store').find().toArray(function(err, result){
		if(!err && result.length){
			res.json(result);
		}
	});
});

app.post('/stores', function(req, res){
	var db = mongoUtil.getDB();

	var store = req.body;
	db.collection('store').insertOne(store);
	res.send('Store inserted');
})


app.put('/discount/:storeID', function(req, res){
	var db = mongoUtil.getDB();

	var discount = req.body;
	var storeID = req.params.storeID;
	var id = new mongo.ObjectID(storeID);
	db.collection('store').updateOne(
		{'_id': id},
		{ $push: {'discounts' : discount } }
	);
	res.send('Discount inserted');
})

server.listen(8000);


