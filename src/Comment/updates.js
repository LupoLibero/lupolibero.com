exports.comment_create = function(doc, req) {
  var form = JSON.parse(req.body);
  if(doc === null) {
    form.id        = form.parent_id+'-'+req.userCtx.name+'-'+req.uuid.substr(req.uuid.length -4);
    form._id        = 'comment:'+form.id;
    form.type       = 'comment';
    form.author     = req.userCtx.name;
    form.created_at = new Date().getTime();
    return [form, 'ok'];
  }
  throw({forbidden: 'Doc must not be null'});
}

exports.comment_create_public = function(doc, req) {
  var form = JSON.parse(req.body);
  log(req);
  if(doc === null) {
    form.type = 'comment';
    form._id = req.uuid;
    form.created_at = new Date().getTime();

    if (form.hasOwnProperty('website') && !form.website) {
      delete form.website;
    }
    log('ok');
    return [form, 'ok'];
  }
  throw({forbidden: 'Doc must not be null'});
}
