angular.module('site').
directive('twitterSdk', ($location, $document)->
  return {
    restrict: 'E'
    scope: {
      ngIf: '='
    }
    link: (scope, elem, attrs)->
      if /^http:/.test($location.absUrl())
        p = "http"
      else
        p = "https"

      scope.$watch('ngIf', (value)->
        if value and $document.find('.twitter-wjs').length == 0
          $('body').append("""<script class="twitter-wjs" src="#{p}://platform.twitter.com/widgets.js"></script>""")
      )
  }
)
