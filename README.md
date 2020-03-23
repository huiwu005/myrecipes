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
https://try.ruby-lang.org/
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
# 54 notes ===========================
database and 1:m associations

- Relational Databased
- SQL - Structured Query Language
- ActiveRecord - abstraction - Ruby - translated to SQ
L

## Database layer, Associations
1:m -- one to many
m:m -- many to many
Object Relational Mapper - ORM
Relational Database
Virtual atrributes are
ORM

e.g. Database
aritcles
ID      title           description                     user_id
1       Great Weather   Great Weather outside today     3
2       Second Article  Today is great day of coding    2
3       ...              ...                            6
...

users
ID      username    email
1       joe         joe@example.com
2
3
...
6
...

hans_many // on the one side
belongs_to // on the many side

## Relational Database
goto Todo app

# 56 notes ===========================
Switch back from todoapp



# 56 notes ===========================
Recipes
ID, name, descrtiption, chef_id

Chefs
ID, name, email

# 56 notes ===========================
Recipe 
- recipe should be valid
- name should be present
- description should be present 
- chef_id should be present -- later **
- maximum length for name and description, maybe a minimum for description

Chef
- chefname should be present
- email should be present
- size restrictions on email and chefname
- email address should be valid format
- email should be unique, case insensitive

# 56 notes ===========================
# 56 notes ===========================
# 56 notes ===========================
# 56 notes ===========================
# 56 notes ===========================
