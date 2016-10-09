EditProfileController = (AuthService) ->
  vm = this

  vm.user = {}
  vm.allowed_access = false

  if AuthService.is_authenticated()
    vm.allowed_access = true

  EditProfile = ->
    if AuthService.is_authenticated()
      vm.user.email = AuthService.get_current_user().email
      vm.user.id = AuthService.get_current_user().id
      AuthService.edit_profile(vm.user)

  vm.EditProfile = EditProfile

angular.module('angularApp').controller 'EditProfileController', EditProfileController
EditProfileController.$inject = [
  'AuthService'
]
