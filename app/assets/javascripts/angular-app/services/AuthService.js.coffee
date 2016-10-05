AuthService = (Auth, $http, $location, $cookies) ->
  login: (credentials) ->
    config = {
      headers:
        'X-HTTP-Method-Override': 'Post'
    }
    $http.post('api/v1/users/sign_in', user: credentials, config).then ((user) ->
      $cookies.currentUser = angular.toJson(user.data)
      $location.path('/')
    ), (error) ->
      return

  signup: (user) ->
    config = {
      headers:
        'X-HTTP-Method-Override': 'Post'
    }
    $http.post('api/v1/users.json', user: user, config).then ((user) ->
      $cookies.currentUser = angular.toJson(user.data)
      $location.path('/')
    ), (error) ->
      return

  logout: ->
    config = {
      headers:
        'Authorization': this.access_token()
    }
    Auth.logout(config).then ((response) ->
      delete $cookies['currentUser']
      $location.path('/users/sign_in')
    ), (error) ->
      return

  get_current_user: ->
    if $cookies.currentUser
      JSON.parse $cookies.currentUser

  access_token: ->
    if this.is_authenticated()
      this.get_current_user().access_token
    else
      ''

  is_authenticated: ->
    if $cookies.currentUser
      true
    else
      false

angular.module('angularApp').service 'AuthService', AuthService
AuthService.$inject = [
  'Auth'
  '$http'
  '$location'
  '$cookies'
]
