class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all

  end

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build(name: 'name')
    @recipe.ingredients.build(quantity: 'quantity')
  end

  def create
    redipe = Recipe.create(recipe_params)
    redirect_to recipes_path
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, ingredients_attributes: [:id, :name, :quantity])
  end

end
