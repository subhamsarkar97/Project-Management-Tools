class ApplicationController < ActionController::Base
    
    before_action :authorized
    helper_method :current_user
    helper_method :logged_in?

    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end    

    def  current_project
        @current_project ||= Project.find_by(id: session[:project_id])
    end    
    
    def logged_in?
        !current_user.nil?
    end  
    
    def authorized   
        redirect_to welcome_path unless logged_in?
    end    

end
