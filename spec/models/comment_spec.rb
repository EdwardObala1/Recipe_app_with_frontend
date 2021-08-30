require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) {create(:user)}
  let(:recipe){create(:recipe) }
  let!(:comment){create(:comment, user: user, recipe: recipe) }
    it { should belong_to(:user) }
    it { should belong_to(:recipe) }
    it { should validate_presence_of(:comment) }
end
