class FeaturesController < ApplicationController
    before_action :authorized, only: [:create, :new, :show]
    def new
      @feature = current_project.features.build
    end
    
    def create
      @feature = current_project.features.build(feature_params)
      if @feature.save
          redirect_to @feature
      else
          redirect_to new_feature_path
      end    
          
    end
    def show
      
      @feature = Feature.find(params[:id])
      @project = Project.find(@feature.project_id)
    end
    
    private 
    def feature_params
      params.require(:feature).permit(:title, :description, :picture)
    end 

end
