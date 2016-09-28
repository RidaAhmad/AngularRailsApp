angular.module('angularApp').controller 'MainController', [
  '$scope',
  '$http',
  ($scope, $http) ->
    $scope.message = 'Message From the Main JS Controller!'
]
