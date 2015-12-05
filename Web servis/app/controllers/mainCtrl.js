angular.module('application')
	.controller('mainCtrl', ['$http', function($http){
		var controller = this;
		controller.stores = [];
		controller.insertStore = 1;

		controller.store = {
			name : '',
			desc : '',
			lat : '',
			lng : '',
			imgUrl : ''
		}

		controller.discount = {
			name : '',
			startDate : '',
			endDate: '',
			desc : '',
			discount: '',
		}

		controller.AddStore = function(){
			$http({
				url: 'https://obscure-lake-7668.herokuapp.com/stores',
				method: 'POST',
				data: controller.store,
				headers: {'Content-Type': 'application/json'}
			}).success(function(res){
				location.reload();
			}).error(function(err){
				alert("Error #1");
			});
		};

		controller.UpdateStore = function(){
			$http({
				url: 'https://obscure-lake-7668.herokuapp.com/stores/' + controller.StoreIdForUpdate,
				method: 'PUT',
				data: controller.store,
				headers: {'Content-Type': 'application/json'}
			}).success(function(res){
				location.reload();
			}).error(function(err){
				alert("Error #4");
			});
		};

		controller.DeleteStore = function(storeID){
			$http({
				url: 'https://obscure-lake-7668.herokuapp.com/stores/' + storeID,
				method: 'DELETE',
				headers: {'Content-Type': 'application/json'}
			}).success(function(res){
				location.reload();
			}).error(function(err){
				alert("Error #5");
			});

		};


		controller.AddDiscount = function(){
			$http({
				url: 'https://obscure-lake-7668.herokuapp.com/discount/' + controller.storeID,
				method: 'PUT',
				data: controller.discount,
				headers: {'Content-Type': 'application/json'}
			}).success(function(res){
				alert(res);
				location.reload();
			}).error(function(err){
				alert("Error #3");
			});
		};

		controller.FillUpdateStore = function(storeID){
			controller.insertStore = 0;
			$('#myTabs a[href="#addStore"]').tab('show');
			for(key in controller.stores)
				if(controller.stores[key]._id == storeID){
					controller.store.name   = controller.stores[key].name;
					controller.store.desc   = controller.stores[key].desc;
					controller.store.lat    = controller.stores[key].lat;
					controller.store.lng    = controller.stores[key].lng;
					controller.store.imgUrl = controller.stores[key].imgUrl;
				}
			controller.StoreIdForUpdate = storeID;
		};
		//FETCH STORES
		$http({
				url: 'https://obscure-lake-7668.herokuapp.com/stores',
				method: 'GET',
			}).success(function(res){
				controller.stores = res;
				console.log(res);
			}).error(function(err){
				alert("Error #2");
		});
	}]);