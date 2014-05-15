module.exports = [
  {from: '/static/*',     to: 'static/*'},
  {from: '/js/*',         to: 'static/compress/js/*'},
  {from: '/images/*',     to: 'static/compress/images/*'},
  {from: '/css/*',        to: 'static/compress/css/*'},
  {from: '/font/*',       to: 'static/font/*'},
  {from: '/partials/*',   to: 'partials/*'},
  {from: '/vendor/*',     to: 'static/compress/vendor/*'},
  {from: '/favicon.ico',  to: 'static/compress/images/favicon.ico'},
  {from: '/',             to: 'partials/index.html'},
  {from: '/*',            to: 'partials/*'}
]
