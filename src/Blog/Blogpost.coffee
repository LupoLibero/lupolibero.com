angular.module('blog').
factory('Blogpost', (CouchDB, db)->
  return CouchDB(db.url, db.name, 'blogpost')
)
