angular.module('presentation').
controller('PresentationCtrl', ($scope, presentation, ideas) ->
  $scope.page = presentation
  #$scope.ideas = ideas
)
