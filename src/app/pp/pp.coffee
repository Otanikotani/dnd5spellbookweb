angular
.module('pp', [
    'ui.router',
    'pp.domain'
  ])

.config(
  ($stateProvider) ->
    $stateProvider.state 'pricingPolicies',
      url: '/pricingPolicies'
      views:
        main:
          controller: 'PricingPoliciesController'
          templateUrl: 'pp/pp.tpl.html'
      data:
        pageTitle: 'Pricing Policies')

.controller('PricingPoliciesController', ['$scope', 'PPApi'
    ($scope, PPApi) ->
      policies = PPApi.PricingPolicies.query () ->
        $scope.groupPolicies = _.filter policies, type: 'group'
        $scope.dealerPolicies = _.filter policies, type: 'dealer'
        console.log $scope.groupPolicies
  ])
