module.exports = {
  rewrites:             require('./rewrites'),
  views:                require('./views'),
  types:                require('./types'),
  updates:                require('./updates'),
  validate_doc_update:  require('./validate').validate_doc_update,
  language:             "javascript"
}
