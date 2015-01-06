angular
.module('dashboard.domain', [
    'dashboard.domain.advert'
  ])

.factory('DashboardApi', ['AdvertApi',
    (AdvertApi) ->
      advert: AdvertApi
  ])
