class ProjectMailer < ApplicationMailer
    
    def add_project
        @url = 'http://localhost:3000/welcome'
        @user = params[:user]
        mail(to: @user.username, subject: 'Project is Created')
    end    

    def delete_project
        @user = params[:user]
        mail(to: @user.username, subject: 'Project is Deleted')
    end    
end
