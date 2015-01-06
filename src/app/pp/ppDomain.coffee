angular
.module('pp.domain', [
    'ngResource'
  ])

.factory('PPApi', ['$resource',
    ($resource) ->
      PricingPolicies: $resource('http://127.0.0.2:8888/assets/PricingPolicies/:ppId.json', {}, {
        query: {method: 'GET', params: {ppId: 'pricingPolicies'}, isArray: true}
      })
  ])
