Notification  = require('./Model/Notification')
Mail          = require('./Mail')

Notification.all().then(
  (data)-> #Success
    max = data.length
    i   = 0
    data.forEach (notification)->
      Mail.send(notification, notification.subscriber)
        .then(Notification.hasBeenSend)
        .then(
          (data)-> #Success
            i++
            console.log('Mail Send')
            if i == max
              process.exit(1)
          ,(err)-> #Error
            i++
            console.log('error', err)
            if i == max
              process.exit(1)
        )
  ,(err)-> #Success
    console.log('error', err)
)
