module.exports = [
  {from: '/static/*', to: 'static/*'},
  {from: '/js/*', to: 'static/js/*'},
  {from: '/images/*', to: 'static/images/*'},
  {from: '/css/*', to: 'static/css/*'},
  {from: '/font/*', to: 'static/font/*'},
  {from: '/templates/*', to: '/templates/*'},
  {from: '/', to: 'templates/index.html'},
  {from: '/*', to: 'templates/*'}
]
