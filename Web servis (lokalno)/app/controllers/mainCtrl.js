angular.module('application')
	.controller('mainCtrl', ['$http', function($http){
		var controller = this;
		controller.stores = [];

		var store = {
			name : '',
			desc : '',
			lat : '',
			lng : '',
			imgUrl : ''
		}

		var discount = {
			name : '',
			startDate : '',
			endDate: '',
			desc : '',
			discount: '',
		}

		controller.AddStore = function(){
			$http({
				url: 'http://localhost:8000/stores',
				method: 'POST',
				data: controller.store,
				headers: {'Content-Type': 'application/json'}
			}).success(function(res){
				alert(res);
				for(var key in controller.store)
					controller.store[key] = '';
			}).error(function(err){
				alert("Error #1");
			});
		};

		controller.AddDiscount = function(){
			$http({
				url: 'http://localhost:8000/discount/' + controller.storeID,
				method: 'PUT',
				data: controller.discount,
				headers: {'Content-Type': 'application/json'}
			}).success(function(res){
				alert(res);
				for(var key in controller.discount)
					controller.discount[key] = '';
			}).error(function(err){
				alert("Error #3");
			});
		};

		//FETCH STORES
		$http({
				url: 'http://localhost:8000/stores',
				method: 'GET',
			}).success(function(res){
				controller.stores = res;
			}).error(function(err){
				alert("Error #2");
		});
	}]);