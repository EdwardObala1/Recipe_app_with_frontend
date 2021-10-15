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
      get show_recipe_path(recipe.id)
      expect(response.status).to eq(200)
    end

    it 'opens page to add recipe' do
      get recipes_add_path, :params => {id: recipe.id}
      expect(response.status).to eq(200)
    end
  end

  describe 'functionality' do
    it 'allows the user to add a recipe' do
      expect do
        post signin_path, :params => {name: user.name, email: user.email, password: user.password}
        post recipes_path, :params => {recipe: {title: recipe.title, body: recipe.body, ingredients: recipe.ingredients, user_id: user.id}}
      end.to change {Recipe.count}.by(1)
    end

    it 'allows the user to edit a recipe' do
      post signin_path, :params => {name: user.name, email: user.email, password: user.password}
      patch recipe_edited_path(recipe.id), :params => {recipe: {title: 'New title after edit'}}
      expect((Recipe.find_by(id: recipe.id)).title == 'New title after edit') .to eq(true)
    end

    it 'allows the user to delete a recipe' do
      post signin_path, :params => {name: user.name, email: user.email, password: user.password}
      delete recipes_delete_path(recipe.id)
      expect(Recipe.exists?(id: recipe.id)) .to eq(false)
    end
  end

  describe 'User functionalities in recipe page' do
    it 'User adds recommendation' do
      expect do
        post signin_path, :params => {name: user.name, email: user.email, password: user.password}
        patch recommend_path(recipe.id)
      end.to change {Recipe.find_by!(id: recipe.id).recommendations}.by(1)
    end
  end

  describe '/recipes' do
    it 'returns a list of all the Recipes' do
      get recipes_path, :headers => {Accept: 'application/json'}
      expect(JSON.parse(response.body)).to_not eq(nil)
    end

    it 'returns a list of one recipe' do
      get show_recipe_path(recipe.id), :headers => {Accept: 'application/json'}
      expect(JSON.parse(response.body)).to_not eq(nil)
    end
  end
end
