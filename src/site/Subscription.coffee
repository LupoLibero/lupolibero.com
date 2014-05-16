angular.module('site').
factory('Subscription', (CouchDB, db)->
  return CouchDB(db.url, db.name, 'subscription')
)
