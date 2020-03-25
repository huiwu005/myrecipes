require 'test_helper'

class RecipesTest < ActionDispatch::IntegrationTest
  def setup
    @chef = Chef.create!(chefname: "mushrur", email: "mushrur@example.com")
    # two ways to create
    @recipe = Recipe.create!(name: "vegetable saute", description: "great vegetable saute add vegitable and oil", chef: @chef)
    @recipe2 = @chef.recipes.build(name: "chicken saute", description: "greate chicken dish")
    @recipe2.save      
  end

  test "should get recipes index" do
    get recipes_path
    assert_response :success
  end

  test "should get recipes listing" do
    get recipes_path
    assert_template "recipes/index"
    assert_match @recipe.name, response.body #show up in index page
    assert_match @recipe2.name, response.body
  end
end
