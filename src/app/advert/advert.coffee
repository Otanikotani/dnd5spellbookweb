angular
.module('advert', [
    'common.util'
    'dashboard.domain.advert'
  ])
.config(
  ($stateProvider) ->
    $stateProvider.state 'adverts',
      url: '/adverts/:id'
      views:
        main:
          controller: 'AdvertController'
          templateUrl: 'advert/advert.tpl.html'
      data:
        pageTitle: 'Advert')

.controller('AdvertController', ['$scope', '$stateParams', 'ArraysUtil', 'AdvertApi',
    ($scope, $stateParams, ArraysUtil, AdvertApi) ->
      calculatePriceChangeDiff = (advert) ->
        advert.askingPrice - advert.advertPriceHistories[0].oldPrice

      AdvertApi.Adverts.get {advertId: $stateParams.id}, (advert) ->
        $scope.advert = advert
        $scope.priceChangeDiff = calculatePriceChangeDiff(advert)
])
.directive('advertCarousel', ['ArraysUtil', (ArraysUtil) ->
    restrict: 'E'
    scope:
      adverts: '='
      name: '@'
      toggle: '='
      open: '='
    replace: true
    templateUrl: 'advert/advertCarousel.tpl.html'
    link: (scope, element, attrs) ->
      scope.$watchCollection 'adverts', () ->
        scope.slides = ArraysUtil.chunk scope.adverts, 4
        scope.largeSlides = ArraysUtil.chunk scope.adverts, 2
        scope.mobileSlides = ArraysUtil.chunk scope.adverts, 1
  ])
.directive('advertTable', [() ->
    restrict: 'E'
    scope:
      adverts: '='
      name: '@'
      toggle: '='
      open: '='
    replace: true
    templateUrl: 'advert/advertTable.tpl.html'
  ])
.directive('advertGrid', [() ->
    restrict: 'E'
    scope:
      adverts: '='
      name: '@'
      toggle: '='
      open: '='
    replace: true
    templateUrl: 'advert/advertGrid.tpl.html'
  ])

.directive('advertThumbnail', () ->
  restrict: 'E'
  scope:
    advert: '='
    toggle: '='
    open: '='
  templateUrl: 'advert/advertThumbnail.tpl.html'
  )



