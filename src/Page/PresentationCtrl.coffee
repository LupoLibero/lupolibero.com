angular.module('page').
controller('PresentationCtrl', ($scope, page, pageDefault) ->
  $scope.page = angular.extend(pageDefault, page)
  console.log(page, pageDefault)
)
