class ProjectsController < ApplicationController
    before_action :authorized, only: [:create, :new, :show]
       
    def create
        @user = User.find(params[:user_id])
        @project = @user.projects.build(post_params)

        if @project.save
            session[:project_id] = @project.id
            redirect_to user_projects_profile_path
        else
            redirect_to new_user_project_path
        end        
    end

    def show
        @user = User.find(params[:user_id])
        @project = @user.projects.find(params[:id])
        session[:project_id] = @project.id
    end   
    
    def projects
        @user = User.find(params[:user_id])
        
    end   
 
    private 
    def post_params
        params.require(:project).permit(:projectname)
    end   
    
    def edit
    end
    
    def destroy
    end         
end
