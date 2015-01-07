angular.module('spellFilter', []).filter('favourites', () ->
  (input, byFav) ->
    if byFav
      _.filter input, fav: true
    else
      return input
)
.filter("sanitize", ['$sce', ($sce) ->
  (htmlCode) ->
    $sce.trustAsHtml htmlCode
])
.filter("hasClass", [() ->
  (input, className) ->
    if className and className != ''
      _.filter input, (spell) ->
        className in spell.classes
    else
      return input
])
