ProfileController = (AuthService, $http) ->
  vm = this

  vm.user = {}
  vm.allowed_access = false

  if AuthService.is_authenticated()
    id = AuthService.get_current_user().id

    AuthService.display_profile(AuthService.get_current_user().id).then ((user) ->
      vm.user = user;
      vm.allowed_access = true
    ), (error) ->
      return

angular.module('angularApp').controller 'ProfileController', ProfileController
ProfileController.$inject = [
  'AuthService'
  '$http'
]
