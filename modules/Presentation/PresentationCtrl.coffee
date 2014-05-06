angular.module('presentation').
controller('PresentationCtrl', ($scope, page) ->
  $scope.presentation  = page.presentation
  $scope.ideas         = page.ideas
)
