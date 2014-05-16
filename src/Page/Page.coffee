angular.module('page').
factory('Page', (CouchDB, db)->
  return CouchDB(db.url, db.name, 'page')
)
