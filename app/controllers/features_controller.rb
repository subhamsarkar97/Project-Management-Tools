class FeaturesController < ApplicationController
    before_action :authorized, only: [:create, :new, :show, :edit, :update, :index, :view]
    def index
      @user_id = current_user.id
      @project_id = current_project.id
      @feature = Feature.where(["identity_token LIKE ?",params[:search]]).or(Feature.where(["title LIKE ?",params[:search]]))
    end  
    def new
      @user_id = current_user.id
      @feature = Feature.new
      @task = @feature.jobs.build
    end
    
    def create
      @feature = Feature.new(feature_params)
      if @feature.save
          redirect_to @feature
      else
          redirect_to new_feature_path
      end    
    end

    def edit
      @user_id = current_user.id
      @feature = Feature.find(params[:id])
    end

    def update
      @feature = Feature.find(params[:id])
        if @feature.update(feature_params)
            redirect_to @feature
        else
            render 'edit'
        end           
    end


    def view
    end  
    
    def show
      @user_id = current_user.id
      @user_name = current_user.firstname
      @feature = Feature.find(params[:id])
    end
    
    private 
    def feature_params
      params.require(:feature).permit(:mailId ,:title, :description, :picture, :project_id ,:panels, :feature_work_status, :user_id, :status, :identity_token, jobs_attributes: [ :id, :_destroy, :taskname, :description, :feature_id])
    end 

end
