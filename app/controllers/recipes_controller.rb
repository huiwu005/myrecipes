class RecipesController < ApplicationController
    before_action :set_recipe, only: [:edit, :update, :show, :destroy]

    def index
        @recipes = Recipe.all
    end

    def show
        @recipe = Recipe.find(params[:id])
    end

    def new
        @recipe = Recipe.new
    end

    def create
        @recipe = Recipe.new(recipe_params)
        @recipe.chef = Chef.first

        if @recipe.save
            flash[:sucess] = "Recipe was created sucessfully!"
            redirect_to recipe_path(@recipe)
        else
            render 'new'
        end
    end

    private
    def set_recipe
        @recipe = Recipe.find(params[:id])
    end
    def recipe_params
        params.require(:recipe).permit(:name,:description)
    end
end
