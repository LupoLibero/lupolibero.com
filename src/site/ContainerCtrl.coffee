angular.module('site').
controller('ContainerCtrl', ($scope, $rootScope, $localStorage, $location, Tweet, Page, Subscription, notification)->
  $rootScope.$storage  = $localStorage
  $rootScope.$location = $location

  if window.localStorage and $scope.$storage.lang?
    $rootScope.langCode = $scope.$storage.lang

  search = $location.search()
  if search['hl']?
    if search['hl'] is 'fr'
      $rootScope.langCode = 'fr'
    else if search['hl'] is 'en'
      $rootScope.langCode = 'en'

  if not $rootScope.langCode?
    lang = window.navigator.language
    lang = lang.split('-')
    lang = lang[0]
    if lang is 'fr'
      $rootScope.langCode = 'fr'
    else
      $rootScope.langCode = 'en'

  if window.localStorage
    $scope.$storage.lang = $rootScope.langCode

  if $rootScope.langCode is 'fr'
    $rootScope.descriptionMeta = 'Lupo Libero, un service de stockage de fichiers en ligne, en logiciel libre, qui protège votre vie privée avec du chiffrement de bout-en-bout'
  else
    $rootScope.descriptionMeta = 'Lupo Libero, an easy to use free and open source online storage service that protects your privacy with end-to-end encryption'

  $rootScope.$on('$stateChangeStart', ($event, to)->
    $('#loader').fadeIn(150)
    # Scroll to top
    $('html, body').animate({scrollTop: 0}, 800)
  )
  $rootScope.$on('$stateChangeSuccess', ($event, to)->
    $scope.title = to.name
    $('#loader').fadeOut()
  )

  # Translate the interface in the language of the navigator
  $rootScope.$broadcast('$ChangeLanguage', $rootScope.langCode)
  $rootScope.$on('$translateChangeError', ->
    $rootScope.$broadcast('$ChangeLanguage', 'en')
  )

  unless $rootScope.$storage.facebook?
    $rootScope.$storage.facebook = false
  unless $rootScope.$storage.twitter?
    $rootScope.$storage.twitter = false
  unless $rootScope.$storage.googlePlus?
    $rootScope.$storage.googlePlus = false

  Tweet.all({
    limit: 4
    descending: true
  }).then(
    (data)-> #Success
      $scope.tweets = data
    ,(err)-> #Error
      console.log err
  )

  Page.getDoc({
    _id: 'follower'
  }).then(
    (data)-> #Success
      $scope.numberFollower = data.twitter
      $scope.numberLikes    = data.likes
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
        notification.addAlert('You have subscribed to the newsletter', 'success')
        $scope.subscription = {}
      ,(err)-> #Error
        console.log err
    )
)
