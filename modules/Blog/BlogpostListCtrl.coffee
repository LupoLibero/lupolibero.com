angular.module('blog').
controller('BlogpostListCtrl', ($state, $scope, blogpostList, blogpostListDefault, post_max) ->
  $scope.blogpostList = blogpostListDefault
  $scope.page = {
    max:    post_max[0].max
    actual: parseInt($state.params.page ? 1)
  }
)
