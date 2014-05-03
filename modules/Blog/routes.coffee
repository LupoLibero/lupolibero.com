angular.module('blog').
config( ($routeProvider) ->
  $routeProvider
    .when('/blog', {
      name:        'blogpostList'
      templateUrl: './partials/blogpost_list.html'
      controller:  'BlogpostListCtrl'
      resolve:
        blogpostList: (Blogpost) ->
          return Blogpost.all({
            descending: true
            startkey:   [window.navigator.language, {}]
            endkey:     [window.navigator.language, ""]
            limit:      10
          })
        blogpostListDefault: (Blogpost) ->
          return Blogpost.all({
            descending: true
            startkey:   ["en", {}]
            endkey:     ["en", ""]
            limit:      10
          })
    })
    .when('/blog/:blogpostId', {
      name:        'blogpost'
      templateUrl: './partials/blogpost.html'
      controller:  'BlogpostCtrl'
      resolve:
        blogpost: ($route, Blogpost) ->
          return Blogpost.get({
            key: $route.current.params.blogpostId
          })
    })
)
