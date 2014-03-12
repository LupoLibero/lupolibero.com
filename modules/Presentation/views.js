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

