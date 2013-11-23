var tagServices = angular.module('tag-services', ['ngResource']);

tagServices.factory('Tag', ['$resource',
  function($resource) {
    return $resource('/api/tag/:tag', {}, {
      query: { method: 'GET', params: {}, isArray: false }
    });
  }
]);


var feedServices = angular.module('feed-services', ['ngResource']);

feedServices.factory('Feed', ['$resource',
  function($resource) {
    return $resource('/api/user/feed', {}, {
      query: { method: 'GET', params: {}, isArray: false }
    });
  }
]);