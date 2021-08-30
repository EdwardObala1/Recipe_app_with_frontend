class CommentsController < ApplicationController

  def add
    Comment.create!(comment_params)
  end

  def delete
    permitted_params = params.require(:comment).permit(:id)
    comment = Comment.find_by!(id: permitted_params[:id])
    comment.destroy
  end
  
  # rename comment column
  def comment_params
    params.require(:comment).permit(:user_id, :recipe_id, :comment)
  end

end
