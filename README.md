# README
Skip adding ActiveStorage on new builds https://mikerogers.io/2018/04/13/remove-activestorage-from-rails-5-2.html
Create new myrecipes app
$ rails new myrecipes --skip-active-storage

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

# 58 notes ===========================
> @m = Recipe.new
> Recipe
 => Recipe(id: integer, name: string, description: text, created_at: datetime, updated_at: datetime) 

> @m = Recipe.new(name: "", description: "")
 => #<Recipe id: nil, name: "", description: "", created_at: nil, updated_at: nil> 
> @m.save
  (0.3ms)  BEGIN
  Recipe Create (2.2ms)  INSERT INTO "recipes" ("name", "description", "created_at", "updated_at") VALUES ($1, $2, $3, $4) RETURNING "id"  [["name", ""], ["description", ""], ["created_at", "2020-03-24 15:02:17.239771"], ["updated_at", "2020-03-24 15:02:17.239771"]]
   (0.4ms)  COMMIT
 => true 

 ## add validateion
 add `validates :name, presence: true` in recipe.rb
 > @m = Recipe.new(name: "", description: "")
 => #<Recipe id: nil, name: "", description: "", created_at: nil, updated_at: nil> 
> @m.save <!-- can't be saved after validates applied -->
   (0.3ms)  BEGIN
   (0.2ms)  ROLLBACK
 => false 
> @m.errors.any?
 => true 
> @m.errors.full_messages
 => ["Name can't be blank"] 
> Recipe.delete_all <!-- delete all data -->
  Recipe Destroy (0.8ms)  DELETE FROM "recipes"
 => 1 

## homework
build Chefs database

## testing
read https://guides.rubyonrails.org/testing.html#available-assertions
require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
    def setup
        @recipe = Recipe.new(name: "vegetable", description: "great vegetable recipe")
    end
    test "recipe should be valid" do
        assert @recipe.valid?
    end
end
$ rails test <!-- run test -->
    #validates :name, presence: true <!-- comment this in recipe.rb -->
<!-- add below in recipe_test.rb, then test will be failed -->
    test 'name should be present' do
        @recipe.name = " "
        assert_not @recipe.valid?
    end
$ rails test
Expected true to be nil or false
then remove comment test again, the testing should be passed

# 60 notes ===========================
test regex format by using https://rubular.com/

# 64 notes ===========================
one to many association
> @c = Chef.new(chefname: "m", email: "m@example.com")
> @c.save
<!-- create can hit our db -->
> @c1 = Chef.create(chefname: "john", email: "john@example.com")
> Chef.all <!-- we have two chefs -->
  Chef Load (0.3ms)  SELECT  "chefs".* FROM "chefs" LIMIT $1  [["LIMIT", 11]]
 => #<ActiveRecord::Relation [
     #<Chef id: 1, chefname: "m", email: "m@example.com", created_at: "2020-03-24 18:49:51", updated_at: "2020-03-24 18:49:51">, 
     #<Chef id: 2, chefname: "john", email: "john@example.com", created_at: "2020-03-24 18:52:52", updated_at: "2020-03-24 18:52:52">]> 

<!-- Since chef has associate to recipes, we can create recipes automatically assign to the chef using below command -->
> chef = Chef.last
> recipe = chef.recipes.build(name: "italian vegetables", description: "amazing italian vegetables cooked for 20 minutes")
 => #<Recipe id: nil, name: "italian vegetables", description: "amazing italian vegetables cooked for 20 minutes", created_at: nil, updated_at: nil, chef_id: 2> 
> recipe.save
    (0.2ms)  BEGIN
  Recipe Create (0.4ms)  INSERT INTO "recipes" ("name", "description", "created_at", "updated_at", "chef_id") VALUES ($1, $2, $3, $4, $5) RETURNING "id"  [["name", "italian vegetables"], ["description", "amazing italian vegetables cooked for 20 minutes"], ["created_at", "2020-03-24 19:01:38.077213"], ["updated_at", "2020-03-24 19:01:38.077213"], ["chef_id", 2]]
   (0.4ms)  COMMIT
 => true 
> recipe.chef 
=> #<Chef id: 2, chefname: "john", email: "john@example.com", created_at: "2020-03-24 18:52:52", updated_at: "2020-03-24 18:52:52"> 
> recipe.chef.chefname
=> "john" 
<!-- forget below error, I got this correct later after create new recipe. Don't know why and how -->
        <!-- below command I have different disply here than Udemy lecture -->
        > recipe.chef 
        <!-- in Udemy got chef info -->
        => #<Chef id: 2, chefname: "john", email: "john@example.com", created_at: "2020-03-24 18:52:52", updated_at: "2020-03-24 18:52:52"> 
        <!-- but I got error --> 
            Traceback (most recent call last):
                    1: from (irb):94
            NoMethodError (undefined method `chef' for #<Recipe:0x00007fb6599715a0>)
            Did you mean?  chef_id

> chef.recipes <!-- this works -->
  Recipe Load (0.2ms)  SELECT  "recipes".* FROM "recipes" WHERE "recipes"."chef_id" = $1 LIMIT $2  [["chef_id", 2], ["LIMIT", 11]]
 => #<ActiveRecord::Associations::CollectionProxy [#<Recipe id: 2, name: "italian vegetables", description: "amazing italian vegetables cooked for 20 minutes", created_at: "2020-03-24 19:01:38", updated_at: "2020-03-24 19:01:38", chef_id: 2>]> 

> recipe = Recipe.create(name: "vegetable saute", description: "lots of vegetables cooked inoil for 15 min", chef_id: 2)
> chef.recipes
  Recipe Load (0.3ms)  SELECT  "recipes".* FROM "recipes" WHERE "recipes"."chef_id" = $1 LIMIT $2  [["chef_id", 2], ["LIMIT", 11]]
 => #<ActiveRecord::Associations::CollectionProxy [
     #<Recipe id: 2, name: "italian vegetables", description: "amazing italian vegetables cooked for 20 minutes", created_at: "2020-03-24 19:01:38", updated_at: "2020-03-24 19:01:38", chef_id: 2>, 
     #<Recipe id: 3, name: "vegetable saute", description: "lots of vegetables cooked inoil for 15 min", created_at: "2020-03-24 19:47:37", updated_at: "2020-03-24 19:47:37", chef_id: 2>]> 

-- or -- 
> recipe = Recipe.new(name: "vegetable saute", description: "lots of vegetables cooked inoil for 15 min")
> chef.recipes << recipe <!-- insert, hit db, auto assign to chef -->

# 66 notes ===========================
back to web
Prefix       Verb     URI Pattern                Controller#Action
root        GET     /                           pages#home
pages_home  GET     /pages/home(.:format)       pages#home
new_recipe  GET     /recipes/new                recipes#new         #display a new form
            POST    /recipes                    recipes#create      #submit the information from the form
edit_recipe GET     /recipes/:id/edit           recipes#edit        #display on edit form
            PATCH   /recipes/:id                recipes#update      #submit the edited form information
recipe      GET     /recipes/:id                recipes#show        #display a particular recipe
            DELETE  /recipes/:id                recipes#destroy     #deletes a particular recipe --- **specify DELETE to get destroy action**


# 67 notes ===========================
$ rails g integration_test recipes


# 67 notes ===========================
# 67 notes ===========================
# 67 notes ===========================
# 67 notes ===========================
# 67 notes ===========================
# 67 notes ===========================
# 67 notes ===========================
# 67 notes ===========================
# 67 notes ===========================
# 67 notes ===========================
