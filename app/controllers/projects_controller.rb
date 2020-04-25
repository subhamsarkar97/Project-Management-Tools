class ProjectsController < ApplicationController
    def index
        @project = Project.all.order("Created_at DESC")
    end    
    
    def new
        @project = Project.new
    end
    def show
        @project = Project.find(params[:id])
    
    end    
    def create
        @project = Project.new(post_params)

        if @project.save
            redirect_to @project
        else
            redirect_to '/projects/new'
        end        
    end
    private def post_params
        params.require(:project).permit(:projectname)
    end    
    def edit
    end
    def destroy
    end         
end
