var instasearchApp = angular.module('instasearchApp', ['google-maps', 'tag-services', 'feed-services']);

instasearchApp.controller('TagListController', ['$scope', 'Tag',
  function TagListCtrl($scope, Tag) {
    $scope.header_text = "YOYOYOYO";

    $scope.init = function() {
      var tag = window.location.pathname.split('/tag/')[1];
      Tag.query({tag: tag}).$promise.then($scope.setTagData);
    }

    $scope.setTagData = function(data) {
      if (data.meta && data.meta.code == 200) {
        if ($scope.items == null) {
          $scope.items = data.data;
        } else {
          $scope.items = $scope.items.concat(data.data);
        }

        if (data.next_api_params) {
          $scope.next_api_params = data.next_api_params;
        }

        $scope.items.range = function() {
          var range = [];
          for(var i=0; i < $scope.items.length; i+=4) {
            range.push(i); 
          }
          return range;
        }
      }
    }

    $scope.getNextSet = function() {
      if ($scope.next_api_params) {
        Tag.query($scope.next_api_params).$promise.then($scope.setTagData);
      }
    }
  }
]);

instasearchApp.controller('InstasearchFeedListController', ['$scope', 'Feed',
  function InstasearchFeedListCtrl($scope, Feed) {
    $scope.header_text = "My Feed.";

    $scope.init = function() {
      Feed.query().$promise.then($scope.setFeedData);
    }

    $scope.setFeedData = function(data) {
      if (data.meta && data.meta.code == 200) {
        if ($scope.items == null) {
          $scope.items = data.data;
        } else {
          $scope.items = $scope.items.concat(data.data);
        }

        if (data.next_api_params) {
          $scope.next_api_params = data.next_api_params;
        }

        $scope.items.range = function() {
          var range = [];
          for(var i=0; i < $scope.items.length; i+=4) {
            range.push(i); 
          }
          return range;
        }
      }
    }

    $scope.getNextSet = function() {
      if ($scope.next_api_params) {
        Feed.query($scope.next_api_params).$promise.then($scope.setFeedData);
      }
    }
  }
]);
