angular
.module('about', [
    'fc.chart'
])
.config(
  ($stateProvider) ->
    $stateProvider.state 'about',
      url: '/about'
      views:
        main:
          controller: 'AboutController'
          templateUrl: 'about/about.tpl.html'
      data:
        pageTitle: 'About')

.controller('AboutController', ['$scope', 'ChartApi', ($scope, ChartApi) ->
    console.log 'About controller'
])
