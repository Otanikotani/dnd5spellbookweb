angular
.module('classes.domain', [
    'ngResource'
  ])

.factory('ClassesApi', ['$resource',
    ($resource) ->
      Spells: $resource('/assets/classes/classes.json', {}, {
        query: {method: 'GET', isArray: true}
      })
  ])
