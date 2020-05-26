class UsersController < ApplicationController
    skip_before_action :authorized, only: [:new, :create]
  
  
    def new
        @user = User.new
    end
  
    def create
        @user = User.new(user_params)
        if @user.save
            UserMailer.with(user: @user).welcome_email.deliver
            session[:user_id] = @user.id
            redirect_to user_path(@user), success: "Welcome to the project management app !!!"
        else
            redirect_to new_user_path, danger: "Please fill all the fields correctly"
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
            redirect_to @user,success: "Informations are updated"
        else
            render 'edit',danger: "Please fill all the Column"
        end        
    end  
  
    private 
    def user_params
        params.require(:user).permit(:username, :password, :firstname, :lastname, :gender, :reset_digest, :reset_sent_at)
    end  
end
