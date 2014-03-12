angular.module('presentation').
factory('Presentation', (CouchDB, db)->
  return CouchDB(db.url, db.name, 'presentation')
)
