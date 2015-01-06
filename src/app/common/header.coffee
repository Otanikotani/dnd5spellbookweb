angular.module('common.header', [
])
.directive('header', [() ->
  restrict: 'E',
  templateUrl: 'common/header.tpl.html',
  scope:
    protocol: '='
  link: ($scope, elem, attrs) ->
    console.log('Header link() call')
])
