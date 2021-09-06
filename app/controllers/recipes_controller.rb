class RecipesController < ApplicationController
  include ApplicationHelper
  before_action :signed_in?, only: [:edit, :create, :update, :destroy, :recommend]

  def signed_in?
    if user_signed_in?
      
    else
      redirect_to signin_path, notice: 'Please sign in first to perform the following action' 
    end
  end

  def new
    render :create
  end
  # recipe list
  def index
    @recipes = Recipe.all
    render :index, recipes: @recipes
  end

  # show each item on its own page
  def show
    @recipe = Recipe.find_by!(id: params[:id])
    render :show, recipes: @recipe
  end

  def edit
  end

  def create
    # make sure user is signed in 
    @recipe = Recipe.create!(recipe_params)
    if @recipe
      redirect_to recipes_path, success: 'Recipe posted successfully'
    end
  end

  def open_recipe
    render :json => {}
  end

  def update
    recipe = Recipe.find_by!(id: params[:id])
    recipe.update(recipe_params.except(:id))
    redirect_to recipes_path
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
  RECIPE_PARAMS = %w[id title body ingredients user_id recommendations].freeze

  def recipe_params
    params.require(:recipe).permit(RECIPE_PARAMS)
  end

end
