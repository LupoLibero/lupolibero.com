db   = require('../db')()
Q    = require('q')
user = require('../config.json').bots_user

module.exports = {
  save: (tweet)=>
    return db.update('tweet_save', '', tweet, user)

  saveFollowers: (number)=>
    return db.update('tweet_save_follower', 'follower', {
      twitter: number
    }, user)
}
