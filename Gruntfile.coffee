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
      kansoDelete:{
        command: ->
          name = grunt.option('db') || 'default'
          return "kanso deletedb #{name}"
      }
      kansoCreate:{
        command: ->
          name = grunt.option('db') || 'default'
          return "kanso createdb #{name}"
      }
      kansoInit:{
        command: ->
          name = grunt.option('db') || 'default'
          return "kanso upload ./data #{name}"
      }
      kansoPush:{
        command: ->
          name = grunt.option('db') || 'default'
          return "kanso push #{name}"
      }
    }
  }

  grunt.registerTask('init', [
    'shell:kansoDelete'
    'shell:kansoCreate'
    'shell:kansoInit'
    'shell:kansoPush'
  ])

  grunt.registerTask('default', [
    'watch'
  ])
