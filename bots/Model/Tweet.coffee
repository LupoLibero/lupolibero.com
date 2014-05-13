db   = require('../db')()
Q    = require('q')
user = require('../config.json').notification_manager

module.exports = {
  save: (tweet)=>
    return db.update('tweet_save', '', tweet)

  saveFollowers: (number)=>
    return db.update('tweet_save_follower', 'follower', {
      twitter: number
    })
}
