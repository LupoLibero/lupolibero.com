var Type        = require('couchtypes/types').Type;
var fields      = require('couchtypes/fields');
var permissions = require('couchtypes/permissions');
var idField     = require('../site/fields').idField;

exports.comment = new Type('comment', {
  permissions: {
    //add: permissions.loggedIn(),
    update: permissions.hasRole('_admin'),
    remove: permissions.hasRole('_admin'),
  },
  fields: {
    author: fields.string(),
    email:  fields.email(),
    website: fields.url({
      required: false
    }),
    created_at: fields.createdTime(),
    parent_id: fields.string({
      permissions: {
        update: permissions.fieldUneditable()
      }
    }),
    message: fields.string(),
  }
})
