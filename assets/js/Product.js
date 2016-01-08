'use strict';

var angular = angular,
    jquery  = jquery;

var app = angular.module('ExampleDockerSails', ['ngResource']);

app.factory('ProductResource', ['$resource', function ($resource) {
  return $resource('/product/:id', null, {
    update: {method: 'PUT'},
    get   : {method: 'GET', isArray: true}
  });
}]);

app.controller('ProductCtrl', ['$scope', 'ProductResource', function ($scope, ProductResource) {
  $scope.products = [];

  // fetch product
  $scope.fetch = function () {
    ProductResource.get().$promise
      .then(function (_products) {
        $scope.products = _products;
      })
      .catch(console.log);
  };

  // create product
  $scope.create = function () {
    var data = {
      name : $scope.data.name,
      price: $scope.data.price
    };

    ProductResource.save(data).$promise
      .then(function () {
        $scope.fetch();
      })
      .catch(console.log);
  };

  // fetch at start
  $scope.fetch();
}]);