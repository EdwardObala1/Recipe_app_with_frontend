class UsersController < ApplicationController
  # /signup
  
    def index
      @user = User.all
      render json: @user.to_json
    end
  
    def create
      user_exists = User.exists?(email: params[:email])  
      if user_exists
      #   notice 'Email in use if these are your details sign in or create a new account'
      else
        @user = User.create(user_params)
        redirect_to signin_path
      end
    end
  
    def user_params
      params.permit(:name, :email, :password)
    end
end
  