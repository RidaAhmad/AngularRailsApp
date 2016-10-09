UsersService = ($resource) ->
  $resource 'api/v1/users', {},
    create:
      method: 'POST'

angular.module('angularApp').service 'UsersService', UsersService
UsersService.$inject = [
  '$resource'
]
