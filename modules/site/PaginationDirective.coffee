angular.module('site').
directive('paginationPage', ($location, $rootScope, $state)->
  return {
    restrict: 'E'
    scope: {
      totalItems:  '='
      itemPerPage: '='
      ngModel:     '='
    }
    template: """
              <ul class="pagination">
                <li ui-sref-active="disabled"><a ui-sref=".({page: 1})">&laquo;</a></li>
                <li ng-class="{active: ngModel==page}" ng-repeat="page in range"><a ui-sref=".({page: page})">{{page}}</a></li>
                <li ui-sref-active="disabled"><a ui-sref=".({page: max})">&raquo;</a></li>
              </ul>
              """
    link: (scope, elem, attrs)->
      scope.ngModel = $location.search().page ? 1

      scope.$watchCollection(['totalItems', 'itemPerPage'], ->
        scope.max   = Math.ceil(scope.totalItems/scope.itemPerPage)
        scope.range = [1..scope.max]
      )

      $rootScope.$on('$stateChangeSuccess', ->
        scope.ngModel = $location.search().page ? 1
      )
  }
)
