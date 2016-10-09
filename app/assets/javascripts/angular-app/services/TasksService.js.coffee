TasksService = ($resource, AuthService) ->
  $resource 'api/v1/tasks', {},
    query:
      method: 'GET'
      isArray: true
    create:
      method: 'POST'
      headers:
        'Authorization' : AuthService.access_token()

angular.module('angularApp').service 'TasksService', TasksService
TasksService.$inject = [
  '$resource'
  'AuthService'
]
