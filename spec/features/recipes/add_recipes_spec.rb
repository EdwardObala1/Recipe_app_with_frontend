require 'rails_helper'

describe "Recipe test", type: :feature do
  let!(:user){create(:user)}
  let(:recipe){create(:recipe, user: user)}
  let!(:comment){create(:comment, recipe: recipe, user: user)}

  it "Adds recipe" do
    visit signin_path
    within("form") do
      fill_in 'email', with: user.email
      fill_in 'password', with: user.password
    end
    click_button 'Sign in'

    visit recipes_add_path
    within("form") do
      fill_in 'title', with: recipe.title
      fill_in 'body', with: recipe.body
      fill_in 'ingredients', with: recipe.ingredients
      
    end
      click_button 'Add recipe'
      expect(page.current_path).to eq recipes_path
  end

end