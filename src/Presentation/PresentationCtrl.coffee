angular.module('presentation').
controller('PresentationCtrl', ($scope, page, pageDefault) ->
  page = angular.extend(pageDefault, page)
  $scope.presentation  = page.presentation
  $scope.ideas         = page.ideas
)