class FeaturesController < ApplicationController
    before_action :authorized, only: [:create, :new, :show, :edit, :update, :index, :view, :savetask]
    before_action :get_user_id, only: [:index, :new, :edit, :update, :show,:view]
    before_action :get_feature, only: [:edit, :update, :show]
    
    def get_user_id
        @user_id = current_user.id
    end   
    
    def get_feature
        @feature = Feature.find(params[:id])
    end    
    
    def index
        @feature = Feature.where(["identity_token LIKE ?",params[:search]]).or(Feature.where(["title LIKE ?",params[:search]]))
    end  
    
    def new
        @feature = Feature.new
        @task = @feature.jobs.build
    end
    
    def create
        @feature = Feature.new(feature_params)
        if @feature.save
            FeatureMailer.with(feature: @feature).assign_feature.deliver
            redirect_to @feature, success: "Feature is created"
        else
            flash[:danger] = "Feature title should not be same and fields can not stay empty !!"
            redirect_to new_feature_path
        end    
    end

    def edit
    end

    def update
        if @feature.update(feature_params)
            FeatureMailer.with(feature: @feature).update_feature.deliver
            redirect_to @feature, success: "Feature is Updated"
        else
            render 'edit', danger: "Fields can not be empty !!"
        end           
    end

    def view

    end  
    
    def show
        @user_name = current_user.firstname
        session[:feature_id] = @feature.id
    end   

    private 
    def feature_params
        params.require(:feature).permit(:mailId ,:title, :description, :picture, :project_id ,:panels, :feature_work_status, :user_id, :status, :identity_token, jobs_attributes: [ :id, :_destroy, :taskname, :description, :feature_id, :done])
    end 

end
