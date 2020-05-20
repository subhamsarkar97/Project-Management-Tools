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
        redirect_to user_path(@user)
    else
        redirect_to new_user_path
    end    
        
  end

  def createproject
    @user = current_user
    @user_id = current_user.id
  end  
  
  def show
    @user = User.find(params[:id])
  end

  def edit 
    @user = User.find(params[:id])
  end
  
  def update
      @user = User.find(params[:id])
      if @user.update(user_params)
          redirect_to @user
      else
          render 'edit'
      end        
  end  
  
  private 
  def post_params
    params.require(:user).permit(:username, :password, :firstname, :lastname, :gender)
  end  
end
