class CommentsController < ApplicationController
  include ApplicationHelper
  before_action :signed_in?, only: [:create, :destroy]

  def signed_in?
    if user_signed_in?
      
    else
      redirect_to signin_path, notice: 'Please sign in first to perform the following action' 
    end
  end

  def create
    Comment.create!(comment_params)
    redirect_back(fallback_location: show_recipe_path(:id)) #url_for(:controller => :recipes, :action => :show)
  end

  def destroy
    permitted_params = params.require(:comment).permit(:id)
    comment = Comment.find_by!(id: permitted_params[:id])
    comment.destroy!
  end
  
  # rename comment column
  def comment_params
    params.require(:comment).permit(:user_id, :recipe_id, :comment)
  end

end
