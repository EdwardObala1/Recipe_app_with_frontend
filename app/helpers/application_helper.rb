module ApplicationHelper
    def user_signed_in?
      session[:user_id] != nil ? true : false 
    end
end
