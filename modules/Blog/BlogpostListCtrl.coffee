angular.module('blog').
controller('BlogpostListCtrl', ($scope, blogpostList, blogpostListDefault) ->
  $scope.blogpostList = blogpostListDefault
)
