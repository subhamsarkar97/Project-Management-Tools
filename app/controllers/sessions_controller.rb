class SessionsController < ApplicationController
    skip_before_action :authorized, only: [:new, :create, :welcome]
    def index
    end  
  
    def new
    end
    
    def create
        user = User.find_by(username: params[:username])   
        if user && user.authenticate(params[:password])       
            session[:user_id] = user.id
            params[:remember_me] == '1' ? remember(user) : forget(user)
            redirect_to user  
        else  
            flash[:alert] = "Invalid username/password combination"    
            redirect_to login_path
        end  
    end
    
    def login
    end

    def welcome
    end
    
    def page_requires_login
    end  
  
    def destroy
        forget(current_user)
        session.delete(:user_id)
        @current_user = nil
        redirect_to welcome_path
    end  
end
