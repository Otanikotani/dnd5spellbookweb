angular
.module('spells.domain', [
    'ngResource'
  ])

.factory('SpellsApi', ['$resource',
    ($resource) ->
      Spells: $resource('/assets/spells/spells.json', {}, {
        query: {method: 'GET', isArray: true}
      })
  ])
