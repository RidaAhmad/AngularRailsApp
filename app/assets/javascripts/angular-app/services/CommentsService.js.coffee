CommentsService = ($resource, AuthService) ->
  $resource 'api/v1/tasks/:task_id/comments', {},
    create:
      method: 'POST'
      params: {task_id: @task_id}
      headers:
        'Authorization' : AuthService.access_token()

angular.module('angularApp').service 'CommentsService', CommentsService
CommentsService.$inject = [
  '$resource'
  'AuthService'
]
