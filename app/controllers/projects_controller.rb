class ProjectsController < ApplicationController
    before_action :authorized, only: [:create, :new, :show, :edit, :update, :get_user, :get_project1, :get_project, :get_user_id, :createfeature, :view]
    before_action :get_user, except: [:createfeature, :view]
    before_action :get_project1, only: [:show]
    before_action :get_project, only: [:edit, :update]
    before_action :get_user_id, except: [:create, :project]
      
    def get_user
        @user = User.find(params[:user_id])
    end 
    
    def get_project1
        @project = @user.projects.find(params[:id])
    end    

    def get_project
        @project = Project.find(params[:id])
    end  
    
    def get_user_id
        @user_id = current_user.id
    end 
    
    def create
        @project = @user.projects.build(post_params)
        if @project.save
            session[:project_id] = @project.id
            redirect_to user_projects_profile_path, success: "Projects is created"
        else
            redirect_to create_project_path, danger: "Please fill the field properly !!"
        end        
    end

    def show
        session[:project_id] = @project.id
    end   

    def createfeature
        @project_id = current_project.id
    end    
    
    def projects
    end   

    def edit
    end    
    
    def update
        if @project.update(post_params)
            redirect_to user_projects_profile_path, success: "Projects is updated"     
        else
            render 'edit', danger: "Please fill the fields properly !!"
        end        
    end 
    
    def view
        if params[:panel_search] == "Current_itteration"
            @feature = Feature.where(" project_id = ? AND panels = ? ", current_project.id, params[:panel_search])
        elsif params[:panel_search] == "Backlog"
            @feature = Feature.where(" project_id = ? AND panels = ? ", current_project.id, params[:panel_search])
        elsif params[:panel_search] == "Icebox"
            @feature = Feature.where("project_id = ? AND panels = ? ", current_project.id, params[:panel_search])    
        end 
    end 
    
    def destroy
        @project = Project.find(params[:id])
        @features = Feature.where(project_id: @project.id)
        @features.each do |feature|
            feature.destroy
        end
        @project.destroy
        redirect_to user_path(current_user.id), success: "Project is deleted as well as the features if any !!"  
    end    

 
    private 
    def post_params
        params.require(:project).permit(:projectname)
    end   
    
end
