angular.module('presentation').
config( ($stateProvider) ->
  $stateProvider
    .state('presentation', {
      url:         '/presentation'
      templateUrl: './partials/presentation.html'
      controller:  'PresentationCtrl'
      resolve:
        page: (Presentation) ->
          pageName = 'presentation:en'
          return Presentation.getDoc({
            _id: pageName
          })
    })
    .state('home', {
      url:         '/home'
      templateUrl: './partials/home.html'
      controller:  'HomeCtrl'
      resolve:
        presentation: (Presentation) ->
          pageName = 'home:en'
          return Presentation.getDoc({
            _id: pageName
          })
    })
    .state('contact', {
      url:         '/contact'
      templateUrl: './partials/contact.html'
      controller:  'ContactCtrl'
      resolve:
        presentation: (Presentation) ->
          pageName = 'contact:en'
          return Presentation.getDoc({
            _id: pageName
          })
    })
)
