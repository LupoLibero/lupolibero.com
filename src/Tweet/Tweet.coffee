angular.module('tweet').
factory('Tweet', (CouchDB, db)->
  return CouchDB(db.url, db.name, 'tweet')
)
