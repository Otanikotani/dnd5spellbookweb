angular.module('ngBoilerplate', [
    'templates-app',
    'templates-common',
    'spells',
    'spellFilter',
    'spells.domain'
])

    .config(function myAppConfig($stateProvider, $urlRouterProvider) {
        $urlRouterProvider.otherwise('/spells');
    })

    .run(function run() {
    })

    .controller('AppController', function AppController($scope, $location) {
        $scope.$on('$stateChangeSuccess', function (event, toState, toParams, fromState, fromParams) {
            if (angular.isDefined(toState.data.pageTitle)) {
                $scope.pageTitle = toState.data.pageTitle;
            }
        });
    })
;

