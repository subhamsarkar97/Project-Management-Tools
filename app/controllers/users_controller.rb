class UsersController < ApplicationController
  
  skip_before_action :authorized, only: [:new, :create]
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(post_params)
    if @user.save
        flash[:success] = "Welcome to the Sample App!"
        session[:user_id] = @user.id
        redirect_to authorized_path
    else
        redirect_to new_user_path
    end    
        
  end
  
  private 
  def post_params
    params.require(:user).permit(:username, :password)
  end  
end
