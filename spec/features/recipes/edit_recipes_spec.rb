require 'rails_helper'

describe "Recipe test", type: :feature do
  let!(:user){create(:user)}
  let(:recipe){create(:recipe, user: user)}
  let!(:comment){create(:comment, recipe: recipe, user: user)}

  it "edits recipe" do
    visit signin_path
    within("form") do
      fill_in 'email', with: user.email
      fill_in 'password', with: user.password
    end
    click_button 'Sign in'
    
    visit edit_recipe_path(recipe.id) 
    within("form") do
      fill_in 'title', with: 'This is the new recipe title'
      # find_field(id: 'user_id', type: :hidden).set(user.id)
    end
      click_button 'Edit recipe'
      expect(page.current_path).to eq recipes_path
  end

end