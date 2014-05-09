angular.module('site').
directive('facebookSdk', ($document)->
  return {
    restrict: 'E'
    scope: {
      ngIf: '='
    }
    link: (scope, attribute, element)->
      scope.$watch('ngIf', (value)->
        if value and $document.find('.facebook-jssdk').length == 0
          $('body').append('<script class="facebook-jssdk" src="//connect.facebook.net/en_US/sdk.js"></script>')
      )
  }
)
