'use strict';

const gulp  = require('gulp');
const shell = require('gulp-shell');

gulp.task('default', shell.task('npm start'));

gulp.task('truffle-shell', shell.task('npm run watch'));

gulp.task('watch', ['default'], () => {
  gulp.watch(['./contracts/*.sol'], ['truffle-shell']);
});