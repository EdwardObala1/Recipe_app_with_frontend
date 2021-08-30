class SessionsController < ApplicationController
  def index
    # @user = User.all
    render json: @user.to_json
  end
    
  def show
    @user = User.all
    if @user.exists?(email: params[:email])
        # notice 'User exists'
      if @user.find_by(email: params[:email]).password == params[:password]
        # notice 'Successful authentification'
        session[:user_id] = @user.ids
      end
    else 
    #   notice 'User doess not exist'
    end
  end
    
  def logout
    render :json => {}
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
