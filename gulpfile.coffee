'use strict'

gulp = require 'gulp'
watch = require 'gulp-watch'
mocha = require 'gulp-mocha'

path = require 'path'

gulp.task 'watch', ->
  gulp.watch ['src/*.coffee', 'test/*.coffee'], ['mocha']

gulp.task 'mocha', ->
  require 'espower-coffee/guess'

  gulp.src('test/*.coffee', {read: false})

  .pipe mocha {
    reporter: 'spec'
  }

gulp.task 'default', ['mocha', 'watch']
