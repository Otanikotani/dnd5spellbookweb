angular
.module('fc.chart', [
    'ngResource'
  ])
.factory('ChartApi', ['$resource',
    ($resource) ->
      Charts: $resource('http://127.0.0.2:8888/assets/charts/:chartId.json', {}, {
        query: {method: 'GET', params: {chartId: 'charts'}}
      })
  ])

.directive('fcChart', ['ChartApi', (ChartApi) ->
  restrict: 'A'
  link: (scope, element, attrs) ->
    createGraph = (id, containerId, width, height, jsonData, graphType) ->
      FusionCharts(id).dispose() if FusionCharts.items[id]?
      graph = new FusionCharts graphType, id, width, height
      graph.setJSONData(jsonData.replace '&apos;', "'")
      graph.render containerId

    ChartApi.Charts.get {chartId: attrs.chartId}, (chart) ->
      createGraph attrs.id + 'graph', attrs.id, attrs.width, attrs.height, JSON.stringify(chart), attrs.graphType

])
