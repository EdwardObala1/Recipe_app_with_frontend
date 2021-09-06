require 'rails_helper'

describe "Add Comment", type: :feature do
  let!(:user){create(:user)}
  let(:recipe){create(:recipe, user: user)}
  let!(:comment){create(:comment, recipe: recipe, user: user)}

  it "Add Commment" do
    visit signin_path
    within("form") do
      fill_in 'email', with: user.email
      fill_in 'password', with: user.password
    end
    click_button 'Sign in'
    
    visit show_recipe_path(recipe.id)
    within("form") do
      fill_in 'comment', with: 'This food is trash'
      
    end
      click_button 'Add comment'
      expect(page.current_path).to eq recipes_path
  end

end