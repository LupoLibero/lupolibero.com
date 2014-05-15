config   = require('./config.json').twitter
page     = require('./config.json').facebook
http     = require('http')
Tweet    = require('./Model/Tweet')
Post     = require('./Model/Post')
Facebook = require('./Model/Facebook')
Twitter  = new (require('twit'))({
  consumer_key:         config.key
  consumer_secret:      config.secret
  access_token:         config.token
  access_token_secret:  config.token_secret
})

Twitter.get('statuses/user_timeline', {
  screen_name:     config.screen_name
  include_rt:      false
  count:           15
  exclude_replies: true
}, (err, tweets, response)->
  if err
    console.log err
  else
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
      Tweet.save(tweet).done()
)

Twitter.get('users/show', {
  screen_name: config.screen_name
}, (err, data, response)->
  console.log err
  Tweet.saveFollowers(data.followers_count).done()
)

http.request({
  method: 'GET'
  hostname: "graph.facebook.com"
  port: 80
  path: "/#{page}"
}, (res, err)->
  if err
    console.log err
  else
    res.setEncoding('utf-8')
    res.on('data', (body)->
      body = JSON.parse(body)
      Facebook.saveLikes(body.likes).done()
    )
).end()


# Post.all().then(
#   (data)-> #Success
#     data.forEach (post)->
#       console.log "http://www.lupolibero.org/blog/#{post.slug}"
#   ,(err)-> #Error
#     console.log err
# )

process.on 'uncaughtException', (err) ->
  console.error('An uncaughtException was found, the program will end.')
  console.error(err)
  process.exit(1)
