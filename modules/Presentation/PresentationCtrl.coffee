angular.module('presentation').
controller('PresentationCtrl', ($scope, presentation, ideas) ->
  $scope.presentation = presentation.content
  $scope.ideas = ideas
)
