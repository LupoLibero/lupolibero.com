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
])

ng.value('db', {
  url:  ''
  name: 'lupolibero.com'
})

