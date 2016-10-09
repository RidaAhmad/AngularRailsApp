ResetPasswordController = (AuthService) ->
  vm = this

  vm.user = {}
  vm.allowed_access = false

  if AuthService.is_authenticated()
    vm.allowed_access = true

  ResetPassword = ->
    AuthService.change_password(vm.user)

  vm.ResetPassword = ResetPassword

angular.module('angularApp').controller 'ResetPasswordController', ResetPasswordController
ResetPasswordController.$inject = [
  'AuthService'
]
