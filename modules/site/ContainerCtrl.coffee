angular.module('site').
controller('ContainerCtrl', ($scope, $rootScope, $localStorage, $location, Tweet)->
  $rootScope.$storage  = $localStorage
  $rootScope.$location = $location

  $rootScope.$on('$stateChangeStart', ($event, to)->
    $('#loader').fadeIn(150)
    $('html, body').animate({scrollTop: 0}, 800)
  )
  $rootScope.$on('$stateChangeSuccess', ($event, to)->
    $scope.title = to.name
    $('#loader').fadeOut()
  )
  $rootScope.$on('$stateChangeError', ($event, toState, toParams, fromState, fromParams, error)->
    console.log $event, toState, toParams, fromState, fromParams, error
  )

  # Translate the interface in the language of the navigator
  $rootScope.$broadcast('$ChangeLanguage', window.navigator.language)
  $rootScope.$on('$translateChangeError', ->
    $rootScope.$broadcast('$ChangeLanguage', 'en')
  )
  $rootScope.langCode = window.navigator.language

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

  $scope.subscribe = ->
    Subscription.update({
      update: 'create'

      email: $scope.subscription.email
      every: $scope.subscription.every
    }).then(
      (data)-> #Success
        notification.addAlert('You have subscribe to the newsletter', 'success')
        $scope.subscription = {}
      ,(err)-> #Error
        console.log err
    )
)
