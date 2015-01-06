angular
.module('dashboard.domain.advert', [
    'ngResource'
  ])

.factory('AdvertApi', ['$resource',
    ($resource) ->
      Adverts: $resource('http://127.0.0.2:8888/assets/adverts/:advertId.json', {}, {
        query: {method: 'GET', params: {advertId: 'adverts'}, isArray: true}
      })
  ])
