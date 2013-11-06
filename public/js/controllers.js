var instasearchApp = angular.module('instasearchApp', []);

instasearchApp.controller('InstasearchFeedListCtrl', ['$scope', '$http',
  function InstasearchFeedListCtrl($scope, $http) {
    $http.get('/api/user/feed').success(function(data) {
      $scope.items = data;
    }); 
  }
]);
