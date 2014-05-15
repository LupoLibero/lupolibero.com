angular.module('site', [
  'ui.router'
  'gettext'
  'ngCouchDB'
  'presentation'
  'breadcrumb'
  'blog'
  'comment'
  'ngSocial'
  'ngStorage'
  'ngSanitize'
  'tweet'
])

ng.value('db', {
  url:  ''
  name: 'lupolibero.com'
})

