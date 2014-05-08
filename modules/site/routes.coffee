angular.module('site').
config( ($urlRouterProvider) ->
  $urlRouterProvider
    .otherwise("presentation")
)
