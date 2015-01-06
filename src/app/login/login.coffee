angular
.module('login', [
    'ui.router'
  ])

.config(
  ($stateProvider) ->
    $stateProvider.state 'login',
      url: '/login'
      views:
        main:
          controller: 'LoginController'
          templateUrl: 'login/login.tpl.html'
      data:
        pageTitle: 'Login')

.controller('LoginController', ['$scope',
    ($scope) ->
      console.log 'Login controller'
  ])
