angular
.module('dashboard', [
    'ui.router',
    'dashboard.domain',
    'common.util',
    'advert',
    'ngAnimate'
  ])

.config(
  ($stateProvider) ->
    $stateProvider.state 'dashboard',
      url: '/dashboard'
      views:
        main:
          controller: 'DashboardController'
          templateUrl: 'dashboard/dashboard.tpl.html'
      data:
        pageTitle: 'Dashboard')

.controller('DashboardController', ['$scope', 'ArraysUtil',
    ($scope, ArraysUtil) ->
      $scope.advertMap = {
        'overpriced': ({
        name: 'Advert ' + i,
        visibility: true,
        target: 'overpriced'
        } for i in [1..10]),
        'underpriced': ({
        name: 'Advert ' + i,
        visibility: true,
        target: 'underpriced'
        } for i in [51..100]),
        'hidden': ({
        name: 'Advert ' + i,
        visibility: false,
        target: 'overpriced'
        } for i in [100..101])
      }

      $scope.toggle = (advert) ->
        listKeyToAppend = advert.target
        listKeyToRemove = 'hidden'
        if advert.visibility
          listKeyToAppend = 'hidden'
          listKeyToRemove = advert.target
        $scope.advertMap[listKeyToAppend].push(advert)
        $scope.advertMap[listKeyToRemove] =
          _.reject $scope.advertMap[listKeyToRemove], (item) ->
            item.name == advert.name
        advert.visibility = !advert.visibility

      $scope.open = (advert) ->
        $scope.dialogAdvert = advert
  ])
.directive('dashboardPanel', () ->
  restrict: 'E'
  scope:
    adverts: '='
    toggle: '='
    open: '='
    name: '@'
  templateUrl: 'dashboard/dashboardPanel.tpl.html'
)
.directive('averageKpi', () ->
  restrict: 'E'
  scope:
    advertMap: '='
  templateUrl: 'dashboard/averageKpi.tpl.html'
)
.directive('generalAdvertInfo', () ->
  restrict: 'E'
  templateUrl: 'dashboard/generalAdvertInfo.tpl.html'
  link: (scope, element, attrs) ->
    scope.dealerships = [
      id: 1
      name: 'Vertu Honda Boston'
    ,
      id: 2
      name: 'Vertu Honda Durham'
    ,
      id: 3
      name: 'Vertu Honda Henland'
    ]
    scope.selectedDealerships = [
    ]

    scope.labels = ['On target', 'Overpriced', 'Underpriced']
    scope.data = [270, 35, 40]
    scope.colours = [
      fillColor: 'rgba(26, 108, 199,0.2)'
      strokeColor: 'rgba(26, 108, 199,1)'
      pointColor: 'rgba(26, 108, 199,1)'
      pointStrokeColor: '#fff'
      pointHighlightFill: '#fff'
      pointHighlightStroke: 'rgba(26, 108, 199,0.8)'
    ,
      fillColor: 'rgba(240, 0, 94,0.2)'
      strokeColor: 'rgba(240, 0, 94,1)'
      pointColor: 'rgba(240, 0, 94,1)'
      pointStrokeColor: '#fff'
      pointHighlightFill: '#fff'
      pointHighlightStroke: 'rgba(240, 0, 94,0.8)'
    ,
      fillColor: 'rgba(63, 182, 24,0.2)'
      strokeColor: 'rgba(63, 182, 24,1)'
      pointColor: 'rgba(63, 182, 24,1)'
      pointStrokeColor: '#fff'
      pointHighlightFill: '#fff'
      pointHighlightStroke: 'rgba(63, 182, 24,0.8)'
    ]
)
.directive('chartVehicleCount', () ->
  restrict: 'E'
  scope:
    advertMap: '='
  link: (scope, element, attrs) ->
    scope.$watchCollection 'advertMap', () ->

)




