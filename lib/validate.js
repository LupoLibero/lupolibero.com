var couchtypes = require('couchtypes/types');
var types = require('./types');
var utils = require('./utils');


exports.validate_doc_update = function(newDoc, oldDoc, userCtx) {
  var hasRole = function() {
    var roles = {};
    for(var i in userCtx.roles) {
      roles[userCtx.roles[i]] = null;
    }
    return function(role) {
      return role in roles;
    };
  }();

  utils.assert(newDoc.hasOwnProperty('_id'), 'New doc must have a _id');
  if (!hasRole('_admin')) {
    utils.unchanged('type');
    if (!hasRole('ll.com')) {
      log(newDoc);
      log(newDoc.type);
      if(!newDoc.hasOwnProperty('type')
          || newDoc.type != 'notification'
          && newDoc.type != 'subscription') {
        throw new Error("You are not allowed to edit this database");
      }
    }
    couchtypes.validate_doc_update(types, newDoc, oldDoc, userCtx);
  }
};