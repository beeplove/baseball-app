angular.module('Baseball', ['filters']);

angular.module('filters', []).
    filter('getter', function () {
        return function (player, key) {
            return player[key.toLowerCase()];
        };
    });



function PlayerCtrl($scope, $http) {
    $scope.selectedHeader = 'avg';
    $scope.predicate = '-avg';
    $scope.reverse = false; // default is descending which is going to be considered as true


    $scope.onClickHeader = function(header) {
        if ($scope.selectedHeader === header.toLowerCase()) {
            $scope.reverse = !($scope.reverse);
        } else {
            $scope.reverse = false;
        }

        $scope.selectedHeader = header.toLowerCase();
        $scope.predicate = ($scope.reverse ? '+' : '-') + $scope.selectedHeader;
    }

    $http({method: 'GET', url: '/data/players.json'}).
        success(function(data, status) {
            $scope.headers = data.headers;
            $scope.players = data.data;
        }).
        error(function(data, status) {
            alert("Sorry, players data is not available, please try again later.");
            $scope.headers = [];
            $scope.players = [];
        });
}
