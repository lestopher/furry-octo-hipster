var instasearchApp = angular.module('instasearchApp', []);

instasearchApp.controller('InstasearchFeedListCtrl', ['$scope', '$http',
  function InstasearchFeedListCtrl($scope, $http) {
    $http.get('/fixtures/feed.json').success(function(data) {
      $scope.items = data;
      
      $scope.items.range = function() {
        var range = [];
        for(var i=0; i < $scope.items.length; i+=4) {
          range.push(i); 
        }
        return range;
      }
    });

  }
]);
