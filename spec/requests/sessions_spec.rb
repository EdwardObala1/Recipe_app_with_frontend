require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  let (:params_values) {{name: "Edward", email: "eddy@yahoo.com", password: "password"}}
  
  describe 'Signin' do
    describe '/Get' do 
      it '/signin' do
        get signin_path
        expect(response).to have_http_status(200)
      end

      describe 'Functionality' do
        it 'checks for user sign in using details and asssign a session' do
          User.create(params_values)
          post signin_path, :params => params_values
          expect(session[:user_id]).not_to eq(nil)
        end

        it 'sign in fails without details and not session is assigned' do
          User.create(params_values)
          post signin_path
          expect(session[:user_id]).to eq(nil)
        end

      describe '/logout' do
        describe 'GET' do
          it "checks if the logout page is loaded with no content" do
            get logout_path
            expect(response).to have_http_status(200)
          end
        end
      end

      describe 'Functioality' do
        it 'checks if the logout page ends the session' do
          User.create(params_values)
          post signin_path, :params => params_values
          post logout_path 
          expect(session[:user_id]).to eq(nil)
          expect(response.status).to eq(302)
          end
        end
      end 

    end 
  end
end
