angular.module('site').
config( ($routeProvider) ->
  $routeProvider
    .otherwise({ redirectTo: '/presentation' })
)
