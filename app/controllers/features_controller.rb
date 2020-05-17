class FeaturesController < ApplicationController
    before_action :authorized, only: [:create, :new, :show]
    def new
      @feature = current_project.features.build
      @task = @feature.jobs.build
    end
    
    def create
      @feature = current_project.features.build(feature_params)
      if @feature.save
          redirect_to @feature
      else
          redirect_to new_feature_path
      end    
          
    end

    def edit
      @feature = Feature.find(params[:id])
      @project = Project.find(@feature.project_id) 
    end

  def update
    @feature = Feature.find(params[:id])
    @project = Project.find(@feature.project_id)
      
      if @feature.update(feature_params)
          redirect_to @feature
      else
          render 'edit'
      end        
  
  end    

    def show
      
      @feature = Feature.find(params[:id])
      @project = Project.find(@feature.project_id)
    end
    
    private 
    def feature_params
      params.require(:feature).permit(:title, :description, :picture, :panels, :status , jobs_attributes: [ :id, :_destroy, :taskname, :description, :feature_id])
    end 

end
