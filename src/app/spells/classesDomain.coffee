angular
.module('classes.domain', [
    'ngResource'
  ])

.factory('ClassesApi', ['$resource',
    ($resource) ->
      Classes: $resource('/assets/classes/classes.json', {}, {
        query: {method: 'GET', isArray: true}
      })
  ])
