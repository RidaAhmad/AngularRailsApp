angularApp = angular.module('angularApp',[
  'templates'
  'ngRoute'
  'ngResource'
  'Devise'
  'ngCookies'
])
angularApp.config([ '$routeProvider', '$locationProvider',
  ($routeProvider, $locationProvider)->
    $routeProvider
      .when('/',
        templateUrl: 'angular-app/templates/main/index.html'
      )
      .when('/test',
        templateUrl: 'angular-app/templates/main/test.html'
      )
      .when('/tasks',
        templateUrl: 'angular-app/templates/main/index.html'
      )
      .when('/tasks/:id',
        templateUrl: 'angular-app/templates/main/task.html'
      )
      .when('/users/sign_up',
        templateUrl: 'angular-app/templates/users/sign_up.html'
      )
      .when('/users/sign_in',
        templateUrl: 'angular-app/templates/users/sign_in.html'
      )
      .when('/users/profile',
        templateUrl: 'angular-app/templates/users/profile.html'
      )
      .when('/users/edit_profile',
        templateUrl: 'angular-app/templates/users/edit_profile.html'
      )
      .when('/users/reset_password',
        templateUrl: 'angular-app/templates/users/reset_password.html'
      )
    $locationProvider.html5Mode({
      enabled: false,
      rewriteLinks: false
    });
])

angular.module('angularApp').config (AuthProvider) ->
  AuthProvider.loginPath('api/v1/users/sign_in')
  AuthProvider.loginMethod('POST')
  AuthProvider.resourceName('user')
  AuthProvider.registerPath('api/v1/users')
  AuthProvider.registerMethod('POST')
  AuthProvider.logoutPath('api/v1/users/sign_out')
