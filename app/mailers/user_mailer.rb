class UserMailer < ApplicationMailer

    def welcome_email
        @user = params[:user]
        @url  = 'http://localhost:3000/login'
        mail(to: @user.username, subject: 'Welcome to Project Management Tool App.')
    end    
end
