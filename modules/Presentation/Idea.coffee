angular.module('presentation').
factory('Idea', (CouchDB, db)->
  return CouchDB(db.url, db.name, 'idea')
)
