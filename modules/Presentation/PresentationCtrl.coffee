angular.module('presentation').
controller('PresentationCtrl', ($scope, presentation) ->
  $scope.presentation = presentation.content
)
