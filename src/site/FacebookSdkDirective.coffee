angular.module('site').
directive('facebookSdk', ->
  return {
    restrict: 'E'
    scope: {
      if: '='
    }
    link: (scope, elem, attrs)->
      scope.$watch('if', (value)->
        if value
          $('body').append('<script class="facebook-jssdk" src="//connect.facebook.net/fr_FR/sdk.js"></script>')
        else
          $('.facebook-jssdk').remove()
      )
  }
)
