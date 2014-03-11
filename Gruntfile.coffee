module.exports = (grunt) ->
  require('load-grunt-tasks')(grunt)

  grunt.initConfig {
    watch: {
      all: {
        files: [
          'modules/{,*/}*'
          'partials/{,*/}*'
          'lib/{,*/}*'
        ]
        tasks: [
          'shell:kansoPush'
        ]
      }
    }
    coffee: {
      options:
        join: true
        bare: true
      dist: {
        files:
          'static/js/main.js': [
            'modules/*/__init__.coffee'
            'modules/*/config.coffee'
            'modules/*/routes.coffee'
            'modules/*/*.coffee'
          ]
      }
    }
    # Kanso
    shell:{
      options:
        stdout: true
      kansoPush:{
        command: 'kanso push http://admin:admin@127.0.0.1:5984/site'
      }
    }
  }

  grunt.registerTask('default', [
    'watch'
  ])
