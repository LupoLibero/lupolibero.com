angular.module('site').
controller('ContainerCtrl', ($scope, $rootScope, $translate, $localStorage, $location, $route)->
  $rootScope.$storage  = $localStorage
  $rootScope.$location = $location

  $rootScope.$on('$routeChangeSuccess', ->
    $scope.title = $route.routes[$location.path()]?.name ? $route.current.params.blogpostId
  )

  # Translate the interface in the language of the navigator
  $translate.use(window.navigator.language)

  # If the language doesn't exist on the database
  $rootScope.$on('$translateChangeError', ->
    $translate.use('en')
  )

  $rootScope.facebookLikeAllowed = false
  $rootScope.googlePlusAllowed = false
)
