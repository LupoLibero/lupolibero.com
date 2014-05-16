exports.blogpost_get = {
  map: function(doc) {
    var translation = require('views/lib/translation').translation;
    if(doc.type && doc.type == 'blogpost'){
      var slug;
      for(var lang in doc.long) {
        slug = doc.slug[lang] || doc.slug.en;
        emit(slug, {
          _id:           doc._id,
          title:        doc.title[lang] || doc.title.en,
          long:         doc.long[lang],
          slug:         slug,
          created_at:   doc.created_at,
          author:       doc.author,
        })
      }
    }
  }
}

exports.blogpost_all = {
  map: function(doc) {
    var translation = require('views/lib/translation').translation;
    if(doc.type && doc.type == 'blogpost'){
      langs = ['en', 'fr']
      for(i in langs) {
        lang = langs[i]
        if(doc.title.hasOwnProperty(lang)) {
          emit(
            [lang, doc._id],
            {
              id:           doc.id,
              created_at:   doc.created_at,
              author:       doc.author,
              short:        doc.short[lang] || '',
              slug:         doc.slug[lang]  || '',
              title:        doc.title[lang] || {},
              lang:         lang,
            }
          );
        } else {
          emit(
            [lang, doc._id],
            {}
          );
        }
      }
    }
  }
}

exports.blogpost_max = {
  map: function(doc) {
    if(doc.type && doc.type == 'blogpost'){
      emit(null, doc);
    }
  },
  reduce: function(keys, values, rereduce){
    if(rereduce) {
      max = 0;
      for(i in values) {
        max += values[i].max;
      }
    } else {
      max = values.length;
    }
    return {
      max: max,
    }
  }
}
