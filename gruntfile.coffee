module.exports = (grunt) ->

  # Utilities
  grunt.loadNpmTasks 'grunt-ts'
  grunt.loadNpmTasks 'grunt-notify'
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-watch'

  # Distribution build
  grunt.registerTask "dist", ["ts:dist", "notify:ts", "uglify:dist", "notify:uglify"]

  # Configuration
  grunt.initConfig
    # Notifier options
    notify:
      ts:
        options:
          title:   'TypeScript'
          message: 'Compilation finished.'

      uglify:
        options:
          title:   'UglifyJS'
          message: 'Minification finished.'

    # Typescript options
    ts:
      dist:
        src: ["src/_reference.ts"]
        out: "dist/tally.js"
        sourceMap: true
        options:
          declaration: true

    # Minifier options
    uglify:
      options:
        mangle: true

      dist:
        files:
          "lib/tally.min.js": ["dist/tally.js"]

    # Watch options
    watch:
      dist:
        files: ["src/**/*.ts"]
        tasks: ["dist"]
