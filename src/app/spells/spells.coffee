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
      $scope.favs = false
      $scope.toggleActive = (spell) ->
        spell.fav = !spell.fav
      unfav = (spell) ->
        spell.fav = false

      $scope.currentClassName = ''

      $scope.setCurrentClass = (className) ->
        $scope.currentClassName = className

      $scope.classes = ClassesApi.Classes.query()

      $scope.spells = SpellsApi.Spells.query( () ->
        unfav spell  for spell in $scope.spells when !spell.fav?
        $scope.classes.$promise.then () ->
          for spell in $scope.spells
            spell.classes = []
            for dndclass in $scope.classes
              if spell.name in dndclass.spells
                spell.classes.push dndclass.name
      )

  ])
.directive('preventRedirect', () ->
  restrict: 'A'
  link: (scope, element, attrs) ->
    jQuery(element).on 'click', (event) ->
      event.preventDefault()
)
.directive('sideNav', () ->
  restrict: 'A'
  link: (scope, element, attrs) ->
    jQuery(element).sideNav()
)


