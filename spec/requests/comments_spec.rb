require 'rails_helper'

RSpec.describe "Comments", type: :request do
  let(:user){create(:user)}
  let(:recipe){create(:recipe, user: user)}
  let!(:comment){create(:comment, recipe: recipe, user: user)}

  it 'adds a comment' do
    expect do 
      post post_comment_path, :params => {comment: {user_id:comment.user.id, recipe_id: comment.recipe.id, comment: comment.comment}}
    end.to change {Comment.count}.by(1)
  end

  it 'delete a comment' do
    post delete_comment_path, :params => {comment: {id: comment.id}}
    expect(Comment.exists?(id: comment.id)) .to eq(false)
  end
end
