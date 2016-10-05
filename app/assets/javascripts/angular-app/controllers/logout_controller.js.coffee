Logout = (AuthService) ->
  vm = this

  logout = ->
    AuthService.logout()

  vm.logout = logout

angular.module('angularApp').controller 'Logout', Logout
Logout.$inject = [
  'AuthService'
]
