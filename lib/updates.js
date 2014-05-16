var reExports = require('./utils').reExports;

reExports(exports, 'src/Comment/updates');

reExports(exports, 'src/Notification/updates');

reExports(exports, 'src/Tweet/updates');

exports.facebook_save_likes = function(doc, req) {
  var form = JSON.parse(req.body);
  if(doc !== null) {
    doc.likes = form.likes;
    return [doc, 'ok'];
  }
  throw({forbidden: 'Doc must not be null'});
}

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

exports.indiegogo_save = function(doc, req) {
  var form = JSON.parse(req.body);
  if(doc !== null) {
    doc.actual      = form.actual;
    doc.percent     = form.percent;
    doc.contributor = form.contributor;
    doc.time        = form.time;
    doc.max         = form.max;
    if(parseInt(form.percent) > 100) {
      doc.percentage = '100%';
    } else {
      doc.percentage = form.percent;
    }
    return [doc, 'ok'];
  }
  throw({forbidden: 'Only for creation'});
}
