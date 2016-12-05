CommentService = ($resource, AuthService) ->
  $resource 'api/v1/tasks/:task_id/comments/:id', {},
    delete:
      method: 'DELETE'
      params: {task_id: @task_id, id: @id}
      headers:
        'Authorization' : AuthService.access_token()

angular.module('angularApp').service 'CommentService', CommentService
CommentService.$inject = [
  '$resource'
  'AuthService'
]
