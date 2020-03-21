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
https://devcenter.heroku.com/articles/git
$ heroku create
Creating app... done, ⬢ peaceful-cliffs-10078
https://peaceful-cliffs-10078.herokuapp.com/ | https://git.heroku.com/peaceful-cliffs-10078.git
$ heroku git:remote -a peaceful-cliffs-10078
$ git push heroku master <!--  or -->
$ git push heroku master --no-verify
    --- remote:        https://peaceful-cliffs-10078.herokuapp.com/ deployed to Heroku
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
Look at some sample layouts for homepage, and come up with a homepage design

1. Create a mockup! Or use Bootstrap
Bootstrap
https://getbootstrap.com/docs/3.3/getting-started/
Using this template
https://getbootstrap.com/docs/3.3/examples/jumbotron/

# 46 notes ===========================
learn to code html & css
https://learn.shayhowe.com/


# 48 notes ===========================
copy navigation bar from website
https://getbootstrap.com/docs/3.3/components/#navbar

for css color
google `htom color picker` use #073815 for green

- use bootstrap `jumbotron` example as body style in 
home.html.erb
<div class = "jumbotron"></div>

- add `yield` field into `container`
app/views/layouts/application.html.erb
    <div class = "container">
      <%= yield %>
    </div>
- change text align to center
home.html.erb
    <div class = "jumbotron center"> </div>
custom.css.scss add
    .center {
        text-align: center;
    }

# 50 notes ===========================
- change background
https://unsplash.com/

- add three column on home page
https://getbootstrap.com/docs/3.3/examples/justified-nav/
choose example, right click -> view page source
<!-- Example row of columns -->
copy below <div></div>
<!-- Site footer -->

- homework
Assignment: Create the footer, add styling and then paste an image of it to the Q & A!
deploy this application
# 42 notes ===========================
# 42 notes ===========================