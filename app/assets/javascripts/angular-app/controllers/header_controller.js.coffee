HeaderController = (AuthService) ->
  vm = this

  vm.isLoggedIn = AuthService.is_authenticated()

angular.module('angularApp').controller 'HeaderController', HeaderController
HeaderController.$inject = [
  'AuthService'
]
