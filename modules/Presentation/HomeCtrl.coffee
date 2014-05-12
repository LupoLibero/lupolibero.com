angular.module('presentation').
controller('HomeCtrl', ($scope, follower) ->
  $scope.numberFollower = follower.num
)
