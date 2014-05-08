angular.module('site').
controller('ContainerCtrl', ($scope, $rootScope, $localStorage, $location)->
  $rootScope.$storage  = $localStorage
  $rootScope.$location = $location

  $rootScope.$on('$routeChangeSuccess', ->
    $scope.title = $route.routes[$location.path()]?.name ? $route.current.params.blogpostId
  )

  # Translate the interface in the language of the navigator
  $rootScope.$broadcast('$ChangeLanguage', window.navigator.language)
  $rootScope.$on('$translateChangeError', ->
    $rootScope.$broadcast('$ChangeLanguage', 'en')
  )

  # If the language doesn't exist on the database
  $rootScope.$on('$translateChangeError', ->
    $translate.use('en')
  )

  unless $rootScope.$storage.facebook?
    $rootScope.$storage.facebook = false
  unless $rootScope.$storage.twitter?
    $rootScope.$storage.twitter = false
  unless $rootScope.$storage.googlePlus?
    $rootScope.$storage.googlePlus = false

  $scope.facebookCount = 43
  $scope.twitterCount = 2
)
