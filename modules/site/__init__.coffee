angular.module('site', [
  'ui.router'
  'dbSelect'
  'gettext'
  'ngCouchDB'
  'presentation'
  'breadcrumb'
  'blog'
  'comment'
  'ngSocial'
  'ngStorage'
  'tweet'
])

ng.value('db', {
  url:  ''
  name: 'lupolibero.com'
})

