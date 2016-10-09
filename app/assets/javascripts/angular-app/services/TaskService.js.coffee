TaskService = ($resource, AuthService) ->
  $resource 'api/v1/tasks/:id', {},
    show:
      method: 'GET'
      headers:
        'Authorization' : AuthService.access_token()
    delete:
      method: 'DELETE'
      params: {id: @id}
      headers:
        'Authorization' : AuthService.access_token()
    update:
      method: 'PUT'
      params: {id: @id}
      headers:
        'Authorization' : AuthService.access_token()

angular.module('angularApp').service 'TaskService', TaskService
TaskService.$inject = [
  '$resource'
  'AuthService'
]
