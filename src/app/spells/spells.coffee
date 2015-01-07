angular
.module('spells', [
    'ui.router',
    'spells.domain',
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

.controller('SpellsController', ['$scope', 'SpellsApi'
    ($scope, SpellsApi) ->
      LOAD_BY = 8
      loaded = LOAD_BY * 2
      overall = 0
      loadedSpells = []

      unfav = (spell) ->
        spell.fav = false

      allSpells = SpellsApi.Spells.query( () ->
        unfav spell  for spell in allSpells when !spell.fav?
        $scope.spells = allSpells.slice(0, loaded)
        loadedSpells = $scope.spells
        overall = allSpells.length
      )

      $scope.favs = false


      $scope.toggleActive = (spell) ->
        spell.fav = !spell.fav

      $scope.addSpells = () ->
        console.log 'Adding more spells'
        if loaded < overall
          nextLimit =  if loaded + LOAD_BY > overall then overall else loaded + LOAD_BY
          $scope.spells = $scope.spells.concat allSpells.slice(loaded, nextLimit)
          loaded = nextLimit
  ])
.directive('preventRedirect', () ->
  restrict: 'A'
  link: (scope, element, attrs) ->
    jQuery(element).on 'click', (event) ->
      event.preventDefault()
)

