angular.module('presentation').
config( ($routeProvider) ->
  $routeProvider
    .when('/presentation', {
      name:        'presentation'
      templateUrl: './partials/presentation.html'
      controller:  'PresentationCtrl'
      resolve:
        presentation: (Presentation) ->
          return Presentation.get({
            key: [window.navigator.language]
          })
    })
)
