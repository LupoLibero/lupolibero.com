angular.module('blog').
controller('BlogpostCtrl', ($scope, blogpost, Comment) ->
  $scope.blogpost = blogpost

  $scope.author = {bio: "Sylvain Duchesne is...."}

  $scope.commentNb = 0

  recursivelyGetComments = (parent, parent_id) ->
    Comment.all({
      startkey: [parent_id, 0],
      endkey:   [parent_id, {}]
    }).then((comments) ->
      parent.comments = comments
      if parent == blogpost
        $scope.comments = blogpost.comments
      for comment in comments
        $scope.commentNb += 1
        recursivelyGetComments comment, comment._id
    )
  recursivelyGetComments(blogpost, blogpost._id)

  $scope.parentObj = blogpost

  $scope.reply = (parentObj) ->
    if $scope.parentObj._id == parentObj._id
      $scope.parentObj = blogpost
    else
      $scope.parentObj = parentObj

  $scope.addComment = (comment) ->
    if comment.message?  and comment.message != '' and
    comment.name? and comment.name != '' and
    comment.email? and comment.email != ''
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
          # clean comment obj
          for e of comment
            if e != "parentObj"
              delete comment[e]
          comment.parentObj.comments.push(data)
          $scope.commentNb += 1
          $scope.loading = false
        ,(err) -> #Error
          $scope.loading = false
      )

)
