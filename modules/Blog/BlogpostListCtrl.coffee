angular.module('blog').
controller('BlogpostListCtrl', ($scope, blogpostList, blogpostListDefault, post_max, $route) ->
  $scope.blogpostList = blogpostListDefault
  $scope.page = {
    max:    post_max[0].max
    actual: parseInt($route.current.params.page ? 1)
  }
)
