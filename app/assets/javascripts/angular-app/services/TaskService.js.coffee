TaskService = ($resource) ->
  $resource 'api/v1/tasks/:id', {},
    show:
      method: 'GET'
    delete:
      method: 'DELETE'
      params: {id: @id}
    update:
      method: 'PUT'
      params: {id: @id}

angular.module('angularApp').service 'TaskService', TaskService
TaskService.$inject = [
  '$resource'
]
