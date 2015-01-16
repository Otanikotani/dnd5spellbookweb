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
      $scope.classesColors = {}
      $scope.classesColors['all'] = '#a1887f'
      $scope.spellName = ''
      $scope.toggleActive = (spell) ->
        spell.fav = !spell.fav
      unfav = (spell) ->
        spell.fav = false
      addColor = (dndclass) ->
        $scope.classesColors[dndclass.name] = dndclass.color

      $scope.currentClassName = 'all'

      $scope.setCurrentClass = (className) ->
        $scope.currentClassName = className


      $scope.classes = ClassesApi.Classes.query () ->
        addColor dndclass for dndclass in $scope.classes

      $scope.spells = SpellsApi.Spells.query( () ->
        unfav spell  for spell in $scope.spells when !spell.fav?
        $scope.classes.$promise.then () ->
          for spell in $scope.spells
            spell.classes = []
            for dndclass in $scope.classes
              for spellsByLevel in dndclass.spellsByLevels
                if spell.name in spellsByLevel.spells
                  spell.classes.push dndclass.name
      )

      $scope.$watch 'spellName', _.debounce((spellName) ->
        $scope.$apply () ->
          $scope.filterQuery = $scope.spellName
      , 350)

      $scope.getLiClass = (dndclass) ->
        if $scope.currentClassName == dndclass.name
          dndclass.name + ' active';
        else
          dndclass.name
      return
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
.directive('autoFocus', ($timeout) ->
  restrict: 'AC',
  link: (scope, element) ->
    $timeout () ->
      element[0].focus()
)


