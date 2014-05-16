angular.module('site').
run( ($location, Subscription)->
  params = $location.search()
  if params.token? and params.unsubscribe?
    console.log params
    Subscription.update({
      update: 'unsubscribe'

      id:    params.unsubscribe
      token: params.token
    }).then(
      (data)-> #Success
        console.log data
      ,(err)-> #Error
        console.log err
    )
)
