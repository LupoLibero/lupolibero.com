angular.module('site').
controller('ContainerCtrl', ($scope, $rootScope, $translate, $localStorage)->
  $rootScope.$storage  = $localStorage
  # Translate the interface in the language of the navigator
  $translate.use(window.navigator.language)

  # If the language doesn't exist on the database
  $rootScope.$on('$translateChangeError', ->
    $translate.use('en')
  )

  $rootScope.facebookLikeAllowed = false
  $rootScope.googlePlusAllowed = false
)
