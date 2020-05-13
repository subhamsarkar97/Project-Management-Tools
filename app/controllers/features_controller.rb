class FeaturesController < ApplicationController
    before_action :authorized, only: [:create, :new, :show]
    
    def new
        @feature = current_project.features.build
    end
    
    def create
        @feature = current_project.features.build(features_params)
        if @feature.save
          flash[:success] = "Feature created!"
          redirect_to @feature 
        else
          redirect_to new_feature_path
        end
    end

    private
    def features_params
        params.require(:feature).permit(:title, :description, :picture)
    end    
    
    def show
        
    end    

end
