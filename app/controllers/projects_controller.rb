class ProjectsController < ApplicationController
    before_action :authorized, only: [:create, :new, :show, :edit, :update]
       
    def create
        @user = User.find(params[:user_id])
        @project = @user.projects.build(post_params)

        if @project.save
            session[:project_id] = @project.id
            redirect_to user_projects_profile_path, success: "Projects is created"
        else
            redirect_to create_project_path, danger: "Fields can not be empty !!"
        end        
    end

    def show
        @user_id = current_user.id
        @user = User.find(params[:user_id])
        @project = @user.projects.find(params[:id])
        session[:project_id] = @project.id
    end   

    def createfeature
        @project_id = current_project.id
        @user_id = current_user.id
    end    
    
    def projects
        @user = User.find(params[:user_id])
    end   

    def edit
        @user_id = current_user.id
        @user = User.find(params[:user_id])
        @project = Project.find(params[:id])
    end    
    
    def update
        @user_id = current_user.id
        @user = User.find(params[:user_id])
        @project = Project.find(params[:id])
        if @project.update(post_params)
            redirect_to user_projects_profile_path, success: "Projects is updated"     
        else
            render 'edit', danger: "Fields can not be empty !!"
        end        
    end    
 
    private 
    def post_params
        params.require(:project).permit(:projectname)
    end   
    

    
    def destroy
    end         
end
