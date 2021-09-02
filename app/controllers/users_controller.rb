class UsersController < ApplicationController
  # /signup
  
    def index
      @user = User.all
      render :index, user: @user 
    end
  
    def create
      user_exists = User.exists?(email: params[:email])  
      if user_exists
        redirect_to signin_path, success: 'Successfully created an account'
      else
        @user = User.create(user_params)
        redirect_to signup_path, notice: 'Creating account failed'
      end
    end
  
    def user_params
      params.permit(:name, :email, :password)
    end
end
  