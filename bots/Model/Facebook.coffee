db   = require('../db')()
Q    = require('q')
user = require('../config.json').bots_user

module.exports = {
  saveLikes: (likes)=>
    return db.update('facebook_save_likes', 'follower', {
      likes: likes
    }, user)
}
