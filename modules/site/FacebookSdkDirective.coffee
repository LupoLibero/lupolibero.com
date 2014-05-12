angular.module('site').
directive('facebookSdk', ($document)->
  return {
    restrict: 'E'
    scope: {
      ngIf: '='
    }
    link: (scope, elem, attrs)->
      scope.$watch('ngIf', (value)->
        if value and $document.find('.facebook-jssdk').length == 0
          $('body').append('<script class="facebook-jssdk" src="//connect.facebook.net/fr_FR/sdk.js#xfbml=1&version=v2.0"></script>')
      )
  }
)
