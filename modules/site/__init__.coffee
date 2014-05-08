angular.module('site', [
  'ngRoute'
  'dbSelect'
  'gettext'
  'url'
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

