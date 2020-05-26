class ProjectsController < ApplicationController
    before_action :authorized, only: [:create, :new, :show, :edit, :update]
    before_action :get_user, except: [:createfeature]
    before_action :get_project, only: [:show]
      
    def get_user
        @user = User.find(params[:user_id])
    end 
    
    def get_project
        @project = @user.projects.find(params[:id])
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
        @user_id = current_user.id
        session[:project_id] = @project.id
    end   

    def createfeature
        @project_id = current_project.id
        @user_id = current_user.id
    end    
    
    def projects
    end   

    def edit
        @user_id = current_user.id
        @project = Project.find(params[:id])
    end    
    
    def update
        @user_id = current_user.id
        @project = Project.find(params[:id])
        if @project.update(post_params)
            redirect_to user_projects_profile_path, success: "Projects is updated"     
        else
            render 'edit', danger: "Please fill the fields properly !!"
        end        
    end    
 
    private 
    def post_params
        params.require(:project).permit(:projectname)
    end   
    
end
