class SessionsController < ApplicationController
  def index
    @user = User.all
    render :index, users: @user
  end
    
  def show
    @user = User.all
    if @user.exists?(email: params[:email])
        # notice 'User exists'
      if @user.find_by(email: params[:email]).password == params[:password]
        session[:user_id] = @user.ids
        redirect_to recipes_path, success: 'Successfully signed in'
      end
    else 
      redirect_to signin_path, notice: 'Sign in failed'
    end
  end
    
  def logout
    render :logout
  end
    
  def destroy
    if request.post?
      session[:user_id] = nil
      redirect_to root_path, notice: "You are signed out"   
    else 
      render :json => {}
    end
  end

  def user_params
    params.permit(:name, :email, :password)
  end
end
