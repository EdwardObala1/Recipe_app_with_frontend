require 'rails_helper'

describe "the signup process", type: :feature do
  let(:user){create(:user)}
  
  it "creates account" do
    visit '/signup'
    within("form") do
      fill_in 'name', with: user.name
      fill_in 'email', with: user.email
      fill_in 'password', with: user.password
    end
      click_button 'Sign up'
      expect(page.current_path).to eq signin_path
  end

  it "creating an account fails with no details" do
    visit '/signup'
    within("form") do
      fill_in 'name', with: ''
      fill_in 'email', with: ''
      fill_in 'password', with: user.password
    end
      click_button 'Sign up'
      expect(page.current_path).to eq signup_path
  end
end