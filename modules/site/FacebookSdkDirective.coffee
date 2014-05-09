angular.module('site').
directive('facebookSdk', ($document)->
  return {
    restrict: 'E'
    scope: {
      ngIf: '='
    }
    link: (scope, attribute, element)->
      window.fbAsyncInit = ->
        FB.init({
          appId:    '{your-app-id}'
          xfbml:    true
          version:  'v2.0'
        })

      scope.$watch('ngIf', (value)->
        if value and $document.find('.facebook-jssdk').length == 0
          $('body').append('<script class="facebook-jssdk" src="//connect.facebook.net/en_US/sdk.js"></script>')
      )
  }
)
