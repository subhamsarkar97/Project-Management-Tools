class PasswordResetsController < ApplicationController
    skip_before_action :authorized, only: [:new, :create, :edit, :update]
    
    def new
    end

    def create
        @user = User.find_by(username: params[:password_reset][:username].downcase)
        if @user
            @user.create_reset_digest
            @user.send_password_reset_email
            redirect_to welcome_path, success: "Email sent with password reset instructions"
        else
            redirect_to new_password_reset_path, danger: "Email address not found"
        end
    end  

    def edit
    end
    
    def update
    end  

end
