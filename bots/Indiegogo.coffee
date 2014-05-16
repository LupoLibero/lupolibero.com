https   = require('https')
db      = require('./db')()
url     = require('./config.json').indiegogo
user    = require('./config.json').bots_user
cheerio = require('cheerio')

https.get(url, (res)->
  res.setEncoding('UTF-8')
  res.on 'data', (data)->
    $ = cheerio.load(data)
    info = {
      actual:       $('.currency-xlarge>span').text().trim()
      max:          $('.i-raised>span').text().trim()
      percent:      $('.i-percent').text().trim()
      contributor:  $('.i-float-tab-links .i-count').eq(2).text().trim()
      time:         $('.i-time-left').text().trim()
    }

    if  info.actual  != '' and
    info.percent     != '' and
    info.contributor != '' and
    info.time        != '' and
    info.max         != ''
      db.update('indiegogo_save', 'indiegogo', info, user).then(
        (data)-> #Success
          console.log data
        ,(err)-> #Error
          console.log err
      )
)
