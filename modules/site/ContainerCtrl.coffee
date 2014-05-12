angular.module('site').
controller('ContainerCtrl', ($scope, $rootScope, $localStorage, $location, Tweet)->
  $rootScope.$storage  = $localStorage
  $rootScope.$location = $location

  $rootScope.$on('$stateChangeSuccess', ($event, to)->
    $scope.title = to.name
  )

  $rootScope.$on('$stateChangeError', ($event, toState, toParams, fromState, fromParams, error)->
    console.log $event, toState, toParams, fromState, fromParams, error
  )

  # Translate the interface in the language of the navigator
  $rootScope.$broadcast('$ChangeLanguage', window.navigator.language)
  $rootScope.$on('$translateChangeError', ->
    $rootScope.$broadcast('$ChangeLanguage', 'en')
  )

  unless $rootScope.$storage.facebook?
    $rootScope.$storage.facebook = false
  unless $rootScope.$storage.twitter?
    $rootScope.$storage.twitter = false
  unless $rootScope.$storage.googlePlus?
    $rootScope.$storage.googlePlus = false

  $scope.facebookCount = 43
  $scope.twitterCount = 2

  Tweet.all({
    limit: 4
    descending: true
  }).then(
    (data)-> #Success
      $scope.tweets = data
    ,(err)-> #Error
      console.log err
  )
)
