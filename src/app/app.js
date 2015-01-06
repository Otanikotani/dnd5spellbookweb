angular.module('ngBoilerplate', [
    'templates-app',
    'templates-common',
    'ngBoilerplate.home',
    'dashboard',
    'login',
    'about',
    'filters',
    'advert',
    'common.header',
    'common.util',
    'ui.router',
    'ui.multiselect',
    'ngAnimate',
    'chart.js',
    'pp',
    'fc.chart'
])

    .config(function myAppConfig($stateProvider, $urlRouterProvider) {
        $urlRouterProvider.otherwise('/dashboard');
    })

    .run(function run() {
    })

    .controller('AppController', function AppController($scope, $location) {
        FusionCharts.setCurrentRenderer('javascript');
        $scope.$on('$stateChangeSuccess', function (event, toState, toParams, fromState, fromParams) {
            if (angular.isDefined(toState.data.pageTitle)) {
                $scope.pageTitle = toState.data.pageTitle;
            }
        });
    })
;

