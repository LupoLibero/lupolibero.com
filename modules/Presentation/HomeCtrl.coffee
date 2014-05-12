angular.module('presentation').
controller('HomeCtrl', ($scope, presentation,? Notif, follower, Subscription, notification) ->
  $scope.subscription = {}
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

  $scope.subscribe = ->
    Subscription.update({
      update: 'create'

      email: $scope.subscription.email
      every: $scope.subscription.every
    }).then(
      (data)-> #Success
        notification.addAlert('You have subscribe to the newsletter', 'success')
        $scope.subscription = {}
      ,(err)-> #Error
        console.log err
    )
)
