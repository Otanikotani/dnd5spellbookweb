/**
 * This file/module contains all configuration for the build process.
 */
module.exports = {
  /**
   * The `build_dir` folder is where our projects are compiled during
   * development and the `compile_dir` folder is where our app resides once it's
   * completely built.
   */
  build_dir: 'bin',
  compile_dir: '../webapp/static',

  /**
   * This is a collection of file patterns that refer to our app code (the
   * stuff in `src/`). These file paths are used in the configuration of
   * build tasks. `js` is all project javascript, less tests. `ctpl` contains
   * our reusable components' (`src/common`) template HTML files, while
   * `atpl` contains the same, but for our app's code. `html` is just our
   * main HTML file, `less` is our main stylesheet, and `unit` contains our
   * app's unit tests.
   */
  app_files: {
    js: [ 'src/**/*.js', '!src/**/*.spec.js', '!src/assets/**/*.js' ],
    jsunit: [ 'src/**/*.spec.js' ],
    
    coffee: [ 'src/**/*.coffee', '!src/**/*.spec.coffee' ],
    coffeeunit: [ 'src/**/*.spec.coffee' ],

    atpl: [ 'src/app/**/*.tpl.html' ],
    ctpl: [ 'src/common/**/*.tpl.html' ],

    html: [ 'src/index.html' ],
    less: 'src/less/main.less'
  },

  /**
   * This is a collection of files used during testing only.
   */
  test_files: {
    js: [
      'vendor/angular-mocks/angular-mocks.js'
    ]
  },

  /**
   * This is the same as `app_files`, except it contains patterns that
   * reference vendor code (`vendor/`) that we need to place into the build
   * process somewhere. While the `app_files` property ensures all
   * standardized files are collected for compilation, it is the user's job
   * to ensure non-standardized (i.e. vendor-related) files are handled
   * appropriately in `vendor_files.js`.
   *
   * The `vendor_files.js` property holds files to be automatically
   * concatenated and minified with our project source files.
   *
   * The `vendor_files.css` property holds any CSS files to be automatically
   * included in our app.
   *
   * The `vendor_files.assets` property holds any assets to be copied along
   * with our app's assets. This structure is flattened, so it is not
   * recommended that you use wildcards.
   */
  vendor_files: {
    js: [
      'vendor/angular/angular.js',
      'vendor/angular-animate/angular-animate.js',
      'vendor/lodash/dist/lodash.min.js',
      'vendor/angular-resource/angular-resource.js',
      'vendor/placeholders/angular-placeholders-0.0.1-SNAPSHOT.min.js',
      'vendor/angular-ui-router/release/angular-ui-router.js',
      'vendor/angular-ui-utils/modules/route/route.js',
      'vendor/jquery/jquery.js',
      'vendor/jquery/jquery-ui.min.js',
      'vendor/bootstrap-floating-labels/floating-labels.js',
      'vendor/bootstrap/dist/js/bootstrap.min.js',
      'vendor/angular-bootstrap-multiselect/angular-bootstrap-multiselect.js',
      'vendor/Chart.js/Chart.min.js',
      'vendor/angular-chart.js/angular-chart.js',
      'vendor/fusioncharts-suite-xt/js/fusioncharts.js',
      'vendor/fusioncharts-suite-xt/js/fusioncharts.charts.js',
      'vendor/fusioncharts-suite-xt/js/fusioncharts.widgets.js',
      'vendor/fusioncharts-suite-xt/js/fusioncharts.powercharts.js',
      'vendor/fusioncharts-suite-xt/js/fusioncharts.gantt.js',
      'vendor/fusioncharts-suite-xt/js/themes/fusioncharts.theme.fint.js',
      'vendor/bootstrap-treeview/dist/bootstrap-treeview.min.js'
    ],
    css: [
      'vendor/animate.css/animate.min.css',
      'vendor/angular-chart.js/angular-chart.less',
      'vendor/glyphicons-large/css/bootstrap.icon-large.min.css',
      'vendor/bootstrap-treeview/dist/bootstrap-treeview.min.css'
    ],
    assets: [
      'vendor/glyphicons-large/img/glyphicons.png'
    ]
  }
};
