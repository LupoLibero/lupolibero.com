exports.presentation_get = {
  map: function(doc) {
    var translation = require('views/lib/translation').translation;
    if(doc.type && doc.type == 'presentation'){
      translation.emitTranslatedDoc(
        [translation._keyTag],
        {
          content: doc.content,
        },
        {content: true}
      );
    }
  }
}

exports.idea_all = {
  map: function(doc) {
    var translation = require('views/lib/translation').translation;
    if(doc.type && doc.type == 'idea'){
      translation.emitTranslatedDoc(
        [translation._keyTag, doc._id],
        {
          short: doc.short,
          long: doc.long,
          img: doc.img,
        },
        {long: true, short:true}
      );
    }
  }
}

