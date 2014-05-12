angular.module('presentation').
controller('ContactCtrl', ($scope, page, Notif) ->
  $scope.page        = page
  $scope.form_action = ""
  $scope.contact     = {}

  $scope.sendContact = ->
    Notif.update({
      update: 'create_contact'
      message_txt: """
                   #{$scope.contact.name} <#{$scope.contact.email}>
                   #{$scope.contact.message}
                   #{$scope.contact.url}
                   """
      subject: "#{$scope.contact.name} <#{$scope.contact.email}>"
      name:    $scope.contact.name
    }).then(
      (data)-> #Success
        console.log data
      ,(err)-> #Error
        console.log err
    )
)
