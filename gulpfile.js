'use strict';

const gulp  = require('gulp');
const shell = require('gulp-shell');

gulp.task('default', shell.task('npm start', {
  ignoreErrors: true,
  verbose: true,
}));

gulp.task('truffle-shell', shell.task('npm run compile && npm run migrate', {
  ignoreErrors: true,
  verbose: true,
}));

gulp.task('watch', ['default'], () => {
  gulp.watch(['./contracts/*.sol', './migrations/*.js'], ['truffle-shell']);
});
