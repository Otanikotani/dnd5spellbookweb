angular.module('spellFilter', []).filter('favourites', () ->
  (input, byFav) ->
    if byFav
      _.filter(input, fav: true)
    else
      return input
)
