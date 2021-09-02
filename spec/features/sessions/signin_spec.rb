require 'rails_helper'

describe "the signin process", type: :feature do
  let(:user){create(:user)}
  
  it "signs me in" do
    visit '/signin'
    within("form") do
      fill_in 'email', with: user.email
      fill_in 'password', with: user.password
    end
      click_button 'Sign in'
      expect(page.current_path).to eq recipes_path
  end


  it "sign in fails with no details" do
    visit '/signin'
    within("form") do
      fill_in 'email', with: ''
      fill_in 'password', with: ''
    end
      click_button 'Sign in'
      expect(page.current_path).to eq signin_path
  end
end