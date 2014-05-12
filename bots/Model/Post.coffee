db   = require('../db')()
Q    = require('q')

module.exports = {
  all: =>
    return db.view('blogpost_all', {
      startkey:  ['en', ""]
      endkey:    ['en', {}]
    })
}
