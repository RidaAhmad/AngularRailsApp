TaskController = ($routeParams, $location, TaskService, AuthService, CommentsService, CommentService) ->
  vm = this

  vm.task = {}
  vm.allowed_access = false
  vm.isLoggedIn = false
  vm.comments = {}
  vm.comment = {}
  vm.current_user_id = null

  if AuthService.is_authenticated()
    vm.isLoggedIn = true
    vm.current_user_id = AuthService.get_current_user().id

  if $routeParams.id
    TaskService.show({id: $routeParams.id}).$promise.then((res) ->
      vm.task = res
      vm.comments = res.comments
      vm.allowed_access = AuthService.access_allowed(vm.task.user_id)
      return
    ).catch (err) ->
      alert('Error! Unable to display task.')
      throw err
      return

  DeleteTask = ->
    if $routeParams.id
      TaskService.delete({id: $routeParams.id}).$promise.then((res) ->
        alert('Task Deleted Successfully!')
        $location.path('/tasks')
        return
      ).catch (err) ->
        alert('Error! Unable to delete task.')
        throw err
        return
    else
      alert('Task ID Missing!')

  UpdateTask = ->
    if $routeParams.id
      TaskService.update({id: $routeParams.id}, vm.task).$promise.then((res) ->
        alert('Task Updated Successfully!')
        return
      ).catch (err) ->
        alert('Error! Unable to update task.')
        throw err
        return
    else
      alert('Task ID Missing!')

  AddComment = ->
    if $routeParams.id
      CommentsService.create({task_id: $routeParams.id}, vm.comment).$promise.then((res) ->
        vm.comments.push(res)
        alert('Comment Added Successfully!')
        return
      ).catch (err) ->
        alert('Error! Unable to add comment.')
        throw err
        return
    else
      alert('Task ID Missing!')

  DeleteComment = (comment) ->
    if $routeParams.id
      CommentService.delete({task_id: $routeParams.id, id: comment.id}).$promise.then((res) ->
        alert('Comment Deleted Successfully!')
        $location.path('/tasks')
        return
      ).catch (err) ->
        alert('Error! Unable to delete comment.')
        throw err
        return
    else
      alert('Task ID Missing!')

  vm.DeleteTask = DeleteTask
  vm.UpdateTask = UpdateTask
  vm.AddComment = AddComment
  vm.DeleteComment = DeleteComment

angular.module('angularApp').controller 'TaskController', TaskController
TaskController.$inject = [
  '$routeParams'
  '$location'
  'TaskService'
  'AuthService'
  'CommentsService'
  'CommentService'
]
