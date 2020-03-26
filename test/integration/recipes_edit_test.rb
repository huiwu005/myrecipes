require 'test_helper'

class RecipesEditTest < ActionDispatch::IntegrationTest
  def setup
    @chef = Chef.create!(chefname: "mashrur", email: "mashrur@example.com")
    @recipe = Recipe.create!(name: "vegetable saute", description: "great vegetable saute add vegitable and oil", chef: @chef)
  end    

  test 'reject invalid recipe update' do
    get edit_recipe_path(@recipe)
    assert_template 'recipes/edit'
    patch recipe_path(@recipe), params: { recipe: {name: " ", decription: "some drcription"}} # this should be rejected
    assert_template 'recipes/edit'
    assert_select 'h2.panel-title'
    assert_select 'div.panel-body'
  end

  test 'successfully edit a recipe' do
    
  end
end
