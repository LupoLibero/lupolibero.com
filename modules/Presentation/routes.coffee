angular.module('presentation').
config( ($routeProvider) ->
  $routeProvider
    .when('/presentation', {
      name:        'presentation'
      templateUrl: './partials/presentation.html'
      controller:  'PresentationCtrl'
      resolve:
        page: (Presentation) ->
          pageName = 'presentation-en' #+ window.navigator.language
          return Presentation.getDoc({
            _id: pageName
          })
    })
    .when('/home', {
      name:        'home'
      templateUrl: './partials/home.html'
      controller:  'HomeCtrl'
      resolve:
        presentation: (Presentation) ->
          pageName = 'home-en' #+ window.navigator.language
          return Presentation.getDoc({
            _id: pageName
          })
    })
    .when('/contact', {
      name:        'contact'
      templateUrl: './partials/contact.html'
      controller:  'ContactCtrl'
      resolve:
        presentation: (Presentation) ->
          pageName = 'contact-en' #+ window.navigator.language
          return Presentation.getDoc({
            _id: pageName
          })
    })
)
