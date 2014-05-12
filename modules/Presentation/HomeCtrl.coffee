angular.module('presentation').
controller('HomeCtrl', ($scope, follower, Subscription, notification) ->
  $scope.subscription = {}
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
