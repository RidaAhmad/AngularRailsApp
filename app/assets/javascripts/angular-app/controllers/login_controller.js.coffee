LoginController = (AuthService) ->
  vm = this

  vm.user = {}

  Login = ->
    AuthService.login(vm.user)

  vm.Login = Login

angular.module('angularApp').controller 'LoginController', LoginController
LoginController.$inject = [
  'AuthService'
]
