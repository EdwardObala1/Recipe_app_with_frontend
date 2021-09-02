require 'rails_helper'

describe "Recipe test", type: :feature do
  let!(:user){create(:user)}
  let(:recipe){create(:recipe, user: user)}
  let!(:comment){create(:comment, recipe: recipe, user: user)}

  it "Adds recipe" do
    visit recipes_path
    within("form") do
      fill_in 'title', with: recipe.title
      fill_in 'body', with: recipe.body
      fill_in 'ingredients', with: recipe.ingredients
      fill_in 'user_id', with: recipe.user_id
      # find_field(id: 'user_id', type: :hidden).set(user.id)
    end
      click_button 'Add recipe'
      expect(page.current_path).to eq recipes_path
  end

end