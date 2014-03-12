module.exports = {
  rewrites:             require('./rewrites'),
  views:                require('./views'),
  types:                require('./types'),
  validate_doc_update:  require('./validate').validate_doc_update,
  language:             "javascript"
}
