TaskController = ($routeParams, $location, TaskService) ->
  vm = this

  vm.message = 'Message From the Task JS Controller!'
  vm.task = {}

  if $routeParams.id
    TaskService.show({id: $routeParams.id}).$promise.then((res) ->
      vm.task = res
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

  vm.DeleteTask = DeleteTask
  vm.UpdateTask = UpdateTask

angular.module('angularApp').controller 'TaskController', TaskController
TaskController.$inject = [
  '$routeParams'
  '$location'
  'TaskService'
]
