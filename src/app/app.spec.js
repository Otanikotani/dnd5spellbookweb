describe('AppCtrl', function () {
    describe('isCurrentUrl', function () {
        var AppCtrl, $location, $scope;

        beforeEach(module('ngBoilerplate'));

        beforeEach(inject(function ($controller, _$location_, $rootScope) {
            $location = _$location_;
            $scope = $rootScope.$new();
            AppController = $controller('AppController', {$location: $location, $scope: $scope});
        }));

        it('should pass a dummy test', inject(function () {
            expect(AppController).toBeTruthy();
        }));
    });
});
