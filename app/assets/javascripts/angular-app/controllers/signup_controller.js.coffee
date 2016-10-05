SignupController = (AuthService) ->
  vm = this

  vm.user = {}

  Signup = ->
    AuthService.signup(vm.user)

  vm.Signup = Signup

angular.module('angularApp').controller 'SignupController', SignupController
SignupController.$inject = [
  'AuthService'
]
