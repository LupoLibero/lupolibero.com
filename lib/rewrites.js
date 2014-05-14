module.exports = [
  {from: '/static/*',     to: 'static/*'},
  {from: '/js/*',         to: 'static/js/*'},
  {from: '/images/*',     to: 'static/images/*'},
  {from: '/css/*',        to: 'static/css/*'},
  {from: '/font/*',       to: 'static/font/*'},
  {from: '/partials/*',   to: 'partials/*'},
  {from: '/vendor/*',     to: 'static/vendor/*'},
  {from: '/favicon.ico',  to: 'static/images/favicon.ico'},
  {from: '/',             to: 'partials/index.html'},
  {from: '/*',            to: 'partials/*'}
]
