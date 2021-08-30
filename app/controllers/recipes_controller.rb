class RecipesController < ApplicationController

  # recipe list
  def index
    render :json => {}
  end

  # show each item on its own page
  def show
    redirect_to recipe_item_path + "/" + params[:id] 
  end

  def create
    @new_recipe = Recipe.create!(recipe_params)
    if @new_recipe
      # puts @new_recipe.title
    end
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
    params.require(:recipe).permit(:id, :title, :body, :ingredients, :user_id, :recommendations)
  end

end
