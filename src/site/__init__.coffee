angular.module('site', [
  'ui.router'
  'gettext'
  'ngCouchDB'
  'presentation'
  'blog'
  'comment'
  'ngSocial'
  'ngStorage'
  'ngSanitize'
  'ngAnimate'
  'tweet'
])

ng.value('db', {
  url:  ''
  name: 'lupolibero.com'
})

