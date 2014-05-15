angular.module('presentation').
config( ($stateProvider) ->
  $stateProvider
    .state('presentation', {
      url:         '/presentation'
      templateUrl: 'partials/presentation.html'
      controller:  'PresentationCtrl'
      resolve:
        page: (Presentation, $q) ->
          defer = $q.defer()
          Presentation.getDoc({
            _id: "presentation:#{window.navigator.language}"
          }).then(
            (data)-> #Success
              defer.resolve(data)
            ,(err)-> #Error
              defer.resolve({})
          )
          return defer.promise
        pageDefault: (Presentation) ->
          return Presentation.getDoc({
            _id: "presentation:en"
          })
    })
    .state('home', {
      url:         '/home'
      templateUrl: 'partials/home.html'
      controller:  'HomeCtrl'
      resolve:
        pageDefault: (Presentation) ->
          return Presentation.getDoc({
            _id: 'home:en'
          })
        page: (Presentation, $q) ->
          defer = $q.defer()
          Presentation.getDoc({
            _id: "home:#{window.navigator.language}"
          }).then(
            (data)-> #Success
              defer.resolve(data)
            ,(err)-> #Error
              defer.resolve({})
          )
          return defer.promise
        indiegogo: (Presentation, $q) ->
          return Presentation.getDoc({
            _id: "indiegogo"
          })
    })
    .state('contact', {
      url:         '/contact'
      templateUrl: 'partials/contact.html'
      controller:  'ContactCtrl'
      resolve:
        pageDefault: (Presentation) ->
          return Presentation.getDoc({
            _id: 'contact:en'
          })
        page: (Presentation, $q) ->
          defer = $q.defer()
          Presentation.getDoc({
            _id: "contact:#{window.navigator.language}"
          }).then(
            (data)-> #Success
              defer.resolve(data)
            ,(err)-> #Error
              defer.resolve({})
          )
          return defer.promise
    })
)
