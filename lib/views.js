var reExports = require('./utils').reExports;

reExports(exports, 'src/Blog/views');

reExports(exports, 'src/Comment/views');

reExports(exports, 'src/Notification/views');

reExports(exports, 'src/Tweet/views');

exports.subscription_all = {
  map: function (doc) {
    if(doc.type == 'subscription') {
      emit(null, doc);
    }
  }
}
