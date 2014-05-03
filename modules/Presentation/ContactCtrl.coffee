angular.module('presentation').
controller('ContactCtrl', ($scope, presentation) ->
  $scope.page = presentation
  $scope.form_action = ""
)
