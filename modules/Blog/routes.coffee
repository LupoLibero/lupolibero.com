angular.module('blog').
config( ($routeProvider) ->
  $routeProvider
    .when('/blog', {
      name:        'blogpostList'
      templateUrl: './partials/blogpost_list.html'
      controller:  'BlogpostListCtrl'
      resolve:
        post_max: (Blogpost) ->
          return Blogpost.view({
            view: 'max'
          })
        blogpostList: (Blogpost, $route) ->
          page =  $route.current.params.page ? 1
          page--
          return Blogpost.all({
            descending: true
            startkey:   [window.navigator.language, {}]
            endkey:     [window.navigator.language, ""]
            limit:      10
            skip:       page*10
          })
        blogpostListDefault: (Blogpost, $route) ->
          page =  $route.current.params.page ? 1
          page--
          return Blogpost.all({
            descending: true
            startkey:   ["en", {}]
            endkey:     ["en", ""]
            limit:      10
            skip:       page*10
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
