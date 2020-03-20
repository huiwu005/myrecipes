# README

Create new myrecipes app
$ rails new myrecipes

## change below for heroku
- replace `sqlite3` to `pg` in Gemfile
- update `adapter:` and `database:` in config/database.yml to
`adapter: postgresql`
- change the database: to a custom name
`database: my_database_development`
`database: my_database_test`
`database: my_database_production`

## for guard and LiveReload on webpage
- add `'guard' 'guard-rspec' 'guard-livereload' 'rb-readline' 'pry-coolline'` into Gemfile `group :development, :test ` to run guard LiveReload
- add `guardfile` to app directory

## deploy on heroku
$ git push heroku master
    --- remote:        https://agile-cliffs-82036.herokuapp.com/ deployed to Heroku
$ heroku run rails db:migrate

# 42 notes ===========================
## Minitest
Layout of the application

## integration testing
## Model Tests - unit testing
$ rails g integration_test pages
$ rails test
TDD - design the app functionality based on a test first approach
Write the test for the functionality
Build minimum code necessary to make each test pass

Re-factor the code - *code doesn't smell* - clean code, confidence

# 42 notes ===========================
# 42 notes ===========================
# 42 notes ===========================
# 42 notes ===========================
# 42 notes ===========================