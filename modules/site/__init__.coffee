angular.module('site', [
  'ngRoute',
  'dbSelect',
  'translation',
  'url',
  'ngCouchDB',
  'presentation',
  'breadcrumb',
  'blog',
  'comment',
  'ngSocial'
])

ng.value('db', {
  url:  ''
  name: 'lupolibero.com'
})

