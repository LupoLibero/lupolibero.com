config   = require('./config.json').twitter
Tweet    = require('./Model/Tweet')
Post     = require('./Model/Post')
Twitter  = new (require('twit'))({
  consumer_key:         config.key
  consumer_secret:      config.secret
  access_token:         config.token
  access_token_secret:  config.token_secret
})

Twitter.get('statuses/user_timeline', {
  screen_name:     config.screen_name
  include_rt:      false
  count:           4
  exclude_replies: true
}, (err, tweets, response)->
  for tweet in tweets
    date = tweet.created_at.split(' ')
    date = "#{date[0]}, #{date[2]} #{date[1]} #{date[5]} #{date[3]}"
    tweet = {
      id:         tweet.id
      created_at: date
      author:     tweet.user.screen_name
      text:       tweet.text
      img:        tweet.user.profile_image_url
    }
    Tweet.save(tweet)
)

Twitter.get('users/show', {
  screen_name: config.screen_name
}, (err, data, response)->
  Tweet.saveFollowers(data.followers_count)
)

# Post.all().then(
#   (data)-> #Success
#     data.forEach (post)->
#       console.log "http://www.lupolibero.org/blog/#{post.slug}"
#   ,(err)-> #Error
#     console.log err
# )
