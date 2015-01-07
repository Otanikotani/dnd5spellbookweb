angular
.module('classes', [
    'ui.router',
    'ngAnimate'
  ])

.config(
  ($stateProvider) ->
    $stateProvider.state 'classes',
      url: '/classes'
      views:
        main:
          controller: 'ClassesController'
          templateUrl: 'classes/classes.tpl.html'
      data:
        pageTitle: 'Pick a class')

.controller('ClassesController', ['$scope',
    ($scope) ->
      console.log 'Classes controller'
  ])
