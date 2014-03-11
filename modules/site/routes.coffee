angular.module('site').
config( ($routeProvider) ->
  $routeProvider
    .when('/', {
      name:        'presentation'
      templateUrl: './partials/presentation.html'
      controller:  'PresentationCtrl'
    })
    .otherwise({ redirectTo: '/' })
)
