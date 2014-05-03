angular.module('comment').
controller('AddCommentCtrl', ($scope) ->
  console.log "loaded"
  $scope.addComment = (comment) ->
    console.log comment

    if comment.message?  and comment.message != '' and
    comment.name and comment.email
      $scope.loading = true
      Comment.update({
        update: 'create_public'

        author:     comment.name
        message:    comment.message
        email:      comment.email
        website:    comment.website
        parent_id:  comment.parentObj._id
      }).then(
        (data) -> #Success
          $scope.comment = {
            parentObj: comment.parentObj
          }
          comment.parentObj.comments.push(data)
          $scope.loading = false
          #$scope.comments.unshift(data)
        ,(err) -> #Error
          $scope.loading = false
      )
)
