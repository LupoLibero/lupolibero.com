angular.module('site').
directive('twitterSdk', ($location)->
  return {
    restrict: 'E'
    scope: {
      if: '='
    }
    link: (scope, elem, attrs)->
      if /^http:/.test($location.absUrl())
        p = "http"
      else
        p = "https"

      scope.$watch('if', (value)->
        if value
          $('body').append("""<script class="twitter-wjs" src="#{p}://platform.twitter.com/widgets.js"></script>""")
        else
          $('.twitter-wjs').remove()
      )
  }
)
