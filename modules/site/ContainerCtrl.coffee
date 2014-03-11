angular.module('site').
controller('ContainerCtrl', ($scope, $translate) ->

  $translate.use(window.navigator.language)
  $scope.$on('$translateLoadingError', ->
    $translate.use('en')
  )
)
