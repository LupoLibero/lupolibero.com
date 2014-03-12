var Type              = require('couchtypes/types').Type;
var fields            = require('couchtypes/fields');
var widgets           = require('couchtypes/widgets');
var permissions       = require('couchtypes/permissions');
var translatableField = require('../Translation/fields').translatableField;


exports.presentation = new Type('presentation', {
  permissions: {
    add: permissions.hasRole('_admin'),
    update: permissions.hasRole('_admin'),
    remove: permissions.hasRole('_admin')
  },
  fields: {
    id: fields.string(),
    content: translatableField(),
  }
});

exports.idea = new Type('idea', {
  permissions: {
    add: permissions.hasRole('_admin'),
    update: permissions.hasRole('_admin'),
    remove: permissions.hasRole('_admin')
  },
  fields: {
    id: fields.string(),
    short: translatableField(),
    long: translatableField(),
    img: fields.string(),
  }
});
