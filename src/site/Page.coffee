angular.module('site').
factory('Page', (CouchDB, db)->
  return CouchDB(db.url, db.name, 'page')
)
