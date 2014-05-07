angular.module('presentation').
controller('ContactCtrl', ($scope, presentation) ->
  $scope.page        = presentation
  $scope.form_action = ""
  $scope.contact     = {}

  $scope.sendContact = ->
    Notification.update({
      update: 'create'
    }).then(
      (data)-> #Success
        console.log data
      ,(err)-> #Error
        console.log err
    )
)
