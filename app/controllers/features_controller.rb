$global_variable = 0
class FeaturesController < ApplicationController
    before_action :authorized, only: [:create, :new, :show, :edit, :update, :index, :view, :savetask]
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
            redirect_to @feature, success: "Feature is created"
        else
            if params[:panels] == "Current itteration"
                redirect_to new_feature_path({panel: "Current itteration",project_id: params[:id],feature_work_status: "Finalised"})
            elsif params[:panels] == "Backlog"
                redirect_to new_feature_path({panel: "Backlog",project_id: params[:id], feature_work_status: "Done"})
            else
                new_feature_path({panel: "Icebox",project_id: params[:id], feature_work_status: "Done"})         
            end
        end    
    end

    def edit
        @user_id = current_user.id
        @feature = Feature.find(params[:id])
    end

    def update
        @user_id = current_user.id
        @feature = Feature.find(params[:id])
        if @feature.update(feature_params)
            redirect_to @feature, success: "Feature is Updated"
        else
            render 'edit', danger: "Fields can not be empty !!"
        end           
    end


    def view
    end  
    
    def show
        @user_id = current_user.id
        @user_name = current_user.firstname
        @feature = Feature.find(params[:id])
        session[:feature_id] = @feature.id
    end

    def savetask
        b = $global_variable
        @variables = increment(b); 
        $global_variable = @variables
        @feature = current_feature
        @job = Job.find_by(feature_id: @feature.id)
        @feature.jobs.done = @variables
        #params[:done] == '1' ? checked() : unchecked()
        if @job.save
            redirect_to @feature
        end
        
    end    

    
    private 
    def feature_params
        params.require(:feature).permit(:mailId ,:title, :description, :picture, :project_id ,:panels, :feature_work_status, :user_id, :status, :identity_token, jobs_attributes: [ :id, :_destroy, :taskname, :description, :feature_id, :done])
    end 
end
