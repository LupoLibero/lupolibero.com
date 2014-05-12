angular.module('presentation').
controller('HomeCtrl', ($scope, presentation, Notif) ->
  $scope.page = presentation

  $scope.features = [
    {id: "secured_data", filename: "secured_data_icone.png"},
    {id: "devices", filename: "devices_icone.png"},
    {id: "sync", filename: "sync_icone.png"},
    {id: "easy", filename: "easy_icone.png"},
    {id: "share", filename: "share_icone.png"},
    {id: "upload", filename: "upload_icone.png"},
    {id: "privacy", filename: "privacy_icone.png"},
    {id: "open", filename: "open_icone.png"},
  ]

  $scope.numberFollower = follower.num
)
