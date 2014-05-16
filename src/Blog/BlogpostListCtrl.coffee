angular.module('blog').
controller('BlogpostListCtrl', ($state, $scope, blogpostList, blogpostListDefault, post_max) ->
  $scope.blogpostList = blogpostListDefault

  for post, i in $scope.blogpostList
    $scope.blogpostList[i] = angular.extend(blogpostListDefault[i], blogpostList[i])

  $scope.page = {
    max:    post_max[0].max
    actual: parseInt($state.params.page ? 1)
  }
)
