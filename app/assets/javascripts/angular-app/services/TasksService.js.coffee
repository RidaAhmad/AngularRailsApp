TasksService = ($resource) ->
  $resource 'api/v1/tasks', {},
    query:
      method: 'GET'
      isArray: true
    create:
      method: 'POST'

angular.module('angularApp').service 'TasksService', TasksService
TasksService.$inject = [
  '$resource'
]
