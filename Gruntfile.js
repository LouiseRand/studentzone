module.exports = function (grunt) {
    const sass = require('node-sass');
    grunt.loadNpmTasks('grunt-sass');
    grunt.loadNpmTasks('grunt-contrib-watch');
    grunt.registerTask('default', ['watch:scss']);

    grunt.initConfig({
        pkg: grunt.file.readJSON('package.json'),
        sass: {                                           //task to handle compiling SCSS down to CSS
            main: {
                options: {
                    sourceMap: true,
                    outputStyle: 'compressed',
                    implementation: sass,
                },
                files: {
                    './css/styles.css': './scss/main.scss'
                }
            },
        },

        watch: {                                          //task for “watching” .scss files
            scss: {
                files: ['./scss/**/*.scss'],
                tasks: ['sass:main'],
                options: {
                    spawn: false,
                },
            },
            js: {                                        //task for "watching" JS
                files: ['./scripts/**/*.js'],
                tasks: ["uglify:main"],
                options: {
                    spawn: false,
                },
            },
        },

        uglify:{                                          //compiling JS to reduce the number of user HTTP requests
            main: {
                options: {
                    sourceMap: false,
                    compress: true,
                    mangle: false,
                },
                files: {
                    "./js/scripts.min.js": ["./scripts/**/*.js"],
                },
            },
            vendor: {
                options: {
                    sourceMap: false,
                    compress: true,
                    mangle: false,
                },
                files: {
                    "./js/scripts-vendor.min.js": [
                        "./node_modules/bootstrap/dist/js/bootstrap.min.js",  //compile 3rd party JS from node_modules into scripts-vendor.min.js
                        "./node_modules/lightgallery/lightgallery.min.js"
        
                    ],
                },
            },
            
        },
        concurrent: {                                   //watch both js and and sass together
            options: {
                logConcurrentOutput: true,
                limit: 10,
            },
            watchall: {
                tasks: ["watch:scss", "watch:js"],
            },
        },
        
        
    });

    grunt.loadNpmTasks("grunt-concurrent");
    grunt.loadNpmTasks("grunt-contrib-uglify");

    grunt.registerTask('default', ['concurrent:watchall']);
    grunt.registerTask("vendors", ["uglify:vendor"]);
    
};
