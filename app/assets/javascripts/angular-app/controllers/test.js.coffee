angular.module('angularApp').controller 'TestController', [
  '$scope',
  '$http',
  ($scope, $http) ->
    $scope.message = 'Message From the Test JS Controller!'
]
