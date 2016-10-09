MainController = (TasksService, $scope) ->
  vm = this

  vm.tasks = TasksService.query()
  vm.task = {}

  CreateTask = ->
    TasksService.create({task: vm.task}).$promise.then((res) ->
      vm.tasks.push(res)
      vm.task = {}
      alert('Task Created Successfully!')
      return
    ).catch (err) ->
      alert('Error! Unable to create task.')
      throw err
      return

  $scope.$watchCollection 'tasks', () ->
    console.log('Tasks Modified!')

  vm.CreateTask = CreateTask

angular.module('angularApp').controller 'MainController', MainController
MainController.$inject = [
  'TasksService'
  '$scope'
]
