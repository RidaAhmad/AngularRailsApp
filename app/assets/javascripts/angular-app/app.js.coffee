angularApp = angular.module('angularApp',[
  'templates'
  'ngRoute'
  'ngResource'
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
    $locationProvider.html5Mode({
      enabled: false,
      rewriteLinks: false
    });
])
