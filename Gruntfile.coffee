
module.exports = (grunt) ->
    'use strict'

    grunt.initConfig

        clean:
            all:
                ['dist/']
            js:
                ['dist/assets/js/']

        coffee:
            main:
                expand: true
                cwd: 'assets/js/'
                src: ['**/*.coffee']
                ext: '.js'
                dest: 'dist/assets/js/'

        less:
            main:
                options:
                    paths: ["assets/less"]
                files:
                    "assets/css/style.min.css": "assets/less/app.less"

        uglify:
            main:
                # options:
                #     beautify: true
                #     preserveComments: true
                #     mangle: false
                files:
                    'assets/js/scripts.min.js': [
                        'vendor/bower/jquery/dist/jquery.js'

                        'vendor/bower/moment/min/moment.min.js'

                        'vendor/bower/jquery-rss/dist/jquery.rss.min.js'

                        'vendor/bower/bootstrap/js/transition.js'
                        'vendor/bower/bootstrap/js/alert.js'
                        'vendor/bower/bootstrap/js/button.js'
                        'vendor/bower/bootstrap/js/carousel.js'
                        'vendor/bower/bootstrap/js/collapse.js'
                        'vendor/bower/bootstrap/js/dropdown.js'
                        'vendor/bower/bootstrap/js/modal.js'
                        'vendor/bower/bootstrap/js/tooltip.js'
                        'vendor/bower/bootstrap/js/popover.js'
                        'vendor/bower/bootstrap/js/scrollspy.js'
                        'vendor/bower/bootstrap/js/tab.js'
                        'vendor/bower/bootstrap/js/affix.js'

                        'assets/js/parallaxit.js'
                        'dist/assets/js/*.js'
                    ]

        watch:
            options:
                livereload: true
            less:
                files: ['assets/less/*']
                tasks: ['less']
            copy:
                files: ['*.html', 'assets/img/*', 'assets/img/**/*', 'assets/font/*']
                tasks: ['copy']
            uglify:
                files: ['assets/js/*']
                tasks: ['clean:js', 'coffee', 'uglify']

        connect:
            server:
                options:
                    port: 9001
                    base: './'

    grunt.loadNpmTasks 'grunt-contrib-clean'
    grunt.loadNpmTasks 'grunt-contrib-uglify'
    grunt.loadNpmTasks 'grunt-contrib-copy'
    grunt.loadNpmTasks 'grunt-contrib-coffee'
    grunt.loadNpmTasks 'grunt-contrib-less'
    grunt.loadNpmTasks 'grunt-contrib-watch'
    grunt.loadNpmTasks 'grunt-contrib-compress'
    grunt.loadNpmTasks 'grunt-contrib-connect'


    grunt.registerTask 'default', [
        'clean:all', 'coffee', 'uglify', 'less'
    ]

    grunt.registerTask 'dev', [
        'clean:all', 'coffee', 'uglify', 'less', 'connect', 'watch'
    ]
