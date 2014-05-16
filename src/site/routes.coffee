angular.module('site').
config( ($urlRouterProvider) ->
  $urlRouterProvider.otherwise("home")
)
