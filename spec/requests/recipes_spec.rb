require 'rails_helper'

RSpec.describe "/recipes", type: :request do
  let(:user) {create(:user)}
  let!(:recipe){create(:recipe, user: user) }

  describe "GET /recipes and GET /recipe/ID" do

    it "opens recipe list" do
      get recipes_path
      expect(response.status).to eq(200)
    end

    it "opens recipe page with specific ID" do
      get recipes_path(:id), :params => {id: recipe.id}
      expect(response.status).to eq(200)
    end
  end

  describe 'functionality' do
    it 'allows the user to add a recipe' do
      expect do
        post recipes_path, :params => {recipe: {title: recipe.title, body: recipe.body, ingredients: recipe.ingredients, user_id: user.id}}
      end.to change {Recipe.count}.by(1)
    end

    it 'allows the user to edit a recipe' do
      patch recipes_edit_path(recipe.id), :params => {recipe: {title: 'New title after edit'}}
      expect((Recipe.find_by(id: recipe.id)).title == 'New title after edit') .to eq(true)
    end

    it 'allows the user to delete a recipe' do
      delete recipes_delete_path(recipe.id)
      expect(Recipe.exists?(id: recipe.id)) .to eq(false)
    end
  end

  describe 'User functionalities in recipe page' do
    it 'User adds recommendation' do
      expect do
        patch recommend_path(recipe.id)
      end.to change {Recipe.find_by!(id: recipe.id).recommendations}.by(1)
    end
  end
end
