angular.module('presentation').
config( ($stateProvider) ->
  $stateProvider
    .state('presentation', {
      url:         '/presentation'
      templateUrl: 'partials/presentation.html'
      controller:  'PresentationCtrl'
      resolve:
        page: (Page, $q) ->
          defer = $q.defer()
          Page.getDoc({
            _id: "presentation:#{window.navigator.language}"
          }).then(
            (data)-> #Success
              defer.resolve(data)
            ,(err)-> #Error
              defer.resolve({})
          )
          return defer.promise
        pageDefault: (Page) ->
          return Page.getDoc({
            _id: "presentation:en"
          })
    })
    .state('home', {
      url:         '/home'
      templateUrl: 'partials/home.html'
      controller:  'HomeCtrl'
      resolve:
        pageDefault: (Page) ->
          return Page.getDoc({
            _id: 'home:en'
          })
        page: (Page, $q) ->
          defer = $q.defer()
          Page.getDoc({
            _id: "home:#{window.navigator.language}"
          }).then(
            (data)-> #Success
              defer.resolve(data)
            ,(err)-> #Error
              defer.resolve({})
          )
          return defer.promise
        indiegogo: (Page, $q) ->
          return Page.getDoc({
            _id: "indiegogo"
          })
    })
    .state('contact', {
      url:         '/contact'
      templateUrl: 'partials/contact.html'
      controller:  'ContactCtrl'
      resolve:
        pageDefault: (Page) ->
          return Page.getDoc({
            _id: 'contact:en'
          })
        page: (Page, $q) ->
          defer = $q.defer()
          Page.getDoc({
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
