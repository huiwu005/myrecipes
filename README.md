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

# 42 notes ===========================
Minitest
Layout of the application

integration testing
Model Tests - unit testing
# 42 notes ===========================
# 42 notes ===========================
# 42 notes ===========================
# 42 notes ===========================
# 42 notes ===========================