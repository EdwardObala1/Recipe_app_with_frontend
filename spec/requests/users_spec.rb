require 'rails_helper'

RSpec.describe "/users", type: :request do
  let (:params_values) {{name: "Edward", email: "eddy@yahoo.com", password: "password"}}
  
  describe 'Signup' do
    describe "GET" do
      it "/signup with content in it gives a 200" do
        get signup_path
        expect(response).to have_http_status(200)
      end
    end

    describe 'Functionality' do
      it 'Sign up with the details adds data to DB' do
        count = User.count 
        post signup_path, :params => params_values
        expect(User.count).to eq(count + 1)
      end

      it 'Sign up fails with no details' do
        user_count = User.count 
        post signup_path
        expect(User.count).not_to eq(user_count+1)
      end
      
      it 'redirects to sign in when sign up is succcessful' do
        post signup_path, :params => params_values
        expect(response.status).to eq(302)
      end 
    end

  end 
end
