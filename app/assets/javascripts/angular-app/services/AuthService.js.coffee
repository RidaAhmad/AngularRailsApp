AuthService = (Auth, $http, $location, $cookies, $resource, $q) ->
  login: (credentials) ->
    config = {
      headers:
        'X-HTTP-Method-Override': 'Post'
    }
    $http.post('api/v1/users/sign_in', user: credentials, config).then ((user) ->
      $cookies.currentUser = angular.toJson(user.data)
      $location.path('/')
    ), (error) ->
      alert('Unable to login successfully!')
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
      alert('Unable to signup successfully!')
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
      alert('Unable to logout successfully!')
      return

  change_password: (credentials) ->
    config = {
      headers:
        'X-HTTP-Method-Override': 'PUT'
    }
    $http.post('api/v1/users/password', user: credentials, config).then ((user) ->
      $cookies.currentUser = angular.toJson(user.data)
      $location.path('/')
    ), (error) ->
      alert('Unable to change password!')
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

  access_allowed: (user_id) ->
    if this.is_authenticated()
      this.get_current_user().id == user_id
    else
      false

  edit_profile: (user) ->
    config = {
      headers:
        'X-HTTP-Method-Override': 'PUT',
        'Authorization': this.access_token()
    }
    $http.put('api/v1/users/' + user.id, user: user, config).then ((user) ->
      $cookies.currentUser = angular.toJson(user.data)
      $location.path('/')
    ), (error) ->
      alert('Unable to edit profile successfully!' )
      return

  display_profile: (id) ->
    deferred = $q.defer();
    config = {
      headers:
        'X-HTTP-Method-Override': 'GET',
        'Authorization': this.access_token()
    }
    $http.get('api/v1/users/' + id, config).success((data) ->
      deferred.resolve(data)
    ).error((msg) ->
      deferred.reject(msg);
    )
    return deferred.promise;


angular.module('angularApp').service 'AuthService', AuthService
AuthService.$inject = [
  'Auth'
  '$http'
  '$location'
  '$cookies'
  '$resource'
  '$q'
]
