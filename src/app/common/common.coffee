angular
.module('common.util', [])

.factory('ArraysUtil', [
    () ->
      chunk: (array, chunkSize) ->
        result = _.groupBy array, (element, index) ->
          Math.floor index / chunkSize
        _.toArray result
  ])
.directive('tooltip', () ->
  restrict: 'A'
  link: (scope, element, attrs) ->
    jQuery(element).tooltip()
)
.directive('rangeSlider', () ->
  replace: true
  restrict: 'E'
  scope:
    title: '@'
    valueOptions: '='
  templateUrl: 'common/range-slider.tpl.html'
  link: (scope, element, attrs) ->
    sliderElement = jQuery(element).find '.slider-range'
    amountElement = jQuery(element).find '.slider-range-amount'
    sliderElement.slider(
      range: true
      min: scope.valueOptions.min || scope.valueOptions.values[0]
      max: scope.valueOptions.max || scope.valueOptions.values[1]
      values: scope.valueOptions.values
      slide: (event, ui) ->
        amountElement.html ui.values[0] + ' - ' + ui.values[1]
        scope.valueOptions.values = ui.values
        scope.$apply()
        return
    )
    amountElement.html(sliderElement.slider('values', 0) + ' - ' + sliderElement.slider('values', 1))
)
.directive('preventRedirect', () ->
  restrict: 'A'
  link: (scope, element, attrs) ->
    jQuery(element).on 'click', (event) ->
      event.preventDefault()
)
.directive('modal', () ->
  restrict: 'A'
  transclude: true
  link: (scope, element, attrs) ->
    jQuery(element).modal()
)
.directive('responsiveButton', () ->
  restrict: 'E'
  replace: 'true'
  scope:
    title: '@'
    icon: '@'
    btnClass: '@'
  templateUrl: 'common/responsiveButton.tpl.html'
)
.directive('treeView', () ->
  restrict: 'A'
  replace: 'true'
  link: (scope, element, attrs) ->

    tree = [
      {
        text: "Parent 1",
        nodes: [
          {
            text: "Child 1",
            nodes: [
              {
                text: "Grandchild 1"
              },
              {
                text: "Grandchild 2"
              }
            ]
          },
          {
            text: "Child 2"
          }
        ]
      },
      {
        text: "Parent 2"
      },
      {
        text: "Parent 3"
      },
      {
        text: "Parent 4"
      },
      {
        text: "Parent 5"
      }
    ]
    jQuery(element).treeview({data: tree})
)