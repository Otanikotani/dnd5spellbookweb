angular
.module('spells', [
    'ui.router',
    'spells.domain'
  ])

.config(
  ($stateProvider) ->
    $stateProvider.state 'spells',
      url: '/spells'
      views:
        main:
          controller: 'SpellsController'
          templateUrl: 'spells/spells.tpl.html'
      data:
        pageTitle: 'Spells')

.controller('SpellsController', ['$scope', 'SpellsApi'
    ($scope, SpellsApi) ->
      $scope.spells = SpellsApi.Spells.query()
  ])