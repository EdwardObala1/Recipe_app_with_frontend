require 'rails_helper'

RSpec.describe Recipe, type: :model do
  let(:user) {create(:user)}
  let!(:recipe){create(:recipe, user: user) }
    it { should validate_presence_of(:title) }
    it { should belong_to(:user) }
    it { should validate_presence_of(:body) }
end
