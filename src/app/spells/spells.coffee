angular
.module('spells', [
    'ui.router',
    'spells.domain',
    'classes.domain',
    'infinite-scroll',
    'spellFilter',
    'ngAnimate'
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

.controller('SpellsController', ['$scope', 'SpellsApi', 'ClassesApi',
    ($scope, SpellsApi, ClassesApi) ->
      unfav = (spell) ->
        spell.fav = false

      $scope.spells = SpellsApi.Spells.query( () ->
        unfav spell  for spell in $scope.spells when !spell.fav?
      )

      $scope.favs = false


      $scope.toggleActive = (spell) ->
        spell.fav = !spell.fav
  ])
.directive('preventRedirect', () ->
  restrict: 'A'
  link: (scope, element, attrs) ->
    jQuery(element).on 'click', (event) ->
      event.preventDefault()
)

