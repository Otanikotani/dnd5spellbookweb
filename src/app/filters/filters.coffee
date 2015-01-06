angular
.module('filters', [
    'ui.router',
    'common.util',
    'advert',
    'ngAnimate'
  ])

.config(
  ($stateProvider) ->
    $stateProvider.state 'filters',
      url: '/filters'
      views:
        main:
          controller: 'FiltersController'
          templateUrl: 'filters/filters.tpl.html'
      data:
        pageTitle: 'Filters')

.controller('FiltersController', ['$scope', 'ArraysUtil',
    ($scope, ArraysUtil) ->
      $scope.advertStatuses = [
        id: 1
        name: 'Active'
      ,
        id: 2
        name: 'Disabled'
      ]
      $scope.selectedAdvertStatuses = []
      $scope.selectedAdvertStatuses = [ $scope.advertStatuses[0] ]

      $scope.daysAtThisPriceOptions =
        values: [0, 100]

      $scope.daysAdvertisedOptions =
        values: [0, 200]

      $scope.askingPriceOptions =
        values: [0, 20000]

      $scope.portals = [
        id: 1
        name: 'Autofr'
      ,
        id: 2
        name: 'Uktools'
      ]
      $scope.selectedPortals = []

      $scope.dealershipLocations = [
        id: 1
        name: 'Vertu Honda Boston'
      ,
        id: 2
        name: 'Vertu Honda Doncaster'
      ]
      $scope.selectedDealershipLocations = []

      $scope.numberOfPriceChangesOptions =
        values: [0, 10]

      $scope.mileageOptions =
        values: [0, 200000]

      $scope.numberOfDoorsOptions =
        values: [2, 5]

      $scope.ageOptions =
        values: [0, 14]

      $scope.bodies = [
        id: 1
        name: 'Convertible'
      ,
        id: 2
        name: 'Estate'
      ]
      $scope.selectedBodies = []

      $scope.gearboxes = [
        id: 1
        name: 'Automatic'
      ,
        id: 2
        name: 'Manual'
      ]
      $scope.selectedGearboxes = []

      $scope.fuels = [
        id: 1
        name: 'Diesel'
      ,
        id: 2
        name: 'Hybrid'
      ]
      $scope.selectedFuels = []

      $scope.drives = [
        id: 1
        name: 'Front wheel drive'
      ,
        id: 2
        name: 'Rear wheel drive'
      ]
      $scope.selectedDrives = []

      $scope.makes = [
        id: 1
        name: 'Alfa romeo'
      ,
        id: 2
        name: 'BMW'
      ]
      $scope.selectedMakes = []

      $scope.models = [
        id: 1
        name: 'X1'
      ,
        id: 2
        name: 'Z8'
      ]
      $scope.selectedModels = []

      $scope.regions = [
        id: 1
        name: 'Alsace'
       ,
        id: 2
        name: 'Paris'
      ]
      $scope.selectedRegions = []

      $scope.tags = [
        id: 1
        label: 'Status: active'
       ,
        id: 2
        label: 'Body: coupe'
       ,
        id: 3
        label: 'Days advertised: 0 - 100'
      ]

      $scope.removeTag = (tag) ->
        console.log 'Removing tag with label', tag.label

      $scope.searchResults = ({
        name: 'Advert ' + i
        visibility: true
        target: 'overpriced'
      } for i in [0..50])

      $scope.toggle = (advert) ->
        console.log 'Toggled advert', advert
  ])




