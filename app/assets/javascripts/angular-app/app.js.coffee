angularApp = angular.module('angularApp',[
  'templates',
  'ngRoute'
])
angularApp.config([ '$routeProvider', '$locationProvider',
  ($routeProvider,$locationProvider)->
    $routeProvider
      .when('/',
        templateUrl: "angular-app/templates/main/index.html"
        controller: "MainController"
      )
      .when('/test',
        templateUrl: "angular-app/templates/main/test.html"
        controller: "TestController"
      )
    $locationProvider.html5Mode({
      enabled: false,
      rewriteLinks: false
    });
])
