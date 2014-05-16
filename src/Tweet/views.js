exports.tweet_all = {
  map: function(doc) {
    if(doc.type && doc.type == 'tweet'){
      emit(doc.created_at, doc);
    }
  }
}
