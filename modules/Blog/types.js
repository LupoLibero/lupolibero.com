var Type              = require('couchtypes/types').Type;
var fields            = require('couchtypes/fields');
var permissions       = require('couchtypes/permissions');
var translatableField = require('../Translation/fields').translatableField;
var idField           = require('../site/fields').idField;

var authorOrAdmin = function() {
  return permissions.any([
      permissions.hasRole('blog_author'),
      permissions.hasRole('_admin'),
    ]);
}

exports.blogpost = new Type('blogpost', {
  permissions: {
    add:    authorOrAdmin(),
    update: authorOrAdmin(),
    remove: authorOrAdmin(),
  },
  fields: {
    author:     fields.creator(),
    created_at: fields.createdTime(),
    id:         idField(/<author>-<created_at>/),
    title:      translatableField(),
    short:      translatableField(),
    long:       translatableField(),
    slug:       translatableField(),
  }
});
