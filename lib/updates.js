var reExports = require('./utils').reExports;

reExports(exports, 'modules/Comment/updates');

reExports(exports, 'modules/Notification/updates');

reExports(exports, 'modules/Tweet/updates');

exports.subscription_unsubscribe = function(doc, req) {
  var form = JSON.parse(req.body);
  if(doc !== null) {
    if(doc.token == form.token){
      doc = {
        _id:     doc._id,
        _rev:    doc._rev,
        _deleted: true,
      };
    }

    return [doc, 'ok'];
  }
  throw({forbidden: 'Only for doc creation'});
}

exports.subscription_create = function(doc, req) {
  var form = JSON.parse(req.body);
  if(doc === null) {
    form._id        = 'subscription:'+form.email;
    form.type       = 'subscription';
    form.created_at = new Date().getTime();
    form.updated_at = form.created_at;
    form.token      = req.uuid;
    return [form, 'ok'];
  }
  throw({forbidden: 'Only for creation'});
}
