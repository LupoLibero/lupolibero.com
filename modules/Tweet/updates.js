exports.tweet_save = function(doc, req) {
  var form = JSON.parse(req.body);
  if(doc === null) {
    form._id        = 'tweet:'+form.id;
    form.type       = 'tweet';
    return [form, 'ok'];
  }
  throw({forbidden: 'Doc must not be null'});
}

exports.tweet_save_follower = function(doc, req) {
  var form = JSON.parse(req.body);
  if(doc !== null) {
    doc.num = form.num;
    return [doc, 'ok'];
  }
  throw({forbidden: 'Doc must not be null'});
}
