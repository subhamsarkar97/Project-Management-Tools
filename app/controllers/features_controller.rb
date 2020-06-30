class FeaturesController < ApplicationController
    before_action :authorized, only: [:create, :new, :show, :edit, :update, :index, :savetask, :get_project]
    before_action :get_user_id, only: [:index, :new, :edit, :update, :show, :destroy]
    before_action :get_feature, only: [:edit, :update, :show]
    before_action :get_project, only: [:new, :show, :edit]
    
    def get_user_id
        @user_id = current_user.id
    end   
    
    def get_feature
        @feature = Feature.find(params[:id])
    end    
    
    def index
        @feature = Feature.where(["identity_token LIKE ?",params[:search]]).or(Feature.where(["title LIKE ?",params[:search]]))
    end  

    def get_project
        @project = current_project
    end    
    
    def new
        @feature = Feature.new
        @task = @feature.jobs.build
    end
    
    def create
        @feature = Feature.new(feature_params)
        if @feature.save
            session[:feature_id] = @feature.id
            FeatureMailer.with(feature: @feature).assign_feature.deliver
            redirect_to @feature, success: "Feature is created and a confirmation mail is sent to the assigned memeber account"
        else
            flash[:danger] = "Fields can not stay empty or may be feature name provided is already there in database !!"
            redirect_to user_project_path(user_id: current_user.id, id: current_project.id)
        end    
    end

    def edit
    end

    def update
        if @feature.update(feature_params)
            FeatureMailer.with(feature: @feature).update_feature.deliver
            redirect_to @feature, success: "Feature is Updated and a confirmation mail is sent to the assigned memeber account"
        else
            flash[:danger] = "Fields can not be empty and may be feature name provided is already there in database and please give a picture for the features !!"
            redirect_to edit_feature_path(project_id: current_project.id)
        end           
    end
    
    def show
        session[:feature_id] = @feature.id
    end 

    def savetask
        Job.update_all(["completed_at = ?", Time.now])
        redirect_to feature_path(current_feature.id)
    end  
  
    
    def destroy
        @feature = Feature.find(params[:id])
        @feature.destroy
        DeleteFeatureMailer.with(feature: @feature).delete_mail.deliver
        redirect_to user_path(current_user.id), success: "Feature is deleted and a confirmation mail is sent."
    end    


    private 
    def feature_params
        params.require(:feature).permit(:mailId ,:title, :description, :picture, :project_id ,:panels, :user_id, :status, :identity_token, :panel_search, :unique_id ,jobs_attributes: [ :id, :_destroy, :taskname, :description, :feature_id, :completed_at])
    end 

end
