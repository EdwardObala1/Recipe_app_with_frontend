class RecipesController < ApplicationController

  # recipe list
  def index
    @recipe = Recipe.all
    render :index, recipe: @recipe
  end

  # show each item on its own page
  def show
    redirect_to recipe_item_path + "/" + params[:id] 
  end

  def create
    # require 'pry'
    # binding.pry
    @new_recipe = Recipe.create!(recipe_params)
    if @new_recipe
      redirect_to recipes_path, success: 'Recipe posted successfully'
    end
    puts 'Hi eddy'
    puts params[:recipe][:user_id]
  end

  def open_recipe
    render :json => {}
  end

  def update
    recipe = Recipe.find_by!(id: params[:id])
    recipe.update(recipe_params.except(:id))
  end

  def destroy
    recipe = Recipe.find_by!(id: params[:id])
    recipe.destroy
  end

  def recommend
    recipe = Recipe.find_by!(id: params[:id])
    recipe.recommendations += 1
    recipe.save!
  end
  

  def recipe_params
    params.permit(:title, :body, :ingredients, :user_id, :recommendations)
  end

end
