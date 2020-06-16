class ProjectsController < ApplicationController
    before_action :authorized, only: [:create, :new, :show, :projects ,:edit, :update, :get_user, :get_project1, :get_project, :get_user_id, :view]
    before_action :get_user, except: [:view]
    before_action :get_project1, only: [:show]
    before_action :get_project, only: [:edit, :update]
    before_action :get_user_id, except: [:create, :projects]
      
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
            ProjectMailer.with(user: @user).add_project.deliver
            session[:project_id] = @project.id
            redirect_to user_projects_profile_path, success: "Projects is created and a mail is sent"
        else
            redirect_to create_project_path, danger: "Please fill the field properly !!"
        end        
    end

    def show
        session[:project_id] = @project.id
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
        @user = current_user
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
        ProjectMailer.with(user: @user).add_project.deliver
        redirect_to user_path(current_user.id), success: "Project is deleted as well as the features if any and a confirmation is also send !!"  
    end    

 
    private 
    def post_params
        params.require(:project).permit(:projectname)
    end   
    
end
