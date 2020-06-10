class ApplicationController < ActionController::Base
    before_action :authorized
    helper_method :current_user
    helper_method :logged_in?
    before_action :set_user

    add_flash_types :danger, :info, :warning, :success

    def save_in_params(auth_hash)
        session[:graph_token_hash] = auth_hash.dig(:credentials)
        session[:firstname] = auth_hash.dig(:extra, :raw_info, :displayName)
        session[:username] = auth_hash.dig(:extra, :raw_info, :mail) ||
                               auth_hash.dig(:extra, :raw_info, :userPrincipalName)
    end

    def access_token
        session[:graph_token_hash][:token]
    end
    
    def firstname
        session[:firstname]
    end
    
    def username
        session[:username]
    end
    
    def set_user
        @user_name = firstname
        @user_email = username
    end
      
    def current_user
        if (user_id = session[:user_id])
            @current_user ||= User.find_by(id: user_id)
        elsif (user_id = cookies.signed[:user_id])
            user = User.find_by(id: user_id)
            if user && user.authenticated?(cookies[:remember_token])
                session[:user_id] = user.id
                @current_user = user
            end
        else
            @username = firstname
            @useremail = username   
        end
    end
    
    def remember(user)
        user.remember
        cookies.permanent.signed[:user_id] = user.id
        cookies.permanent[:remember_token] = user.remember_token
    end

    def forget(user)
        user.forget
        cookies.delete(:user_id)
        cookies.delete(:remember_token)
    end
    
    def  current_project
        @current_project ||= Project.find_by(id: session[:project_id])
    end
    
    def  current_feature
        @current_feature ||= Feature.find_by(id: session[:feature_id])
    end  
    
    def logged_in?
        !current_user.nil?
    end  
    
    def authorized   
        redirect_to welcome_path unless logged_in?
    end
    
end
