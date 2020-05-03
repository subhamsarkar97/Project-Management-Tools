class SessionsController < ApplicationController
  
  skip_before_action :authorized, only: [:new, :create, :welcome]
  def index
  end  
  
  def new
  end

  def create
      @user = User.find_by(username: params[:username])   
      if @user && @user.authenticate(params[:password])      
          session[:user_id] = @user.id      
          redirect_to user_path(@user)  
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
    session.delete(:user_id)
    redirect_to welcome_path
  end  
end
